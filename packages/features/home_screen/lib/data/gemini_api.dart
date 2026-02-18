import 'dart:convert';

import 'package:http/http.dart' as http;

/// API service for interacting with the Gemini API.
///
/// Uses the `GEMINI_API_KEY` environment variable for authentication.
/// Pass the key at build time: `--dart-define=GEMINI_API_KEY=your_key`
class GeminiApi {
  const GeminiApi._();

  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  static const String _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

  /// Fetches a unique word/location based on [topic], excluding [usedWords].
  static Future<String> getGeminiWord({
    required String topic,
    required List<String> usedWords,
  }) async {
    final url = Uri.parse(_endpoint);
    final prompt =
        'Придумай одно место, пространство по теме "$topic", '
        'оно должно быть популярное и известное, чтобы все игроки знали, '
        'не повторяющееся среди: ${usedWords.join(", ")}. Только одно слово.';

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'x-goog-api-key': _apiKey},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = data['candidates'] as List<dynamic>?;
      if (candidates == null || candidates.isEmpty) {
        throw Exception('No candidates returned from Gemini API');
      }
      final content = candidates[0]['content'] as Map<String, dynamic>?;
      final parts = content?['parts'] as List<dynamic>?;
      final text = parts?[0]?['text'] as String? ?? '';
      return text.trim().split(RegExp(r'\s+')).first;
    } else {
      throw Exception('Ошибка Gemini API: ${response.statusCode}');
    }
  }
}
