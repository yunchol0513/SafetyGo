import 'package:flutter/material.dart';
import 'sce_2_6.dart';
import 'sce_2_9.dart';

class Sce_2_7 extends StatelessWidget {
  const Sce_2_7({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 2 ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 上部 背景部分
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/nankin_background.jpg',
                    fit: BoxFit.contain,
                    alignment: const Alignment(0, 1.0),
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
                        MaterialPageRoute(builder: (context) => const Sce_2_9()),
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
                    color: Colors.black87,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sce_2_6()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // 下部 テキスト表示
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
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  )
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: const Text(
                'どんな行動をする？',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
