import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart'; // Quiz クラス

class St_pro_easy_quake3 extends StatefulWidget {
  const St_pro_easy_quake3({super.key});

  @override
  State<St_pro_easy_quake3> createState() => _StProblemEasyQuake3State();
}

class _StProblemEasyQuake3State extends State<St_pro_easy_quake3> {
  final List<Quiz_2> eazyquizList = [
    Quiz_2(question: '地震が起きたら、まず家族に連絡する。', correctAnswer: '×', explanation: '地震が起きたら、まずは自身の安全を確保しましょう。'),//変更済み
    Quiz_2(question: '地震のとき、海辺は安全である。', correctAnswer: '×', explanation: '地震のあとは、津波が起こることがあるので海辺は避けましょう。'),
    Quiz_2(question: '火災発生時は、姿勢を低くして逃げる。', correctAnswer: '〇', explanation: '火災の煙は有害です。煙は上に溜まります、吸い込まないように姿勢を低くして逃げましょう。'),
    Quiz_2(question: '災害に備えて避難経路や避難場所を家族で話し合う。', correctAnswer: '〇', explanation: '災害は突然起こります。大切な家族を守るためにも話し合いましょう'),
    Quiz_2(question: '地震のとき、車を置いて逃げる際は鍵をしめる。', correctAnswer: '×', explanation: '緊急車両の邪魔になる際に動かすため。'),
    Quiz_2(question: '避難後すぐに、自宅に忘れ物をしたので取りに帰る。', correctAnswer: '×', explanation: '地震は何度も起こることがあるので危険。'),
    Quiz_2(question: '非常用袋には防寒具を入れる。', correctAnswer: '〇', explanation: '避難所は多くの人がいます。個人の体温を調節するためにも防寒具を入れましょう'),//変更済み
    Quiz_2(question: '非常用袋には携帯ラジオを入れる。', correctAnswer: '〇', explanation: '緊急時は情報が大切です。情報を得られる物を入れましょう'),
    Quiz_2(question: '台風の来る前に家の周りの飛ばされるものをしまう。', correctAnswer: '〇', explanation: '飛ばされると周りの人の迷惑になります。'),
    Quiz_2(question: '台風の時に、川に行く。', correctAnswer: '×', explanation: '台風や大雨の際は川の流れが速くなります。流される危険があるので川の近くに行かない。'),
    Quiz_2(question: '非常用袋には水と食べ物を入れておく。', correctAnswer: '〇', explanation: '最低3日分の水や食料は備蓄しておきましょう。'),//ok
    Quiz_2(question: '地震のときに初めて避難経路をスマホで調べる。', correctAnswer: '×', explanation: '地震の時はスマホなどの通信機器が使えないことがあります。事前に調べましょう。'),
    Quiz_2(question: 'ラジオやスマホで情報を集めるのは大切。', correctAnswer: '〇', explanation: '正確な情報を得ることで適切な行動ができます。'),//ok
    Quiz_2(question: '避難所には物資が１日で届く。', correctAnswer: '×', explanation: '平均で3日～9日かかることがあります。'),
    Quiz_2(question: '油から火がでたら，水をかける。', correctAnswer: '×', explanation: '水では消えません。消火器などを使いましょう。'),
    Quiz_2(question: 'タンスなど地震で倒れそうなものを固定する。', correctAnswer: '〇', explanation: '倒れてくる危険を減らすため、家具を固定しましょう。'),
    Quiz_2(question: '頭を守るためにクッションを使ってもよい。', correctAnswer: '〇', explanation: 'すぐに隠れる場所がないときはクッションで頭を守るのが有効です。'),
    Quiz_2(question: '避難所は自宅と同じようにしてもよい。', correctAnswer: '×', explanation: '避難所はたくさんの人がいます、周囲の人に配慮しましょう。'),//変更済み
    Quiz_2(question: '家族と連絡方法を決めておくのがよい。', correctAnswer: '〇', explanation: '災害時にはぐれても合流できるように、事前のルール作りが重要です。'),
    Quiz_2(question: '避難の際に人込みを押して逃げる。', correctAnswer: '×', explanation: '避難の際は自分だけでなく周りの人のことを考えて行動しましょう。'),//変更済み
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q${index + 1}. ${quiz.question}'),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => _selectAnswer(index, '〇'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: answers[index] == '〇' ? Colors.green : null,
                ),
                child: const Text('〇'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _selectAnswer(index, '×'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: answers[index] == '×' ? Colors.red : null,
                ),
                child: const Text('×'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('地震クイズ（初級）')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  selectedQuizzes.length,
                  (index) => _buildQuestionItem(index),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: isAllAnswered
                  ? () {
                      context.go(RoutePaths.st_pro_easy_quake4, extra: {
                        'userAnswers': answers,
                        'quizList': selectedQuizzes,
                      });
                    }
                  : null,
              child: const Text('Answer'),
            ),
          ),
        ],
      ),
    );
  }
}