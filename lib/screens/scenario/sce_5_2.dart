import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_5_2 extends StatelessWidget {
  const Sce_5_2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario5_No2')),
      body: Center(
        child: Column(
          children: [
            Text('正解！'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_5_1),
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