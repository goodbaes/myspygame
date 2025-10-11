import 'package:flutter/material.dart';
import 'package:myspygame/data/api.dart';
import 'package:myspygame/model/game_round_settings.dart';
import 'package:myspygame/presentation/screens/roles_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _playerCount = 3;
  double _spyCount = 1;
  double _gameTime = 5; // in minutes
  final TextEditingController _themeController = TextEditingController(text: 'Общественные места');
  final List<String> _usedWords = [];
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spy Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            if (_isLoading) const Center(child: CircularProgressIndicator()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Players: ${_playerCount.toInt()}'),
                Slider(
                  value: _playerCount,
                  min: 3,
                  max: 10,
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
                Text('Spies: ${_spyCount.toInt()}'),
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
                Text('Game Time: ${_gameTime.toInt()} min'),
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
                  decoration: const InputDecoration(labelText: 'Game Theme'),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RolesScreen(settings: gameSettings),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Error fetching word: $e')));
                      setState(() {
                        _isLoading = false;
                      });
                      return;
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: const Text('Start Game'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // TODO: Implement settings navigation
                  },
                  child: const Text('Settings'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
