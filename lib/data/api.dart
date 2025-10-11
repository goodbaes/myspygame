import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_key.dart'; // API ключ хранится отдельно

Future<String> getGeminiWord({required String topic, required List<String> usedWords}) async {
  final url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent',
  );
  final prompt =
      'Придумай одно место, пространство по теме "$topic",оно должно быть популярное и известное, чтобы все игроки знали, не повторяющееся среди: ${usedWords.join(", ")}. Только одно слово.';
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json", "x-goog-api-key": geminiApiKey},
    body: jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": prompt},
          ],
        },
      ],
    }),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final text = data["candidates"]?[0]?['content']?['parts']?[0]?['text'] ?? '';
    // Очищаем от лишних символов
    return text.trim().split(RegExp(r'\s+')).first;
  } else {
    throw Exception('Ошибка Gemini API: ${response.statusCode}');
  }
}
