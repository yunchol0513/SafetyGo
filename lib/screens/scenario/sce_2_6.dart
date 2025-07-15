import 'package:flutter/material.dart';
import 'sce_2_7.dart';
import 'sce_2_8.dart';
import 'sce_2_2.dart'; // ← 追加

class Sce_2_6 extends StatefulWidget {
  const Sce_2_6({super.key});

  @override
  State<Sce_2_6> createState() => _Sce_2_6State();
}

class _Sce_2_6State extends State<Sce_2_6> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    setState(() {
      _message = '地面に近いところのほうが安全なのかな。この人のまねをする？';
      _showButtons = true;
    });
  }

  void _onYes() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Sce_2_2()),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 2',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: Column(
        children: [
          // 上部エリア（背景＋人物）
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/arigatai_2.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),

                // ← 左矢印（前画面）
                Positioned(
                  left: 10,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 36),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sce_2_7()),
                      );
                    },
                  ),
                ),

                // → 右矢印（次画面）
                Positioned(
                  right: 10,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 36),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sce_2_8()),
                      );
                    },
                  ),
                ),

                // 人物画像（中央下に配置）
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: GestureDetector(
                    onTap: _onPersonTap,
                    child: Image.asset(
                      'assets/images/chara1_3.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 下部エリア（テキスト＋ボタン）
          Expanded(
            flex: 3,
            child: Container(
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _message.isEmpty ? 'どんな行動をする？' : _message,
                      style: const TextStyle(fontSize: 18),
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
                            child: const Text('はい'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: _onNo,
                            child: const Text('いいえ'),
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
          ),
        ],
      ),
    );
  }
}
