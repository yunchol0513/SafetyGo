import 'package:flutter/material.dart';
import 'package:safety_go/screens/scenario/sce_3_4.dart';
import 'sce_2_6.dart';
import 'sce_2_9.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_3_3 extends StatelessWidget {
  const Sce_3_3({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.stage1,
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
                'assets/images/arigatai_1.jpg',
                fit: BoxFit.cover,           // 画面全体をカバー、中央基準で拡大縮小
                alignment: Alignment.center, // 中央を基準に表示
              ),
                ),

                /// ← 左矢印（強調）
                Positioned(
                left: 16,
                top: 100,
                child: Material(
                 color: Colors.black.withOpacity(0.5),
                 shape: const CircleBorder(),
                elevation: 6,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                 Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Sce_3_4()),
        );
      },
    ),
),
),


                // → 右矢印

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
              child: Text(
                t.sce3_3,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
