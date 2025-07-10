import 'package:flutter/material.dart';

class Sce_2_2 extends StatelessWidget {
  const Sce_2_2({super.key});

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
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: const SingleChildScrollView(
                child: Text(
                  '落下物の危険：建物の外壁、看板、ガラス、自動販売機など、'
                  '上から落ちてくるものに直撃する可能性があります。\n\n'
                  '視界が狭くなる：周囲の状況が把握しづらくなり、逃げ遅れるリスクが高まります。\n\n'
                  '踏まれる危険：人混みの中では、他の人に踏まれたり転倒の原因になることもあります。\n\n'
                  '地割れや地面の変化：大きな地震では地面が割れたり、液状化現象が起こることもあり、'
                  '寝転がっていると対応が遅れます。',
                  style: TextStyle(fontSize: 17, height: 1.5, color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
