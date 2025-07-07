import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Diffculty_quake extends StatelessWidget {
  const Diffculty_quake({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(t.diffcultyTitle)),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.detail), 
              child: Text(t.back),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.easy_quake), 
              child: Text(t.easy),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.normal_quake), 
              child: Text(t.normal),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.creative_quake), 
              child: Text("active"),
            ),
          ],
        )
      ),
    );
  }
}