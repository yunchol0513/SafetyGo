import 'package:flutter/material.dart';
import 'sce_2_6.dart';
import 'sce_2_9.dart';
import 'sce_2_3.dart';

class Sce_2_8 extends StatefulWidget {
  const Sce_2_8({super.key});

  @override
  State<Sce_2_8> createState() => _Sce_2_8State();
}

class _Sce_2_8State extends State<Sce_2_8> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    setState(() {
      _message = 'あの場所ってじょうぶなのかな。この人のまねをする？';
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
      _message = '「いいえ」が選ばれました。';
      _showButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 1',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: Column(
        children: [
          // 上部エリア（背景 + 人物）
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/haikei1_5.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // ← 左矢印
                Positioned(
                  left: 10,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 36),
                    color: Colors.black87,
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
