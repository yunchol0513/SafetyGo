import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Select_language extends StatelessWidget {
  const Select_language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('select_language')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RoutePaths.rogin),
          child: Text('Next'),
        ),
      ),
    );
  }
}