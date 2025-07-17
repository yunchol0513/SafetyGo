import 'package:flutter/material.dart';
import 'sce_2_6.dart';
import 'sce_2_3.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_2_8 extends StatefulWidget {
  const Sce_2_8({super.key});

  @override
  State<Sce_2_8> createState() => _Sce_2_8State();
}

class _Sce_2_8State extends State<Sce_2_8> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    final t = AppLocalizations.of(context)!;
    setState(() {
      _message = t.sce2_8 + t.mane;
      _showButtons = true;
    });
  }

  void _onYes() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Sce_2_3()),
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
            // 上部エリア（背景 + 人物）
            SizedBox(
              height: screenHeight * 0.7,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/arigatai_4.jpg',
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
                      color: const Color.fromARGB(221, 254, 254, 254),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Sce_2_6()),
                        );
                      },
                    ),
                  ),
                  // 人物画像（中央に配置）
                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 2 - 75,
                    child: GestureDetector(
                      onTap: _onPersonTap,
                      child: Image.asset(
                        'assets/images/chara1_5.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 下部エリア（テキストと選択肢）
            Container(
              height: screenHeight * 0.3,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  )
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topLeft,
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
                            child: Text(t.yes),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: _onNo,
                            child: Text(t.no),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
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
