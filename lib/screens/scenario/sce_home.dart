import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
//import 'package:provider/provider.dart';

class SceHome extends StatelessWidget {
  const SceHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario_home')),
      body: Center(
        child: Column(
          children:[ 
            Text('状況を選んでね'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('地震発生')
              ),              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce1_1), 
                child: Text('情報収集')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.rogin), 
                child: Text('戻る')
              )]
          )]
        ),
      ),
    );
  }
}