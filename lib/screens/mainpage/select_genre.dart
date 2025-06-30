// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:safety_go/constants/route_paths.dart';

// class Genre extends StatelessWidget {
//   const Genre({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('genre')),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () => context.go(RoutePaths.rogin), 
//               child: Text('back'),
//             ),
//             ElevatedButton(
//               onPressed: () => context.go(RoutePaths.Modelanguage), 
//               child: Text('modify'),
//             ),
//             ElevatedButton(
//               onPressed: () => context.go(RoutePaths.detail), 
//               child: Text('Disaster'),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ✅ 翻訳用
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
//import 'package:safety_go/app_router.dart';

class Genre extends StatelessWidget {
  const Genre ({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(t.genreTitle)), // ✅ AppBar翻訳
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.rogin),
              child: Text(t.back), // ✅ 「戻る」
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.Modelanguage),
              child: Text(t.modifyLanguage), // ✅ 「言語を修正」
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.detail),
              child: Text(t.disaster), // ✅ 「災害へ」
            ),
          ],
        ),
      ),
    );
  }
}
