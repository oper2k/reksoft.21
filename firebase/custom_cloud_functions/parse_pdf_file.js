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
      });

      const data = response.data;
      const filePath = "/tmp/tempfile.pdf";
      fs.writeFileSync(filePath, data);

      const dataBuffer = fs.readFileSync(filePath);
      const pdfData = await pdf(dataBuffer);
      const fileContent = pdfData.text;

      console.log(`Extracted text: ${fileContent}`);

      fs.unlinkSync(filePath);

      const completion = await openai.createChatCompletion({
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content:
              "Ты ассистент, который помогает анализировать файлы и извлекать данные из резюме.",
          },
          {
            role: "user",
            content: `Извлеки данные из следующего резюме в формате JSON. JSON должен быть валидным. Удаляй все неподдерживаемые символы: 
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
        ],
        max_tokens: 2000,
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

      await db.collection("users").doc(userId).update(extractedData);

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
