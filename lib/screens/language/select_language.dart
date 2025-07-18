import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Select_language extends StatefulWidget {
  final void Function(Locale) onLanguageSelected;

  const Select_language({
    super.key,
    required this.onLanguageSelected,
  });

  @override
  State<Select_language> createState() => _Select_languageState();
}

class _Select_languageState extends State<Select_language> {
  Locale? _selectedLocale;

  void _selectLocale(Locale locale) {
    setState(() {
      _selectedLocale = locale;
    });
    widget.onLanguageSelected(locale);
  }

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
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow.shade100,
                      shadows: [
                        const Shadow(
                          color: Colors.black45,
                          blurRadius: 6,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  _buildLanguageButton(
                    locale: const Locale('en'),
                    label: 'English',
                    colors: [Color(0xFF42A5F5), Color(0xFF478DE0)],
                  ),
                  const SizedBox(height: 22),

                  _buildLanguageButton(
                    locale: const Locale('ja'),
                    label: '日本語',
                    colors: [Color(0xFFFF4081), Color(0xFFD81B60)],
                  ),
                  const SizedBox(height: 22),

                  _buildLanguageButton(
                    locale: const Locale('zh'),
                    label: '中国人',
                    colors: [Color.fromARGB(255, 253, 143, 9), Color.fromARGB(255, 253, 143, 9)],
                  ),
                  const SizedBox(height: 22),

                  _buildLanguageButton(
                    locale: const Locale('ko'),
                    label: '한국어',
                    colors: [Color(0xFFA9FF40), Color(0xFFB5D81B)],
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

  Widget _buildLanguageButton({
    required Locale locale,
    required String label,
    required List<Color> colors,
  }) {
    final isSelected = _selectedLocale == locale;

    return InkWell(
      onTap: () => _selectLocale(locale),
      borderRadius: BorderRadius.circular(40),
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
          border: isSelected
              ? Border.all(color: Colors.white, width: 3)
              : null,
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.6),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, size: 32, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.white, size: 28),
          ],
        ),
      ),
    );
  }
}
