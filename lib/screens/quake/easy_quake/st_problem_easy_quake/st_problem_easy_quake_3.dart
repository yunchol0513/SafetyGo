import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart'; // Quiz_2 クラス
import 'package:safety_go/l10n/app_localizations.dart';

class St_pro_easy_quake3 extends StatefulWidget {
  const St_pro_easy_quake3({super.key});

  @override
  State<St_pro_easy_quake3> createState() => _StProblemEasyQuake3State();
}

class _StProblemEasyQuake3State extends State<St_pro_easy_quake3> {
  List<Quiz_2>? selectedQuizzes;

  late List<String?> answers;

  @override
  void initState() {
    super.initState();
    answers = List.filled(5, null);
  }

  List<Quiz_2> _getRandomQuizzes(List<Quiz_2> list, int count) {
    final random = Random();
    final shuffled = List<Quiz_2>.from(list)..shuffle(random);
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
    final answer = answers[index];

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${index + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quiz.question,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildAnswerButton(index, '〇', Colors.green, answer == '〇'),
                const SizedBox(width: 12),
                _buildAnswerButton(index, '×', Colors.red, answer == '×'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton(
      int index, String symbol, Color color, bool isSelected) {
    return SizedBox(
      width: 70,
      child: OutlinedButton(
        onPressed: () => _selectAnswer(index, symbol),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? color : Colors.white,
          foregroundColor: isSelected ? Colors.white : color,
          side: BorderSide(color: color, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
        child: Text(symbol),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    //クイズ
    final eazyquizList = [
    Quiz_2(question: t.easy3q1, correctAnswer: '×', explanation: t.easy3a1),
    Quiz_2(question: t.easy3q2, correctAnswer: '×', explanation: t.easy3a2),
    Quiz_2(question: t.easy3q3, correctAnswer: '〇', explanation: t.easy3a3),
    Quiz_2(question: t.easy3q4, correctAnswer: '〇', explanation: t.easy3a4),
    Quiz_2(question: t.easy3q5, correctAnswer: '×', explanation: t.easy3a5),
    Quiz_2(question: t.easy3q6, correctAnswer: '×', explanation: t.easy3a6),
    Quiz_2(question: t.easy3q7, correctAnswer: '〇', explanation: t.easy3a7),
    Quiz_2(question: t.easy3q8, correctAnswer: '〇', explanation: t.easy3a8),
    Quiz_2(question: t.easy3q9, correctAnswer: '〇', explanation: t.easy3a9),
    Quiz_2(question: t.easy3q10, correctAnswer: '×', explanation: t.easy3a10),
    Quiz_2(question: t.easy1q11, correctAnswer: '〇', explanation: t.easy1a11),
    Quiz_2(question: t.easy3q11, correctAnswer: '×', explanation: t.easy3a11),
    Quiz_2(question: t.easy3q12, correctAnswer: '〇', explanation: t.easy3a12),
    Quiz_2(question: t.easy3q13, correctAnswer: '×', explanation: t.easy3a13),
    Quiz_2(question: t.easy3q14, correctAnswer: '×', explanation: t.easy3a14),
    Quiz_2(question: t.easy3q15, correctAnswer: '〇', explanation: t.easy3a15),
    Quiz_2(question: t.easy1q17, correctAnswer: '〇', explanation: t.easy1a17),
    Quiz_2(question: t.easy3q16, correctAnswer: '×', explanation: t.easy3a16),
    Quiz_2(question: t.easy1q19, correctAnswer: '〇', explanation: t.easy1a19),
    Quiz_2(question: t.easy3q17, correctAnswer: '×', explanation: t.easy3a17),
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
            colors: [Color(0xFFF1F8E9), Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: List.generate(
                      selectedQuizzes!.length,
                      (index) => _buildQuestionItem(index),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton.icon(
                    onPressed: isAllAnswered
                        ? () {
                            context.go(RoutePaths.st_pro_easy_quake4, extra: {
                              'userAnswers': answers,
                              'quizList': selectedQuizzes,
                            });
                          }
                        : null,
                    icon: const Icon(Icons.check_circle_outline),
                    label: Text(t.answer),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isAllAnswered ? Colors.indigo : Colors.grey.shade400,
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
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
