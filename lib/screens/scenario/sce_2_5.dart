import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_2_5 extends StatelessWidget {
  const Sce_2_5 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario2_No5')),
      body: Center(
        child: Column(
          children: [
            Text('失敗'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_1),
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