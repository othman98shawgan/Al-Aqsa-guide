// functions/index.js
const functions = require("firebase-functions");
const axios = require("axios");
const cors = require("cors")({ origin: true });

// Hardcode your API key here securely (DO NOT commit this file to GitHub)

const OPENAI_API_KEY = "sk-...your_secret_key_here..."; // Replace with your actual OpenAI API key

exports.chatbot = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    if (req.method !== "POST") {
      return res.status(405).send("Method Not Allowed");
    }

    const question = req.body.question;
    if (!question) {
      return res.status(400).send("Missing question");
    }

    try {
      const response = await axios.post(
        "https://api.openai.com/v1/chat/completions",
        {
          model: "gpt-3.5-turbo",
          messages: [
            {
              role: "system",
              content:
                "You are a helpful and knowledgeable guide about Al-Aqsa Mosque. Provide answers from an Islamic perspective based on authentic Islamic tradition, history, and scholarly sources. Be respectful, concise, and avoid speculation."
            },
            { role: "user", content: question }
          ]
        },
        {
          headers: {
            Authorization: `Bearer ${OPENAI_API_KEY}`,
            "Content-Type": "application/json"
          }
        }
      );

      const answer = response.data.choices[0].message.content.trim();
      res.status(200).json({ answer });
    } catch (error) {
      console.error("OpenAI error:", error.response?.data || error.message);
      res.status(500).send("Something went wrong with the AI response.");
    }
  });
});
