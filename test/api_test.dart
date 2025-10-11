import 'package:flutter_test/flutter_test.dart';
import 'package:myspygame/data/api.dart';

void main() async {
  final word = await getGeminiWord(topic: 'аниме', usedWords: []);
  print('Ответ: $word');
  expect(word.isNotEmpty, true);
}
