import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class St_pro_easy_quake1 extends StatelessWidget {
  const St_pro_easy_quake1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Question_easy_quake')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RoutePaths.st_pro_easy_quake2),
          child: Text('Answer'),
        ),
      ),
    );
  }
}