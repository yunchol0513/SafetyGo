import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Creative_quake extends StatefulWidget {
  const Creative_quake({super.key});
  @override
  State<Creative_quake> createState() => _creative_quakeState();
}
class _creative_quakeState extends State<Creative_quake> {
  int _cleared  = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }
  Future<void> _loadProgress() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;//これ必須
  try {
    // 例：'user' コレクションの 'userId' ドキュメントから取得（AIにこれを言われたら上の必須と下に習うとできます）
    DocumentSnapshot doc = await firestore.collection('progress').doc(uid).get();

    if (doc.exists && doc.data() != null) {
      final data = doc.data() as Map<String, dynamic>;

      // part_1 が存在し、数値型である場合
      if (data.containsKey('part_3')) {
        int part3Value = (data['part_3'] as num).toInt();

        print('取得した数値: $part3Value');
        // num型変数に格納（例）
        setState(() {
          _cleared = part3Value;
        });
      } else {
        print('part_3 が存在しません');
        return;
      }
    } else {
      print('ドキュメントが存在しません');
      return;
    }
  } catch (e) {
    print('エラー: $e');
    return;
  }
}


  @override
  Widget build(BuildContext context) {
    bool isEnabled1 = _cleared >=0;
    bool isEnabled2 = _cleared>=1;
    bool isEnabled3 = _cleared>=2;
    bool isEnabled4 = _cleared >=3;
    return Scaffold(
      appBar: AppBar(title: Text('active_quake')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              SizedBox(width: 10),
              Visibility(visible: isEnabled2,
              child: Image.asset('assets/images/enblem/トロッコ_part1.png',width: 200,height:240,fit:BoxFit.cover)),
              SizedBox(width: 10),
              Visibility(visible: isEnabled3,
              child:Image.asset("assets/images/enblem/トロッコ_part2.png",width: 200,height:240,fit:BoxFit.cover)),
              SizedBox(width: 10),
              Visibility(visible: isEnabled4,
              child:Image.asset("assets/images/enblem/トロッコ_part3.png",width: 200,height:240,fit:BoxFit.cover))
            ],),
            SizedBox(height: 20),
            buildButton('part:1', isEnabled1, () {
              context.go(RoutePaths.creative_1);
              print('part:1');
            }),

            AnimatedOpacity(
              duration: const Duration(milliseconds: 500), // フェード時間
              opacity: isEnabled2 ? 1.0 : 0.0,              // 1.0=完全表示, 0.0=完全透明
              child: const Text(
                'part1:クリア済み\n上級の称号',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 12),
             SizedBox(height: 20),
            buildButton('part:2', isEnabled2, () {
              context.go(RoutePaths.creative_21);//一題で2ページ使うので
              print('part:2');
            }),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500), // フェード時間
              opacity: isEnabled3 ? 1.0 : 0.0,              // 1.0=完全表示, 0.0=完全透明
              child: const Text(
                'part2:クリア済み\n',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(height: 20),
            buildButton('part:3', isEnabled3, () {
              context.go(RoutePaths.creative_31);
              print('part:3');
            }),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500), // フェード時間
              opacity: isEnabled4 ? 1.0 : 0.0,              // 1.0=完全表示, 0.0=完全透明
              child: const Text(
                'part3:クリア済み\n災害マスターの称号',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(height: 40),
            buildButton('戻る', isEnabled1, () {
              context.go(RoutePaths.diffculty_quake);
              print('戻る');
            }),
          ]
      ),
    ),
    );
  }
  Widget buildButton(String label, bool isEnabled, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blue : Colors.grey,
        foregroundColor: Colors.white,
      ),
      child: Text(label),
    );
  }
}