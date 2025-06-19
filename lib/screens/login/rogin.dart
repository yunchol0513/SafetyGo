import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Rogin extends StatelessWidget {
  const Rogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('rogin')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.language), 
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.genre), 
              child: Text('Next'),
            ),
          ],
        )
      ),
    );
  }
}