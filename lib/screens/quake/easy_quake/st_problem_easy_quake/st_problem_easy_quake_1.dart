import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class St_pro_easy_quake1 extends StatefulWidget {
  const St_pro_easy_quake1({super.key});

  @override
  State<St_pro_easy_quake1> createState() => _StProblemEasyQuake1State();
}

class _StProblemEasyQuake1State extends State<St_pro_easy_quake1> {
  List<Quiz_1>? selectedQuizzes;

  late List<String?> answers;

  @override
  void initState() {
    super.initState();
    answers = List.filled(5, null);
  }

  List<Quiz_1> _getRandomQuizzes(List<Quiz_1> list, int count) {
    final random = Random();
    final shuffled = List<Quiz_1>.from(list)..shuffle(random);
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
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${index + 1}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              quiz.question,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildAnswerButton(index, '〇', Colors.green, answer == '〇'),
                const SizedBox(width: 16),
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
    return Expanded(
      //width: 70,
      child: OutlinedButton(
        onPressed: () => _selectAnswer(index, symbol),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? color : Colors.white,
          foregroundColor: isSelected ? Colors.white : color,
          side: BorderSide(color: color, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        child: Text(symbol),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    //クイズリスト
    final eazyquizList = [
    Quiz_1(question: t.easy1q1, correctAnswer: '〇', explanation: t.easy1a1),
    Quiz_1(question: t.easy1q2, correctAnswer: '〇', explanation: t.easy1a2),
    Quiz_1(question: t.easy1q3, correctAnswer: '×', explanation: t.easy1a3),
    Quiz_1(question: t.easy1q4, correctAnswer: '〇', explanation: t.easy1a4),
    Quiz_1(question: t.easy1q5, correctAnswer: '〇', explanation: t.easy1a5),
    Quiz_1(question: t.easy1q6, correctAnswer: '×', explanation: t.easy1a6),
    Quiz_1(question: t.easy1q7, correctAnswer: '〇', explanation: t.easy1a7),
    Quiz_1(question: t.easy1q8, correctAnswer: '×', explanation: t.easy1a8),
    Quiz_1(question: t.easy1q9, correctAnswer: '×', explanation: t.easy1a9),
    Quiz_1(question: t.easy1q10, correctAnswer: '×', explanation: t.easy1a10),
    Quiz_1(question: t.easy1q11, correctAnswer: '〇', explanation: t.easy1a11),
    Quiz_1(question: t.easy1q12, correctAnswer: '×', explanation: t.easy1a12),
    Quiz_1(question: t.easy1q13, correctAnswer: '〇', explanation: t.easy1a13),
    Quiz_1(question: t.easy1q14, correctAnswer: '〇', explanation: t.easy1a14),
    Quiz_1(question: t.easy1q15, correctAnswer: '〇', explanation: t.easy1a15),
    Quiz_1(question: t.easy1q16, correctAnswer: '×', explanation: t.easy1a16),
    Quiz_1(question: t.easy1q17, correctAnswer: '〇', explanation: t.easy1a17),
    Quiz_1(question: t.easy1q18, correctAnswer: '×', explanation: t.easy1a18),
    Quiz_1(question: t.easy1q19, correctAnswer: '〇', explanation: t.easy1a19),
    Quiz_1(question: t.easy1q20, correctAnswer: '×', explanation: t.easy1a20),
  ];

  selectedQuizzes ??= _getRandomQuizzes(eazyquizList, 5);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFFe8eaf6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  t.beginner,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
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
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton.icon(
                  onPressed: isAllAnswered
                      ? () {
                          context.go(RoutePaths.st_pro_easy_quake2, extra: {
                            'userAnswers': answers,
                            'quizList': selectedQuizzes,
                          });
                        }
                      : null,
                  icon: const Icon(Icons.check_circle),
                  label: Text(t.answer),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAllAnswered ? Colors.indigo : Colors.grey,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 50),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
