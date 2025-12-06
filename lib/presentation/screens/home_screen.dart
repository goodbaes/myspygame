import 'package:app_localization/localization_service.dart' show l10n;
import 'package:flutter/material.dart';
import 'package:myspygame/data/api.dart';
import 'package:domain/domain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _playerCount = 3;
  double _spyCount = 1;
  double _gameTime = 5; // in minutes
  late TextEditingController _themeController;
  final List<String> _usedWords = [];
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeController = TextEditingController(text: l10n.default_theme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(l10n.home_screen_title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            if (_isLoading) const Center(child: CircularProgressIndicator()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${l10n.players}: ${_playerCount.toInt()}'),
                Slider(
                  value: _playerCount,
                  min: 3,
                  max: 20,
                  divisions: 7,
                  label: _playerCount.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _playerCount = value;
                      if (_spyCount > _playerCount - 1) {
                        _spyCount = _playerCount - 1;
                      }
                    });
                  },
                ),
                const SizedBox(height: 20),
                Text('${l10n.spies}: ${_spyCount.toInt()}'),
                Slider(
                  value: _spyCount,
                  min: 1,
                  max: _playerCount > 1 ? _playerCount - 1 : 1,
                  divisions: _playerCount > 2 ? (_playerCount - 2).toInt() : 1,
                  label: _spyCount.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _spyCount = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  '${l10n.game_time}: ${_gameTime.toInt()} ${l10n.minutes_short}',
                ),
                Slider(
                  value: _gameTime.toDouble(),
                  min: 1,
                  max: 20,
                  label: _gameTime.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _gameTime = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _themeController,
                  decoration: InputDecoration(labelText: l10n.game_theme_label),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    if (_isLoading) return;
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      final word = await getGeminiWord(
                        topic: _themeController.text,
                        usedWords: _usedWords,
                      );
                      _usedWords.add(word);
                      final gameSettings = GameRoundSettings(
                        playerCount: _playerCount.toInt(),
                        spyCount: _spyCount.toInt(),
                        gameTime: Duration(minutes: _gameTime.toInt()),
                        theme: _themeController.text,
                        word: word,
                      );
                      Navigator.pushNamed(
                        context,
                        '/roles',
                        arguments: gameSettings,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${l10n.error_fetching_word}$e'),
                        ),
                      );
                      setState(() {
                        _isLoading = false;
                      });
                      return;
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: Text(l10n.start_game),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // TODO: Implement settings navigation
                  },
                  child: Text(l10n.settings),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
