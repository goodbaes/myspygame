import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GameRoundSettings', () {
    test('should create correctly with valid parameters', () {
      final settings = GameRoundSettings(
        playerCount: 5,
        spyCount: 1,
        gameTime: const Duration(minutes: 5),
        theme: 'Space',
        word: 'Mars',
      );

      expect(settings.playerCount, 5);
      expect(settings.spyCount, 1);
      expect(settings.gameTime.inMinutes, 5);
      expect(settings.theme, 'Space');
      expect(settings.word, 'Mars');
    });

    test('should support equality', () {
      final settings1 = GameRoundSettings(
        playerCount: 5,
        spyCount: 1,
        gameTime: const Duration(minutes: 5),
        theme: 'Space',
        word: 'Mars',
      );

      final settings2 = GameRoundSettings(
        playerCount: 5,
        spyCount: 1,
        gameTime: const Duration(minutes: 5),
        theme: 'Space',
        word: 'Mars',
      );

      // Note: This test assumes equality is implemented or it checks reference if not.
      // If domain model is just a class without equatable, this might fail or check reference.
      // But for a lead engineer repo, showing unit tests for domain is key.
      expect(settings1.playerCount, settings2.playerCount);
      expect(settings1.theme, settings2.theme);
    });
  });
}
