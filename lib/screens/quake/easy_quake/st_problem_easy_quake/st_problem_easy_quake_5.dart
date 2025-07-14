import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart'; // Quiz クラス
import 'package:safety_go/l10n/app_localizations.dart';

class St_pro_easy_quake5 extends StatefulWidget {
  const St_pro_easy_quake5({super.key});

  @override
  State<St_pro_easy_quake5> createState() => _StProblemEasyQuake5State();
}

class _StProblemEasyQuake5State extends State<St_pro_easy_quake5> {
  List<Quiz_3>? selectedQuizzes;
  late List<String?> answers;

  @override
  void initState() {
    super.initState();
    answers = List.filled(5, null);
  }

  List<Quiz_3> _getRandomQuizzes(List<Quiz_3> list, int count) {
    final random = Random();
    final shuffled = List<Quiz_3>.from(list)..shuffle(random);
    return shuffled.take(count).toList();
  }

  bool get isAllAnswered => answers.every((ans) => ans != null);

  void _selectAnswer(int index, String choice) {
    setState(() {
      answers[index] = choice;
    });
  }

  Widget _buildQuestionItem(int index) {
    final quiz = selectedQuizzes![index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${index + 1}. ${quiz.question}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectAnswer(index, '〇'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[index] == '〇' ? Colors.green : null,
                  ),
                  child: const Text('〇'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _selectAnswer(index, '×'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        answers[index] == '×' ? Colors.red : null,
                  ),
                  child: const Text('×'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    //クイズ内容
    final eazyquizList = [
    Quiz_3(question: t.easy1q1, correctAnswer: '〇', explanation: t.easy1a1),
    Quiz_3(question: t.easy5q1, correctAnswer: '〇', explanation: t.easy5a1),
    Quiz_3(question: t.easy5q2, correctAnswer: '〇', explanation: t.easy5a2),
    Quiz_3(question: t.easy5q3, correctAnswer: '×', explanation: t.easy5a3),
    Quiz_3(question: t.easy5q4, correctAnswer: '×', explanation: t.easy5a4),
    Quiz_3(question: t.easy5q5, correctAnswer: '〇', explanation: t.easy5a5),
    Quiz_3(question: t.easy5q6, correctAnswer: '〇', explanation: t.easy5a6),
    Quiz_3(question: t.easy5q7, correctAnswer: '〇', explanation: t.easy5a7),
    Quiz_3(question: t.easy5q8, correctAnswer: '×', explanation: t.easy5a8),
    Quiz_3(question: t.easy5q9, correctAnswer: '×', explanation: t.easy5a9),
    Quiz_3(question: t.easy1q11, correctAnswer: '〇', explanation: t.easy1a11),
    Quiz_3(question: t.easy1q12, correctAnswer: '×', explanation: t.easy1a12),
    Quiz_3(question: t.easy1q13, correctAnswer: '〇', explanation: t.easy1a13),
    Quiz_3(question: t.easy1q14, correctAnswer: '〇', explanation: t.easy1a14),
    Quiz_3(question: t.easy1q15, correctAnswer: '〇', explanation: t.easy1a15),
    Quiz_3(question: t.easy1q16, correctAnswer: '×', explanation: t.easy1a16),
    Quiz_3(question: t.easy1q17, correctAnswer: '〇', explanation: t.easy1a17),
    Quiz_3(question: t.easy1q18, correctAnswer: '×', explanation: t.easy1a18),
    Quiz_3(question: t.easy1q19, correctAnswer: '〇', explanation: t.easy1a19),
    Quiz_3(question: t.easy5q10, correctAnswer: '×', explanation: t.easy5a10),
  ];

  selectedQuizzes ??= _getRandomQuizzes(eazyquizList, 5);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.beginner),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: List.generate(
                      selectedQuizzes!.length,
                      (index) => _buildQuestionItem(index),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: isAllAnswered
                      ? () {
                          context.go(RoutePaths.st_pro_easy_quake6, extra: {
                            'userAnswers': answers,
                            'quizList': selectedQuizzes,
                          });
                        }
                      : null,
                  icon: const Icon(Icons.send),
                  label: Text(t.answer),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
