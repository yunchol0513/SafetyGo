import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
class St_problem_normal_quake2 extends StatelessWidget {
  const St_problem_normal_quake2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('easy_quake_No1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RoutePaths.st_normal_quake2),
          child: Text('Next'),
        ),
      ),
    );
  }
}