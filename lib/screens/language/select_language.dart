// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:safety_go/constants/route_paths.dart';

// class Select_language extends StatelessWidget {
//   const Select_language({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('select_language')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go(RoutePaths.rogin),
//           child: Text('Next'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
//import 'package:safety_go/main.dart';

class Select_language extends StatelessWidget {
  final void Function(Locale) onLanguageSelected;
  
  const Select_language({
    super.key,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.languageTitle), // 表示言語に応じたタイトル
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => onLanguageSelected(const Locale('en')),
              child: Text(t.selectEnglish),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => onLanguageSelected(const Locale('ja')),
              child: Text(t.selectJapanese),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.rogin),
              child: Text(t.next), // ローカライズ対応の「次へ」
            ),
          ],
        ),
      ),
    );
  }
}
