import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class  Normal_quake extends StatefulWidget {
  const Normal_quake({super.key});
  @override
  State<Normal_quake> createState() => _Normal_quakeState();
}
class _Normal_quakeState extends State<Normal_quake> {
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
      if (data.containsKey('part_2')) {
        int part2Value = (data['part_2'] as num).toInt();

        print('取得した数値: $part2Value');
        // num型変数に格納（例）
        setState(() {
          _cleared = part2Value;
        });
      } else {
        print('part_2 が存在しません');
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
      appBar: AppBar(title: Text('nomal_quake')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton('part:1', isEnabled1, () {
              context.go(RoutePaths.st_pro_normal_quake1);
              print('part:1');
            }),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500), // フェード時間
              opacity: isEnabled2 ? 1.0 : 0.0,              // 1.0=完全表示, 0.0=完全透明
              child: const Text(
                'part1:クリア済み\n標識の知恵',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 12),
            buildButton('part:2', isEnabled2, () {
              context.go(RoutePaths.st_pro_normal_quake6);//一題で2ページ使うので
              print('part:2');
            }),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500), // フェード時間
              opacity: isEnabled3 ? 1.0 : 0.0,              // 1.0=完全表示, 0.0=完全透明
              child: const Text(
                'part2:クリア済み\n災害回避',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 12),

            buildButton('part:3', isEnabled3, () {
              context.go(RoutePaths.st_pro_normal_quake11);
              print('part:3');
            }),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500), // フェード時間
              opacity: isEnabled4 ? 1.0 : 0.0,              // 1.0=完全表示, 0.0=完全透明
              child: const Text(
                'part3:クリア済み\n標識マスター',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 12),
            
            buildButton('戻る', isEnabled1, () {
              context.go(RoutePaths.diffculty_quake);
              print('戻る');
            }),
            SizedBox(height: 40),
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


/*import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class Normal_quake extends StatelessWidget {
  const Normal_quake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('normal_quake')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.diffculty_quake), 
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.st_normal_quake1), 
              child: Text('Study')),
            ElevatedButton(
              onPressed: () => context.go(RoutePaths.st_pro_normal_quake1), 
              child: Text('Problem'),
            ),

          ],
        )
      ),
    );
  }
}*/