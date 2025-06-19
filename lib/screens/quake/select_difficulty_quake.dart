import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Diffculty_quake extends StatelessWidget {
  const Diffculty_quake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('select_diffculty_quake')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.detail), 
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.easy_quake), 
              child: Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.normal_quake), 
              child: Text('Normal'),
            ),
          ],
        )
      ),
    );
  }
}