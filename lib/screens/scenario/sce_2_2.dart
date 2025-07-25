import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_2_2 extends StatelessWidget {
  const Sce_2_2({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${t.stage2} - ${t.ng}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red.shade200,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  t.ng,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Text(
                t.rakkabutu + t.siya + t.humareru + t.jimen,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
