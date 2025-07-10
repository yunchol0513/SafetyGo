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
      _message = '「いいえ」が選ばれました。';
      _showButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 1 - シーン3',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 上部（画像）
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                // 背景画像
                Center(
                  child: Image.asset(
                    'assets/images/haikei_3.jpg',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                  ),
                ),

                // 左矢印
                Positioned(
                  left: 8,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 32),
                    color: Colors.black87,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sce_2_7()),
                      );
                    },
                  ),
                ),

                // 右矢印
                Positioned(
                  right: 8,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 32),
                    color: Colors.black87,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sce_2_8()),
                      );
                    },
                  ),
                ),

                // 人物画像（下半分）
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: GestureDetector(
                    onTap: _onPersonTap,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.5,
                        child: Image.asset(
                          'assets/images/chara1_3.jpg',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 下部（メッセージ・ボタン）
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  )
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _message.isEmpty ? 'どんな行動をする？' : _message,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  if (_showButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: _onYes,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          child: const Text('はい'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: _onNo,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          child: const Text('いいえ'),
                        ),
                      ],
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
