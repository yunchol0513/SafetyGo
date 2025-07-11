import 'package:flutter/material.dart';

class Sce_2_4 extends StatelessWidget {
  const Sce_2_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 2 - 不正解',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
        elevation: 4,
      ),
      body: Column(
        children: [
          // 背景と「不正解」表示
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              color: Colors.red.shade200,
              child: const Center(
                child: Text(
                  '不正解',
                  style: TextStyle(
                    fontSize: 40,
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
                  '転倒・ケガのリスク：揺れている最中は地面が不安定になっていることもあり、'
                  '走ると転倒してケガをする恐れがあります。\n\n'
                  '周囲との衝突：人混みの中では他の人とぶつかって転倒したり、'
                  'パニックを引き起こす原因になることも。\n\n'
                  '地割れや陥没への対応が遅れる：大きな地震では道路が陥没したり、'
                  '地割れが起きることも。走っていると足元に注意が向かず、巻き込まれる可能性があります。',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
