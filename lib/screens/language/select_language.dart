
import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Select_language extends StatelessWidget {
  final void Function(Locale) onLanguageSelected;

  const Select_language({
    super.key,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      // 背景にグラデーション＋微細な模様っぽいテクスチャ風に
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
                  // タイトル
                  Text(
                    'SafetyGo',
                    style: TextStyle(
                      fontSize: 50,
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
                  const SizedBox(height: 30),

                  Text(
                    t.languageTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.9),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  // 英語ボタン
                  _buildVibrantButton(
                    icon: Icons.language,
                    text: "English",
                    colors: const [Color(0xFF42A5F5), Color(0xFF478DE0)],
                    onPressed: () => onLanguageSelected(const Locale('en')),
                  ),

                  const SizedBox(height: 32),

                  // 日本語ボタン
                  _buildVibrantButton(
                    icon: Icons.language,
                    text: "日本語",
                    colors: const [Color(0xFFFF4081), Color(0xFFD81B60)],
                    onPressed: () => onLanguageSelected(const Locale('ja')),
                  ),

                  const SizedBox(height: 32),

                  // 韓国語ボタン
                  _buildVibrantButton(
                    icon: Icons.language,
                    text: "한국어",
                    colors: const [Color.fromARGB(255, 169, 255, 64), Color.fromARGB(255, 181, 216, 27)],
                    onPressed: () => onLanguageSelected(const Locale('ko')),
                  ),




                  const SizedBox(height: 56),

                  ElevatedButton.icon(
                    onPressed: () => context.go(RoutePaths.rogin),
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    label: Text(
                      t.next,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurpleAccent,
                      elevation: 10,
                      shadowColor: Colors.deepPurpleAccent.withOpacity(0.6),
                      textStyle: const TextStyle(letterSpacing: 1.2),
                    ),
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
    required String text,
    required List<Color> colors,
    required VoidCallback onPressed,
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
            Icon(icon, size: 32, color: Colors.white, shadows: [
              Shadow(
                color: Colors.black38,
                blurRadius: 4,
                offset: const Offset(1, 1),
              ),
            ]),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    blurRadius: 4,
                    offset: Offset(1, 1),
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
