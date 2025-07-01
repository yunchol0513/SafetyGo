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
import 'dart:math';

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
              onPressed: () => context.go(RoutePaths.genre), 
              child: Text(t.next), // ✅ 「次へ」ボタン翻訳
            ),
            ElevatedButton(
              onPressed: () {
                final random = Random();
                int number = 2;//random.nextInt(10) + 1;
                if (number == 1) {
                  context.go(RoutePaths.sce_1_1);
                } else if (number == 2) {
                  context.go(RoutePaths.sce_2_1);
                } else if (number == 3) {
                  context.go(RoutePaths.sce_3_1);
                } else if (number == 4) {
                  context.go(RoutePaths.sce_4_1);
                } else if (number == 5) {
                  context.go(RoutePaths.sce_5_1);
                } else if (number == 6) {
                  context.go(RoutePaths.sce_6_1);
                } else if (number == 7) {
                  context.go(RoutePaths.sce_7_1);
                } else if (number == 8) {
                  context.go(RoutePaths.sce_8_1);
                } else if (number == 9) {
                  context.go(RoutePaths.sce_9_1);
                } else {
                  context.go(RoutePaths.sce_10_1);
                }
              }, 
              child: Text('シナリオ学習1')
            ),
          ],
        ),
      ),
    );
  }
}
