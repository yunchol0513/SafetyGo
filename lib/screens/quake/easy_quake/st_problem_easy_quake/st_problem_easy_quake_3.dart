import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart'; // Quiz_2 クラス

class St_pro_easy_quake3 extends StatefulWidget {
  const St_pro_easy_quake3({super.key});

  @override
  State<St_pro_easy_quake3> createState() => _StProblemEasyQuake3State();
}

class _StProblemEasyQuake3State extends State<St_pro_easy_quake3> {
  final List<Quiz_2> eazyquizList = [
    Quiz_2(question: '地震が起きたら、まず家族に連絡する。', correctAnswer: '×', explanation: '地震が起きたら、まずは自身の安全を確保しましょう。'),
    Quiz_2(question: '地震のとき、海辺は安全である。', correctAnswer: '×', explanation: '地震のあとは、津波が起こることがあるので海辺は避けましょう。'),
    Quiz_2(question: '火災発生時は、姿勢を低くして逃げる。', correctAnswer: '〇', explanation: '火災の煙は有害です。煙は上に溜まります、吸い込まないように姿勢を低くして逃げましょう。'),
    Quiz_2(question: '災害に備えて避難経路や避難場所を家族で話し合う。', correctAnswer: '〇', explanation: '災害は突然起こります。大切な家族を守るためにも話し合いましょう'),
    Quiz_2(question: '地震のとき、車を置いて逃げる際は鍵をしめる。', correctAnswer: '×', explanation: '車のカギは開けっ放しで付けておきましょう。緊急車両の邪魔になる際に動かすためです。'),
    Quiz_2(question: '避難後すぐに、自宅に忘れ物をしたので取りに帰る。', correctAnswer: '×', explanation: '避難後はスマホやラジオで安全が確認してから判断しましょう。地震は何度も起こることがあるので危険です。'),
    Quiz_2(question: '非常用袋には防寒具を入れる。', correctAnswer: '〇', explanation: '避難所は多くの人がいます。個人の体温を調節するためにも防寒具を入れましょう。'),
    Quiz_2(question: '非常用袋には携帯ラジオを入れる。', correctAnswer: '〇', explanation: '緊急時は情報が大切です。情報を得られる物を入れましょう'),
    Quiz_2(question: '台風の来る前に家の周りの飛ばされるものを家の中に入れる。', correctAnswer: '〇', explanation: '飛ばされるものは家の中に入れましょう。飛ばされると周りの人の迷惑になります。'),
    Quiz_2(question: '台風の時に、川に行く。', correctAnswer: '×', explanation: '台風や大雨の際は川の流れが速くなります。流される危険があるので川の近くに行かない。'),
    Quiz_2(question: '非常用袋には水と食べ物を入れておく。', correctAnswer: '〇', explanation: '最低3日分の水や食料は備蓄しておきましょう。'),
    Quiz_2(question: '地震のときに初めて避難経路をスマホで調べる。', correctAnswer: '×', explanation: '地震の時はスマホなどの通信機器が使えないことがあります。事前に調べましょう。'),
    Quiz_2(question: 'ラジオやスマホで情報を集めるのは大切。', correctAnswer: '〇', explanation: '正確な情報を得ることで適切な行動ができます。'),
    Quiz_2(question: '避難所には物資が１日で届く。', correctAnswer: '×', explanation: '平均で3日～9日かかることがあります。'),
    Quiz_2(question: '油から火がでたら，水をかける。', correctAnswer: '×', explanation: '水では消えません。消火器などを使いましょう。'),
    Quiz_2(question: 'タンスなど地震で倒れそうなものを固定する。', correctAnswer: '〇', explanation: '倒れてくる危険を減らすため、家具を固定しましょう。'),
    Quiz_2(question: '頭を守るためにクッションを使ってもよい。', correctAnswer: '〇', explanation: 'すぐに隠れる場所がないときはクッションで頭を守るのが有効です。'),
    Quiz_2(question: '避難所は自宅と同じようにしてもよい。', correctAnswer: '×', explanation: '避難所はたくさんの人がいます、周囲の人に配慮しましょう。'),
    Quiz_2(question: '家族と連絡方法を決めておくのがよい。', correctAnswer: '〇', explanation: '災害時にはぐれても合流できるように、事前のルール作りが重要です。'),
    Quiz_2(question: '避難の際に人込みを押して逃げる。', correctAnswer: '×', explanation: '避難の際は自分だけでなく周りの人のことを考えて行動しましょう。'),
  ];

  late List<Quiz_2> selectedQuizzes;
  late List<String?> answers;

  @override
  void initState() {
    super.initState();
    selectedQuizzes = _getRandomQuizzes(eazyquizList, 5);
    answers = List.filled(selectedQuizzes.length, null);
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
    final quiz = selectedQuizzes[index];
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('地震クイズ（初級）'),
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
                      selectedQuizzes.length,
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
                    label: const Text('答える'),
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
