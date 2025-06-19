import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('select_detail')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.genre), 
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.diffculty_quake), 
              child: Text('Earthquake'),
            ),
          ],
        )
      ),
    );
  }
}