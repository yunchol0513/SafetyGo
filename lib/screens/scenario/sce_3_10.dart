import 'package:flutter/material.dart';
import 'package:safety_go/screens/scenario/sce_2_1.dart';
import 'package:safety_go/screens/scenario/sce_3_11.dart';
import 'package:safety_go/screens/scenario/sce_3_2.dart';
import 'package:safety_go/screens/scenario/sce_3_7.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_3_10 extends StatelessWidget {
  const Sce_3_10({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
          // 上部テキスト
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            width: double.infinity,
            color: Colors.white,
            child: Text(
              t.sce3_10,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),

          // タピオカ屋 & 小籠包屋ボタン（横並び）
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // タピオカ屋ボタン：今は何もしない
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    t.tapi,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Sce_3_11()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    t.xiao,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // 下部テキストと次へボタン
          Container(
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t.goxiao,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
