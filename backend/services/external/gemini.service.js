import fetch from 'node-fetch';
import { config } from 'dotenv';
config();

export const generateText = async (prompt) => {
  try {
    if (!process.env.GEMINI_API_KEY) {
      throw new Error('GEMINI_API_KEY is not defined');
    }

    const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${process.env.GEMINI_API_KEY}`;

    const body = {
      contents: [
        {
          parts: [
            {
              text: prompt,
            },
          ],
        },
      ],
    };

    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(body),
    });

    const data = await response.json();

    if (!response.ok) {
      console.error('❌ Gemini API Error:', data);
      throw new Error(data.error?.message || 'Unknown error from Gemini API');
    }

    const text = data.candidates?.[0]?.content?.parts?.[0]?.text;

    if (!text) {
      throw new Error('No content returned from Gemini API');
    }

    console.log('✅ Gemini Response:', text);
    return text;
  } catch (error) {
    console.error('❌ Error generating text:', {
      message: error.message,
      stack: error.stack,
    });
    throw new Error('Failed to generate text: ' + error.message);
  }
};
