import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_2_10 extends StatelessWidget {
  const Sce_2_10 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario2_No10')),
      body: Center(
        child: Column(
          children: [
            Text('外に出たよ。次はどうする？'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_11),
                child: Text('近くの避難所へ行く')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_12),
                child: Text('その場でのんびりする')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_13),
                child: Text('他の場所を観察しに行く')
              ),
          ],)
        ],)
      ),
    );
  }
}