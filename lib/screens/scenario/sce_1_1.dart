import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce_1_1 extends StatelessWidget {
  const Sce_1_1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scenario_No1')),
      body: Center(
        child: Column(
          children:[ 
            Text('地震が置きたよ'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_1_2),
                child: Text('安全な場所へ避難')
              ),              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_1_3), 
                child: Text('タピオカを飲む')
              ),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.sce_1_4), 
                child: Text('そのまま観光する')
              )]
          )]
        ),
      ),
    );
  }
}