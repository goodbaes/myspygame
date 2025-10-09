import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_key.dart'; // API ключ хранится отдельно

Future<String> getGeminiWord({required String topic, required List<String> usedWords}) async {
  final apiKey = geminiApiKey; // из файла api_key.dart
  final url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey',
  );
  final prompt =
      'Придумай одно слово по теме "$topic", не повторяющееся среди: ${usedWords.join(", ")}. Только одно слово.';
  final body = jsonEncode({
    "contents": [
      {
        "parts": [
          {"text": prompt},
        ],
      },
    ],
  });
  final response = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final text = data["candidates"]?[0]?['content']?['parts']?[0]?['text'] ?? '';
    // Очищаем от лишних символов
    return text.trim().split(RegExp(r'\s+')).first;
  } else {
    throw Exception('Ошибка Gemini API: ${response.statusCode}');
  }
}
