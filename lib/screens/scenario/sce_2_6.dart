import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_2_6 extends StatelessWidget {
  const Sce_2_6 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario2_No6')),
      body: Center(
        child: Column(
          children: [
            Text('係員に、階段で下に降りるよう言われたよ'),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_8),
                child: Text('走って階段を降りる')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_9),
                child: Text('話を聞かないで、エレベータを使う')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_2_10),
                child: Text('慌てず階段を降りる')
              ),
          ],)
        ],)
      ),
    );
  }
}