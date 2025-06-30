import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_1_2 extends StatelessWidget {
  const Sce_1_2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario_No2')),
      body: Center(
        child: Column(
          children: [
            Text('次どうする？'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_1_5),
                child: Text('とりあえず走る')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_1_6), 
                child: Text('スタッフの指示に従う')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_1_7), 
                child: Text('避難所へ行く')
              ),
            ],)
          ],
        )
      ),
    );
  }
}