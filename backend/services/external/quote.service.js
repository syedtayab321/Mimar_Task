import fetch from 'node-fetch';

export const getRandomQuote = async () => {
  try {
    const response = await fetch('https://zenquotes.io/api/random');

    if (!response.ok) {
      const errorText = await response.text();
      console.error('API error:', errorText);
      throw new Error('Failed to fetch quote');
    }

    const data = await response.json();

    return {
      content: data[0].q,
      author: data[0].a,
    };
  } catch (err) {
    console.error('Fetch error:', err.message);
    throw err;
  }
};
