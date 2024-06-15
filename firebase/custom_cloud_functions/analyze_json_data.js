const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const { Configuration, OpenAIApi } = require("openai");
const cors = require("cors")({ origin: true });

const db = admin.firestore();

const configuration = new Configuration({
  apiKey: "",
});
const openai = new OpenAIApi(configuration);

exports.analyzeJsonData = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      // Получение json данных и id пользователя из тела запроса
      const { jsonData, responseId } = req.body.data;

      // Проверка, что jsonData и userId были переданы
      if (!jsonData || !responseId) {
        console.log("Error: jsonData and userId are required");
        res.status(400).send("jsonData and userId are required");
        return;
      }

      console.log(`Received jsonData: ${JSON.stringify(jsonData)}`);
      console.log(`Received responseId: ${responseId}`);

      // Анализ json данных с использованием GPT-3.5
      const completion = await openai.createChatCompletion({
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content: "Ты ассистент, который помогает анализировать данные.",
          },
          {
            role: "user",
            content: `Проанализируй следующий чат между рекретером и соискателем и выдай саммари чата по всем заданным вопросам. Игнорируй первое сообшение в json с ролью system
Данные: ${JSON.stringify(jsonData)}`,
          },
        ],
        max_tokens: 1000,
      });

      const analysisResult = completion.data.choices[0].message.content;

      // Запись результата в Firestore
      await db.collection("response").doc(responseId).update({
        chat_summary: analysisResult,
        isResumeParsingFinished: true,
      });

      // Отправка ответа
      res.status(200).json({ message: analysisResult });
    } catch (error) {
      console.error("Error during data analysis:", error);
      if (error.response && error.response.status === 429) {
        res
          .status(429)
          .json({
            error: "Превышен лимит запросов к API OpenAI. Попробуйте позже.",
          });
      } else {
        res.status(500).json({ error: "Ошибка при анализе данных" });
      }
    }
  });
});
