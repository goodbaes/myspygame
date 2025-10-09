import 'package:flutter/material.dart';
import 'package:myspygame/model/game_round_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _playerCount = 3;
  double _spyCount = 1;
  final TextEditingController _timeController = TextEditingController(text: '5');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spy Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Game Time (minutes)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(decoration: const InputDecoration(labelText: 'Game Theme')),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final gameSettings = GameRoundSettings(
                  playerCount: _playerCount.toInt(),
                  spyCount: _spyCount.toInt(),
                  gameTime: Duration(minutes: int.tryParse(_timeController.text) ?? 5),
                  theme: 'Default Theme',
                  word: 'Default Word',
                );
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
      ),
    );
  }
}
