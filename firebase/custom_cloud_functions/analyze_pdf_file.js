const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const { Configuration, OpenAIApi } = require("openai");
const fs = require("fs");
const pdf = require("pdf-parse");
const cors = require("cors")({ origin: true });

const db = admin.firestore();

const configuration = new Configuration({
  apiKey: "", // Замените YOUR_OPENAI_API_KEY на ваш ключ API OpenAI
});
const openai = new OpenAIApi(configuration);

exports.analyzePdfFile = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      // Получение ссылки на файл и id пользователя из тела запроса
      const { fileUrl, userId } = req.body.data;

      // Проверка, что fileUrl и userId были переданы
      if (!fileUrl || !userId) {
        console.log("Error: fileUrl and userId are required");
        console.log(req.body.data);
        res.status(400).send("fileUrl and userId are required");
        return;
      }

      console.log(`Received fileUrl: ${fileUrl}`);
      console.log(`Received userId: ${userId}`);

      // Скачивание файла по ссылке
      const response = await axios({
        url: fileUrl,
        responseType: "arraybuffer",
      });

      const data = response.data;

      // Сохранение файла на диск
      const filePath = "/tmp/tempfile.pdf";
      fs.writeFileSync(filePath, data);

      // Чтение и парсинг PDF файла
      const dataBuffer = fs.readFileSync(filePath);
      const pdfData = await pdf(dataBuffer);
      const fileContent = pdfData.text;

      console.log(`Extracted text: ${fileContent}`);

      // Удаление временного файла
      fs.unlinkSync(filePath);

      // Анализ файла с использованием GPT-3.5
      const completion = await openai.createChatCompletion({
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content: "Ты ассистент, который помогает анализировать файлы.",
          },
          {
            role: "user",
            content: `Проанализируй следующий файл и выдай саммари по следующим пунктам: 
Проф компетенции:

1. Технические навыки:
   - Глубокие знания и опыт работы с конкретными технологиями, языками программирования, фреймворками и инструментами (например, Java, Python, JavaScript, React, AWS и т.д.).
   - Опыт работы с системами контроля версий (например, Git).
   - Понимание принципов и паттернов проектирования программного обеспечения.

2. Проблемное мышление и аналитические способности:
   - Способность анализировать сложные задачи и предлагать эффективные решения.
   - Навыки оптимизации и рефакторинга кода.
   - Умение проводить тестирование и отладку программного обеспечения.

3. Опыт работы в команде и коммуникативные навыки:
   - Способность эффективно работать в межфункциональных командах.
   - Навыки межличностного общения, необходимые для обсуждения требований с заказчиками и взаимодействия с другими членами команды.
   - Опыт использования Agile/Scrum методологий.

4. Способность к самообучению и адаптивность:
   - Постоянное стремление к профессиональному росту и освоению новых технологий.
   - Готовность быстро адаптироваться к новым инструментам и методам работы.
   - Навыки самообразования и самоорганизации.

5. Управление проектами и временными ресурсами:
   - Умение планировать и управлять своими задачами и сроками.
   - Опыт в использовании инструментов для управления проектами (например, YouGile, Trello).
   - Способность к многофункциональной работе и расстановке приоритетов.
   
   Личностные компетенции:

1. Коммуникабельность:
   - Умение ясно и эффективно выражать свои мысли как устно, так и письменно.
   - Способность активно слушать и понимать потребности коллег и клиентов.
   - Навыки ведения конструктивных переговоров и разрешения конфликтов.

2. Ответственность и надежность:
   - Высокий уровень ответственности за выполнение своих задач и проектов.
   - Надежность в соблюдении сроков и обязательств.
   - Способность признавать ошибки и учиться на них.

3. Критическое мышление и инициативность:
   - Умение анализировать информацию и принимать обоснованные решения.
   - Способность предлагать и внедрять улучшения и инновации.
   - Инициативность в поиске и решении проблем до их эскалации.

4. Эмоциональный интеллект:
   - Способность понимать и управлять своими эмоциями и эмоциями других.
   - Навыки эмпатии и понимания эмоционального состояния коллег.
   - Способность сохранять спокойствие и продуктивность в стрессовых ситуациях.

5.Гибкость и адаптивность:
   - Готовность адаптироваться к изменениям в проекте, технологии или методологии.
   - Способность быстро обучаться новым навыкам и инструментам.
   - Открытость к обратной связи и готовность вносить коррективы в свою работу.

 Ответь по каждому пункту не более 1 предложения. Каждый пункт с новой строки. Разделы профессиональный компетенции и личные выдели.  Пункты пронумеруй.
Сам файл: ${fileContent}`,
          },
        ],
        max_tokens: 1000,
      });

      const analysisResult = completion.data.choices[0].message.content;

      // Запись результата в Firestore
      await db.collection("users").doc(userId).update({
        resume_summary: analysisResult,
        isResumeParsingFinished: true,
      });

      // Отправка ответа
      res.status(200).json({ message: analysisResult });
    } catch (error) {
      console.error("Error during file analysis:", error);
      if (error.response && error.response.status === 429) {
        res
          .status(429)
          .json({
            error: "Превышен лимит запросов к API OpenAI. Попробуйте позже.",
          });
      } else {
        res.status(500).json({ error: "Ошибка при анализе файла" });
      }
    }
  });
});
