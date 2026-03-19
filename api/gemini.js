export default async function handler(req, res) {
  // ✅ CORS Headers
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type");

  // ✅ Preflight
  if (req.method === "OPTIONS") {
    return res.status(200).end();
  }

  // Only allow GET or POST
  if (req.method !== "POST" && req.method !== "GET") {
    return res.status(405).json({ error: "Method not allowed" });
  }

  try {
    const apiKey = process.env.GEMINI_API_KEY || "YOUR_HARDCODED_KEY_IF_LOCAL";

    const prompt = `
You are an expert architect.

Generate a simple house blueprint layout.

Plot Size:
Length: ${req.body.length} meters
Width: ${req.body.width} meters

Requirements:
Bedrooms: ${req.body.rooms}
Bathrooms: ${req.body.bathrooms}
Kitchen: ${req.body.kitchens}
Balcony: ${req.body.balconies}

Return ONLY JSON in this format:

{
 "rooms":[
  {"name":"Living Room","x":0,"y":0,"width":4,"height":4},
  {"name":"Kitchen","x":4,"y":0,"width":3,"height":3},
  {"name":"Bedroom","x":0,"y":4,"width":4,"height":4},
  {"name":"Bathroom","x":4,"y":3,"width":2,"height":2}
 ]
}

No explanation. Only JSON.
`;

    const response = await fetch(
      `https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=${apiKey}`,
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          contents: [
            {
              parts: [{ text: prompt }],
            },
          ],
        }),
      },
    );

    const data = await response.json();
    return res.status(200).json(data);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
}
