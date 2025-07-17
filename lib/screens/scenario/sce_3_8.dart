import 'package:flutter/material.dart';
import 'package:safety_go/screens/scenario/sce_3_10.dart';
import 'package:safety_go/screens/scenario/sce_3_5.dart';
import 'package:safety_go/screens/scenario/sce_3_9.dart';
import 'sce_2_9.dart';
import 'sce_2_4.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_3_8 extends StatefulWidget {
  const Sce_3_8({super.key});

  @override
  State<Sce_3_8> createState() => _Sce_3_4State();
}

class _Sce_3_4State extends State<Sce_3_8> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    final t = AppLocalizations.of(context)!;
    setState(() {
      _message = t.sce3_8;
      _showButtons = true;
    });
  }

  void _onYes() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Sce_3_9()),
    );
  }

  void _onNo() {
    setState(() {
      _message = '';
      _showButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.stage1,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 上部画像とキャラ
            Stack(
              children: [
                Image.asset(
                  'assets/images/arigatai_3.jpg',
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                Positioned(
                  bottom: 40,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: GestureDetector(
                    onTap: _onPersonTap,
                    child: Image.asset(
                      'assets/images/character.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),

            // 下部テキストとボタン
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _message.isEmpty ? t.touchp : _message,
                    style: const TextStyle(fontSize: 18),
                  ),
                  if (_showButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: _onYes,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: Text(t.next),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
