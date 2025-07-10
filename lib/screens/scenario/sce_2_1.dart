import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_2_1 extends StatelessWidget {
  const Sce_2_1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario2_No1')),
      body: Center(
        child: Column(
          children: [
            Text('ポートタワーで地震が起こった！さぁどうする？'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_2),
                child: 
                Text('そのままお土産を見る')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_3),
                style: TextButton.styleFrom(
                backgroundColor: Colors.transparent, // 背景を透明に
                shadowColor: Colors.transparent,     // 影も透明に
                padding: EdgeInsets.zero,            // 必要に応じて余白も調整
              ),
            child: Text(
            '透明ボタン',
            style: TextStyle(color: Colors.transparent), // テキスト色は見えるように設定
            ),
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_4),
                child: Text('展示物が落ちないように支える')
              ),
          ],)
        ],)
      ),
    );
  }
}