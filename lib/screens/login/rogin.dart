import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Rogin extends StatelessWidget {
  const Rogin({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      // 背景は言語選択と同じグラデーション
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF64B6FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.loginTitle,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 12,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 48),



                  const SizedBox(height: 32),
//ログインへ
                   _buildVibrantButton(
                    icon: Icons.login,
                    label: t.loginTitle,
                    colors: const [Color(0xFFFFF176), Color(0xFFFFEE58)],
                    onPressed: () {
                      context.go(RoutePaths.rogin_1);
                    },
                    textColor: Colors.black87,
                  ),

                  const SizedBox(height: 32),

                  _buildVibrantButton(
                    icon: Icons.menu_book,
                    label: 'シナリオ学習',
                    colors: const [Color(0xFF81C784), Color(0xFF66BB6A)],
                    onPressed: () {
                      // 現状固定の挙動を保持
                      context.go(RoutePaths.scehome);
                    },
                  ),



                  const SizedBox(height: 32),

                  _buildVibrantButton(
                    icon: Icons.arrow_back,
                    label: t.back,
                    colors: const [Color(0xFFF48FB1), Color(0xFFF06292)],
                    onPressed: () => context.go(RoutePaths.language),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVibrantButton({
    required IconData icon,
    required String label,
    required List<Color> colors,
    required VoidCallback onPressed,
    Color textColor = Colors.white,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40),
      splashColor: Colors.white24,
      child: Container(
        width: 280,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.6),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: colors.first.withOpacity(0.4),
              blurRadius: 30,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: textColor, shadows: [
              Shadow(
                color: Colors.black38,
                blurRadius: 4,
                offset: const Offset(1, 1),
              ),
            ]),
            const SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: textColor,
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    blurRadius: 4,
                    offset: const Offset(1, 1),
                  ),
                ],
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
