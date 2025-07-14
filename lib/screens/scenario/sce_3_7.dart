import 'package:flutter/material.dart';
import 'package:safety_go/screens/scenario/sce_3_4.dart';
import 'package:safety_go/screens/scenario/sce_3_8.dart';

class Sce_3_7 extends StatelessWidget {
  const Sce_3_7({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 1 ',
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

                // → 右矢印（強調表示）
                Positioned(
                  right: 16,
                  top: 100,
                  child: Material(
                    color: Colors.black.withOpacity(0.5),
                    shape: const CircleBorder(),
                    elevation: 6,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Sce_3_8()),
                        );
                      },
                    ),
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
                '矢印を押して人を探そう',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
