import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_2_3 extends StatelessWidget {
  const Sce_2_3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario2_No3')),
      body: Center(
        child: Column(
          children: [
            Text('揺れが収まったよ。次はどうする？'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_5),
                child: Text('近くの窓から外に飛び降りる')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_6),
                child: Text('係員の指示通りに動く')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_7),
                child: Text('エレベータに乗り込む')
              ),
          ],)
        ],)
      ),
    );
  }
}