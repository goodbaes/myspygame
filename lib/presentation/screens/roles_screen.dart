import 'package:app_localization/localization_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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
      if (_pageController.hasClients) {
        final newPage = _pageController.page?.round() ?? 0;
        if (newPage != _currentPage) {
          setState(() => _currentPage = newPage);
        }
      }
    });
  }

  void _nextPage() {
    if (_currentPage < widget.settings.playerCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _showRole() {
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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.roles_screen_title)),
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
                  child: Center(
                    child: Text(
                      l10n.tap_to_see_role,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
              secondChild: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _nextPage,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isSpy ? l10n.you_are_spy : l10n.you_are_citizen,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      if (!isSpy) ...[
                        Text(
                          '${l10n.theme}: ${widget.settings.theme}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${l10n.word}: ${widget.settings.word}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ] else ...[
                        Text(l10n.try_to_blend_in, style: const TextStyle(fontSize: 20)),
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
