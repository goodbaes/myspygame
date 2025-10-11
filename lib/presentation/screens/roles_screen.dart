import 'package:flutter/material.dart';
import 'package:myspygame/model/game_round_settings.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key, required this.settings});
  final GameRoundSettings settings;
  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<bool> _isRoleRevealed = [];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // Проверяем, что контроллер уже подключён
      if (_pageController.hasClients) {
        final newPage = _pageController.page?.round() ?? 0;
        if (newPage != _currentPage) {
          setState(() => _currentPage = newPage);
        }
      }
    });
  }

  _nextPage() {
    if (_currentPage < widget.settings.playerCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  _showRole() {
    setState(() {
      if (_isRoleRevealed.length < widget.settings.playerCount) {
        _isRoleRevealed.add(true);
      } else {
        _isRoleRevealed[_currentPage] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roles')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.settings.playerCount,
        itemBuilder: (context, index) {
          final isSpy = index < widget.settings.spyCount;

          return Center(
            child: AnimatedCrossFade(
              crossFadeState: _isRoleRevealed.length > index && _isRoleRevealed[index]
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstChild: GestureDetector(
                onTap: _showRole,
                child: Container(
                  color: Colors.blueAccent,
                  child: const Center(
                    child: Text(
                      'Tap to see your role',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
              secondChild: GestureDetector(
                behavior: HitTestBehavior.opaque, // попробуй убрать!

                onTap: _nextPage,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isSpy ? 'You are a Spy' : 'You are a Citizen',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      if (!isSpy) ...[
                        Text(
                          'Theme: ${widget.settings.theme}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text('Word: ${widget.settings.word}', style: const TextStyle(fontSize: 20)),
                      ] else ...[
                        const Text('Try to blend in!', style: TextStyle(fontSize: 20)),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
