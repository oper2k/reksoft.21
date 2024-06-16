const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const { Configuration, OpenAIApi } = require("openai");
const cors = require("cors")({ origin: true });

const db = admin.firestore();

const configuration = new Configuration({
  apiKey: "", // Замените YOUR_OPENAI_API_KEY на ваш ключ API OpenAI
});
const openai = new OpenAIApi(configuration);

exports.generateVacancy = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      const { vacancyDescription, vacancyId } = req.body.data;

      const completion = await openai.createChatCompletion({
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content:
              "Ты опытный HR специалист, который помогает создавать вакансии для портала поиска работы.",
          },
          {
            role: "user",
            content: `Создай вакансию в формате JSON на основе этого описания вакансии: ${vacancyDescription}. JSON должен быть валидным. Удаляй все неподдерживаемые символы. Твой ответ должен содержать только json без твоих пояснений, тк дальше его будет обрабатывать функция. Json должен содержать только те ключи что представлены в примере. Пример твоего ответа в JSON: 
{
      "job_title": "Frontend разработчик",
      "description": "Вы будете заниматься разработкой и развитием наших корпоративных порталов, интернет магазинов, crm-системы. Будете активно участвовать в проектировании фич и верстке нового функционала. Взаимодействовать с другими командами: backend-разработчиками, тестировщиками, аналитиками. У нас принята культура обмена опытом и постоянного развития.",
      "requirements": "Отличное знание JavaScript, HTML, CSS. Уверенное знание TypeScript. Хорошее знание библиотеки React и опыт ее использования в коммерческих проектах не менее трех лет. Опыт работы с Redux и Redux-toolkit. Опыт работы с любым CSS препроцессором: SASS, LESS, Stylus. Способность протестировать работоспособность кода перед его отправкой на ревью. Будет плюсом: Опыт работы с дизайн-системой BlueprintJs. Опыт создания npm-пакетов. Понимание протоколов HTTP и WS. Умение настраивать сборку приложения с использованием Webpack. Умение самостоятельно разобраться в поставленных задачах.",
      "skills": ["CSS","JS","HTML","React","Redux","TypeScript","Webpack"],
      "specialization" : "", // Вставь один наиболее подходящий вариант:  "Разработка программного обеспечения","Администрирование и поддержка","Кибербезопасность","Разработка мобильных приложений","Инженерия DevOps","Администрирование баз данных","Облачные технологии","UX/UI дизайн","Тестирование ПО"
      "workFormat" : "",     // Вставь один наиболее подходящий вариант: "Офис","Удалённо","Гибрид"
      "employmentType" : "" // Вставь один наиболее подходящий вариант: "Полная занятость","Частичная занятость","Проектная работа"
}`,
          },
        ],
        max_tokens: 3000,
      });

      let gptResponse = completion.data.choices[0].message.content;
      console.log(`GPT-3 response: ${gptResponse}`);

      // Очистка строки ответа от нежелательных символов
      gptResponse = gptResponse.replace(/```json/g, "").replace(/```/g, "");

      let extractedData;
      try {
        extractedData = JSON.parse(gptResponse);
      } catch (parseError) {
        console.error("Error parsing GPT-3 response:", parseError);
        res
          .status(500)
          .json({
            error: "Ошибка при разборе ответа GPT-3",
            details: parseError.message,
          });
        return;
      }

      await db
        .collection("vacancies")
        .doc(vacancyId)
        .set(extractedData, { merge: true });

      res
        .status(200)
        .json({
          message: "Данные успешно извлечены и сохранены в Firestore",
          data: extractedData,
        });
    } catch (error) {
      console.error("Error during file analysis:", error);
      if (error.response && error.response.status === 429) {
        res
          .status(429)
          .json({
            error: "Превышен лимит запросов к API OpenAI. Попробуйте позже.",
          });
      } else {
        res
          .status(500)
          .json({ error: "Ошибка при анализе файла", details: error.message });
      }
    }
  });
});
