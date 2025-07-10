// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:safety_go/constants/route_paths.dart';

// class Rogin extends StatelessWidget {
//   const Rogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('rogin')),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () => context.go(RoutePaths.language), 
//               child: Text('back'),
//             ),
//             ElevatedButton(
//               onPressed: () => context.go(RoutePaths.genre), 
//               child: Text('Next'),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart'; // ✅ 翻訳用
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Rogin extends StatelessWidget {
  const Rogin({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!; // ✅ 翻訳インスタンス取得

    return Scaffold(
      appBar: AppBar(title: Text(t.loginTitle)), // ✅ AppBarのタイトルも翻訳
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.language), 
              child: Text(t.back), // ✅ 「戻る」ボタン翻訳
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.rogin_1), 
              child: Text(t.next), // ✅ 「次へ」ボタン翻訳
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.scehome), 
              child: Text('シナリオ学習1')
            ),
          ],
        ),
      ),
    );
  }
}
