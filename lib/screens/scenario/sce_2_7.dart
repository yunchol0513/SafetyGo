import 'package:flutter/material.dart';
import 'sce_2_6.dart';
import 'sce_2_9.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_2_7 extends StatelessWidget {
  const Sce_2_7({super.key});

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
        elevation: 3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 上部 背景部分
            SizedBox(
              height: screenHeight * 0.7,
              width: double.infinity,
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

                  // ← 左矢印
                  Positioned(
                    left: 10,
                    top: 100,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 36),
                      color: const Color.fromARGB(221, 250, 249, 249),
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
                      color: const Color.fromARGB(221, 254, 254, 254),
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
            Container(
              height: screenHeight * 0.3,
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
                t.koudou,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
