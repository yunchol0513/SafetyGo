import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Normal_quake extends StatelessWidget {
  const Normal_quake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('normal_quake')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.diffculty_quake), 
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.st_normal_quake1), 
              child: Text('Study')),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.st_pro_normal_quake1), 
              child: Text('Problem'),
            ),

          ],
        )
      ),
    );
  }
}