import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Genre extends StatelessWidget {
  const Genre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('genre')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.rogin), 
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.Modelanguage), 
              child: Text('modify'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.detail), 
              child: Text('Disaster'),
            ),
          ],
        )
      ),
    );
  }
}