// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:safety_go/constants/route_paths.dart';

// class St_pro_easy_quake2 extends StatelessWidget {
//   const St_pro_easy_quake2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Checking_Answer_easy_quake')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go(RoutePaths.easy_quake),
//           child: Text('Finish'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz.dart'; // Quiz モデル（question, correctAnswer, explanation）を定義しているファイル

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class St_pro_easy_quake2 extends StatelessWidget {
  const St_pro_easy_quake2({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final List<String?> userAnswers = extra['userAnswers'];
    final List<Quiz_1> quizList = extra['quizList'];

    // 正解数をカウント
    int correctCount = 0;
    for (int i = 0; i < quizList.length; i++) {
      if (userAnswers[i] == quizList[i].correctAnswer) {
        correctCount++;
      }
    }


    return Scaffold(
      appBar: AppBar(title: const Text('解説と結果')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < quizList.length; i++) ...[
              Text(
                'Q${i + 1}. ${quizList[i].question}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text('あなたの答え：${userAnswers[i] ?? "未回答"}'),
              Text('正解：${quizList[i].correctAnswer}'),
              Text('解説：${quizList[i].explanation}'),
              const Divider(height: 24),
            ],
            const SizedBox(height: 12),
            Text(
              '正解率：${((correctCount / quizList.length) * 100).toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _onQuizFinished(context: context, correctCount: correctCount, totalCount: quizList.length);//firebase書き込み
                },
                child: const Text('Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ① 解説画面で Finish ボタンを押したときに呼び出す
Future<void> _onQuizFinished({
  required BuildContext context,
  required int correctCount,
  required int totalCount,
}) async {
  if (correctCount == totalCount) {
    // ✅ 全問正解
    await _savePart1Flag();// Firestore へ書き込み
  }

  // 例：ホームへ戻る（経路はお好みで）
  context.go('/diffculty_quake');
}

// ② Firestore にフラグを保存
Future<void> _savePart1Flag() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef =
      FirebaseFirestore.instance.collection('progress').doc(uid);

  await FirebaseFirestore.instance.runTransaction((tx) async {
    final snapshot = await tx.get(docRef);

    // 既にデータがある場合は取り出し、無ければ 0 扱い
    final current = (snapshot.data()?['part_1'] ?? 0) as int;

    // 🔸 元の数字が 1 以上なら何もしない
    if (current >= 1) return;

    // 0（あるいは存在しない）ときだけ 1 を書き込む
    tx.set(docRef, {'part_1': 1}, SetOptions(merge: true));
  });
}