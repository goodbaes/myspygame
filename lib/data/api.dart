import 'dart:convert';
import 'package:http/http.dart' as http;

/// API service for interacting with the Gemini API.
class GeminiApi {
  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  /// Fetches a word based on the topic, ensuring it hasn't been used before.
  static Future<String> getGeminiWord({
    required String topic,
    required List<String> usedWords,
  }) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent',
    );
    final prompt =
        'Придумай одно место, пространство по теме "$topic",оно должно быть популярное и известное, чтобы все игроки знали, не повторяющееся среди: ${usedWords.join(", ")}. Только одно слово.';

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json", "x-goog-api-key": _apiKey},
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
      final Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = data["candidates"] as List<dynamic>?;
      if (candidates == null || candidates.isEmpty) {
        throw Exception('No candidates returned from Gemini API');
      }

      final content = candidates[0]['content'] as Map<String, dynamic>?;
      final parts = content?['parts'] as List<dynamic>?;
      final text = parts?[0]?['text'] as String? ?? '';

      // Clean from extra characters
      return text.trim().split(RegExp(r'\s+')).first;
    } else {
      throw Exception('Ошибка Gemini API: ${response.statusCode}');
    }
  }
}
