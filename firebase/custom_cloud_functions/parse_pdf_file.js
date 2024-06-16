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

exports.parsePdfFile = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      const { fileUrl, userId } = req.body.data;

      if (!fileUrl || !userId) {
        console.log("Error: fileUrl and userId are required");
        console.log(req.body.data);
        res.status(400).send("fileUrl and userId are required");
        return;
      }

      console.log(`Received fileUrl: ${fileUrl}`);
      console.log(`Received userId: ${userId}`);

      const response = await axios({
        url: fileUrl,
        responseType: "arraybuffer",
        timeout: 10000, // Установите тайм-аут 10 секунд
      });

      if (response.status !== 200) {
        throw new Error(
          `Failed to download file, status code: ${response.status}`,
        );
      }

      const data = response.data;
      const filePath = "/tmp/tempfile.pdf";
      fs.writeFileSync(filePath, data);

      const dataBuffer = fs.readFileSync(filePath);
      const pdfData = await pdf(dataBuffer);
      const fileContent = pdfData.text;

      console.log(`Extracted text: ${fileContent}`);

      fs.unlinkSync(filePath);

      // Проверка валидности данных перед отправкой в OpenAI API
      const messages = [
        {
          role: "system",
          content:
            "Ты ассистент, который помогает анализировать файлы и извлекать данные из резюме.",
        },
        {
          role: "user",
          content: `Извлеки данные из следующего резюме в формате JSON. JSON должен быть валидным. Твой ответ должен содержать только полностью законченный json, без твоих пояснений. Json должен содержать только те ключи что представлены в примере. Удаляй все неподдерживаемые символы: 
        {
          "educationPlaces": [
            {
              "university": "Название ВУЗА",
              "faculty": "Факультет",
              "skills": ["ключевой навык 1", "ключевой навык 2"]
            }
          ],
          "workPlaces": [
            {
              "company_name": "Название компании",
              "position": "Должность",
              "skills": ["ключевой навык 1", "ключевой навык 2"],
              "description": "Описание выполняемых обязанностей"
            }
          ],
        }
        Сам файл: ${fileContent}`,
        },
      ];

      // Убедитесь, что messages правильно структурированы
      if (
        !Array.isArray(messages) ||
        messages.length === 0 ||
        !messages[0].role ||
        !messages[0].content
      ) {
        throw new Error("Messages format is invalid.");
      }

      const completion = await openai.createChatCompletion({
        model: "gpt-3.5-turbo",
        messages: messages,
        max_tokens: 2000,
      });

      if (
        !completion.data ||
        !completion.data.choices ||
        !completion.data.choices[0] ||
        !completion.data.choices[0].message
      ) {
        throw new Error("Invalid response from OpenAI API");
      }

      let gptResponse = completion.data.choices[0].message.content;
      console.log(`GPT-4 response: ${gptResponse}`);

      // Очистка строки ответа от нежелательных символов и проверка JSON
      gptResponse = gptResponse
        .replace(/```json/g, "")
        .replace(/```/g, "")
        .trim();

      let extractedData;
      try {
        extractedData = JSON.parse(gptResponse);
      } catch (parseError) {
        console.error("Error parsing GPT-4 response:", parseError);
        console.error("GPT-4 raw response:", gptResponse); // Логирование полного ответа для отладки
        res
          .status(500)
          .json({
            error: "Ошибка при разборе ответа GPT-4",
            details: parseError.message,
          });
        return;
      }

      await db.collection("users").doc(userId).update(extractedData);

      res
        .status(200)
        .json({
          message: "Данные успешно извлечены и сохранены в Firestore",
          data: extractedData,
        });
    } catch (error) {
      console.error("Error during file analysis:", error);
      if (error.response) {
        if (error.response.status === 429) {
          res
            .status(429)
            .json({
              error: "Превышен лимит запросов к API OpenAI. Попробуйте позже.",
            });
        } else if (error.response.status === 503) {
          res
            .status(503)
            .json({ error: "Сервис временно недоступен. Попробуйте позже." });
        } else if (error.response.status === 400) {
          res
            .status(400)
            .json({
              error: "Некорректный запрос к API. Проверьте параметры.",
              details: JSON.stringify(error.response.data),
            });
        } else {
          res
            .status(error.response.status)
            .json({
              error: `Ошибка сервера: ${error.response.status}`,
              details: error.message,
            });
        }
      } else {
        res
          .status(500)
          .json({ error: "Ошибка при анализе файла", details: error.message });
      }
    }
  });
});
