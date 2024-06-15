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
            content: `Создай вакансию в формате JSON на основе этого описания вакансии: ${vacancyDescription}. Пример твоего ответа в JSON: 
{
      "job_title": "Разработчик на Javacript",
      "description": "Разработка корпоративных порталов, интернет магазинов, вёрстка интерне-страниц",
      "requirements": "Хорошее знание HTML, CSS. Владение современным стеком технологий. Опыт работы на позиции разработчика больше 2-х лет",
      "skills": ["CSS","JS","HTML","React"],
      "specialization" : "", // Вставь один наиболее подходящий вариант:  "Дизайн","Маркетинг","Back-end","Front-end","Full-stack","Менеджмент","Аналитика","Продажи","Поддержка"
      "workFormat" : "",     // Вставь один наиболее подходящий вариант: "Офис","Удалённо","Гибрид"
      "employmentType" : "" // Вставь один наиболее подходящий вариант: "Полная занятость","Частичная занятость","Проектная работа"
}
Ты должен отвечать в формате json строго с предоставленными выше ключами`,
          },
        ],
        max_tokens: 2000,
      });

      let gptResponse = completion.data.choices[0].message.content;
      console.log(`GPT-3 response: ${gptResponse}`);

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
