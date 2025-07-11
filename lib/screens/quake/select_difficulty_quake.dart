import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import'package:safety_go/screens/login/login/auth_service.dart';

class Diffculty_quake extends StatelessWidget {
  const Diffculty_quake({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
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
                    t.genreTitle,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),

                  _buildVibrantButton(
                    icon: Icons.quiz,
                    label: '〇×クイズ',
                    colors: const [Color(0xFF42A5F5), Color(0xFF478DE0)],
                    onPressed: () => context.go(RoutePaths.easy_quake),
                  ),

                  const SizedBox(height: 32),

                  _buildVibrantButton(
                    icon: Icons.traffic,
                    label: '標識クイズ',
                    colors: const [Color(0xFF81C784), Color(0xFF66BB6A)],
                    onPressed: () => context.go(RoutePaths.normal_quake),
                  ),

                  const SizedBox(height: 32),

                  _buildVibrantButton(
                    icon: Icons.train,
                    label: 'トロッコ',
                    colors: const [Color(0xFFF48FB1), Color(0xFFF06292)],
                    onPressed: () => context.go(RoutePaths.creative_quake),
                  ),

                  const SizedBox(height: 32),

                  _buildVibrantButton(
                    icon: Icons.arrow_back,
                    label: "ログアウト",
                    colors: const [Color(0xFF9575CD), Color(0xFF7E57C2)],
                    onPressed: () {
                      AuthService().signOut();// サインアウト処理を実行
                      context.go(RoutePaths.rogin);
                    }
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
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(36),
      splashColor: Colors.white24,
      child: Container(
        width: 280,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
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
            Icon(icon, size: 30, color: Colors.white, shadows: const [
              Shadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ]),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                ],
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
