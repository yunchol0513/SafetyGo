import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class St_pro_easy_quake2 extends StatelessWidget {
  const St_pro_easy_quake2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checking_Answer_easy_quake')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RoutePaths.easy_quake),
          child: Text('Finish'),
        ),
      ),
    );
  }
}