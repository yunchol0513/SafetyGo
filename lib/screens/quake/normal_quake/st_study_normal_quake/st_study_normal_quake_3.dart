import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class St_normal_quake3 extends StatelessWidget {
  const St_normal_quake3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('normal_quake_No3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RoutePaths.normal_quake),
          child: Text('Finish'),
        ),
      ),
    );
  }
}