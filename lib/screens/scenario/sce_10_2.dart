import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_10_2 extends StatelessWidget {
  const Sce_10_2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario10_No2')),
      body: Center(
        child: Column(
          children: [
            Text('正解！'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_10_1),
                child: Text('もう一度')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.rogin), 
                child: Text('終わる')
              ),
          ],)
        ],)
      ),
    );
  }
}