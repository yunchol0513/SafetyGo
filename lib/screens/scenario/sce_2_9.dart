import 'package:flutter/material.dart';
import 'sce_2_7.dart';
import 'sce_2_10.dart';
import 'sce_2_1.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_2_9 extends StatefulWidget {
  const Sce_2_9({super.key});

  @override
  State<Sce_2_9> createState() => _Sce_2_9State();
}

class _Sce_2_9State extends State<Sce_2_9> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    final t = AppLocalizations.of(context)!;
    setState(() {
      _message = t.sce2_9 + t.mane;
      _showButtons = true;
    });
  }

  void _onYes() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Sce_2_1()),
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.stage2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.7,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/arigatai_3.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  // ← 左矢印
                  Positioned(
                    left: 10,
                    top: 100,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 36),
                      color: const Color.fromARGB(221, 252, 251, 251),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Sce_2_10()),
                        );
                      },
                    ),
                  ),
                  // → 右矢印
                  Positioned(
                    right: 10,
                    top: 100,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 36),
                      color: const Color.fromARGB(221, 255, 254, 254),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Sce_2_7()),
                        );
                      },
                    ),
                  ),
                  // 人物画像（下寄せ）
                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 2 - 75,
                    child: GestureDetector(
                      onTap: _onPersonTap,
                      child: Image.asset(
                        'assets/images/hito1_6.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.3,
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
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      child: Text(
                        _message.isEmpty ? t.koudou : _message,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  if (_showButtons)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: _onYes,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: Text(t.yes),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: _onNo,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            child: Text(t.no),
                          ),
                        ],
                      ),
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
