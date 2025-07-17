import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz.dart'; // Quiz モデルを定義しているファイル
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class St_pro_easy_quake2 extends StatelessWidget {
  const St_pro_easy_quake2({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final List<String?> userAnswers = extra['userAnswers'];
    final List<Quiz_1> quizList = extra['quizList'];

    int correctCount = 0;
    for (int i = 0; i < quizList.length; i++) {
      if (userAnswers[i] == quizList[i].correctAnswer) {
        correctCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.exandre),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF1F8E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(quizList.length, (i) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q${i + 1}. ${quizList[i].question}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t.yourans + '：${userAnswers[i] ?? t.notans}',
                            style: const TextStyle(color: Colors.black87),
                          ),
                          Text(
                            t.ok + '：${quizList[i].correctAnswer}',
                            style: const TextStyle(color: Colors.teal),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            t.ans + '：${quizList[i].explanation}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    t.per + '：${((correctCount / quizList.length) * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _onQuizFinished(
                          context: context,
                          correctCount: correctCount,
                          totalCount: quizList.length,
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Finish'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Finishボタン押下後の処理
Future<void> _onQuizFinished({
  required BuildContext context,
  required int correctCount,
  required int totalCount,
}) async {
  if (correctCount == totalCount) {
    await _savePart1Flag(); // 全問正解時に Firestore に保存
  }

  context.go('/diffculty_quake'); // ホームや難易度選択画面へ遷移
}

// ✅ Firestoreにフラグを書き込む処理
Future<void> _savePart1Flag() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef = FirebaseFirestore.instance.collection('game_progress').doc(uid);

  await FirebaseFirestore.instance.runTransaction((tx) async {
    final snapshot = await tx.get(docRef);
    final current = (snapshot.data()?['part_1'] ?? 0) as int;

    if (current >= 1) return; // 既に1以上なら何もしない

    tx.set(docRef, {'part_1': 1}, SetOptions(merge: true));
  });
}
