import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_4_1 extends StatelessWidget {
  const Sce_4_1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario4_No1')),
      body: Center(
        child: Column(
          children: [
            Text('問題'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_4_2),
                child: Text('次へ')
              ),
          ],)
        ],)
      ),
    );
  }
}