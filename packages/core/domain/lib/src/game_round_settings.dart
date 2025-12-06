class GameRoundSettings {
  final int playerCount;
  final int spyCount;
  final Duration gameTime;
  final String theme;
  final String word;

  GameRoundSettings({
    required this.playerCount,
    required this.spyCount,
    required this.gameTime,
    required this.theme,
    required this.word,
  });
}
