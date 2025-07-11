import 'package:flutter/material.dart';

class Sce_2_3 extends StatelessWidget {
  const Sce_2_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ2 - 不正解',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
        elevation: 4,
      ),
      body: Column(
        children: [
          // 背景 + 不正解表示
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              color: Colors.red.shade200,
              child: const Center(
                child: Text(
                  '不正解',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 解説テキスト
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: const SingleChildScrollView(
                child: Text(
                  '落下物の危険：建物の外壁、看板、ガラス、自動販売機など、'
                  '上から落ちてくるものに直撃する可能性があります。',
                  style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
