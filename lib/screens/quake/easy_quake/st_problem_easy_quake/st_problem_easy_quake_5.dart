import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart'; // Quiz クラス

class St_pro_easy_quake5 extends StatefulWidget {
  const St_pro_easy_quake5({super.key});

  @override
  State<St_pro_easy_quake5> createState() => _StProblemEasyQuake5State();
}

class _StProblemEasyQuake5State extends State<St_pro_easy_quake5> {
  final List<Quiz_3> eazyquizList = [
    Quiz_3(question: '地震が起きたら、まず頭を守る行動が大切である。', correctAnswer: '〇', explanation: '落下物から身を守るため、頭を守ることが最も重要です。'),
    Quiz_3(question: '災害時、建物に閉じ込められたら近くにあるものを叩いて音を出す。', correctAnswer: '〇', explanation: 'たくさんの体力を使わずに助けを知らせることができる。'),
    Quiz_3(question: '懐中電灯には蓄光テープを張る。', correctAnswer: '〇', explanation: '停電で真っ暗になっても探すことができる。'),
    Quiz_3(question: '避難するときにビーチサンダルを履く。', correctAnswer: '×', explanation: 'ガラスの破片や瓦礫から足を守るための靴を履いて避難します。'),
    Quiz_3(question: '水害時に長靴を履いて歩く。', correctAnswer: '×', explanation: '長靴は脱げやすく、中に水が入って歩けなくなるのでスニーカーを履こう。'),
    Quiz_3(question: '火災を見つけたたら119番に電話する。', correctAnswer: '〇', explanation: '電話したら「火事です」と伝えましょう。'),
    Quiz_3(question: '消火器の使用時間は約15秒である。', correctAnswer: '〇', explanation: '思ったよりも短いです。'),
    Quiz_3(question: '火災対策としてコンセントのホコリを掃除する。', correctAnswer: '〇', explanation: 'コンセントに溜まるホコリは発火する原因です。定期的に掃除しましょう。'),
    Quiz_3(question: '消火器は火先を狙って使う。', correctAnswer: '×', explanation: '火元を狙って消化しよう。大きな火の場合は身の安全を優先する。'),
    Quiz_3(question: '地震の避難時は身軽で軽装な服装で逃げる。', correctAnswer: '×', explanation: 'ガラス等から身を守るために長そで・長ズボンを着る。'),
    Quiz_3(question: '非常用袋には水と食べ物を入れておく。', correctAnswer: '〇', explanation: '最低3日分の水や食料は備蓄しておきましょう。'),
    Quiz_3(question: '地震のとき、道路の真ん中が安全である。', correctAnswer: '×', explanation: '自動車や看板、建物のガラスの落下など危険が多いため避けましょう。'),
    Quiz_3(question: 'ラジオやスマホで情報を集めるのは大切。', correctAnswer: '〇', explanation: '正確な情報を得ることで適切な行動ができます。'),
    Quiz_3(question: '地震で火災が起きることがある。', correctAnswer: '〇', explanation: '揺れによる電気・ガス設備の異常が火災の原因になります。'),
    Quiz_3(question: 'ガラスの破片に注意が必要である。', correctAnswer: '〇', explanation: '足元や手元に注意し、手袋や靴で保護しましょう。'),
    Quiz_3(question: '家の中ではテレビの下が安全である。', correctAnswer: '×', explanation: '倒れてくる危険があるため、家具から離れて行動しましょう。'),
    Quiz_3(question: '頭を守るためにクッションを使ってもよい。', correctAnswer: '〇', explanation: 'すぐに隠れる場所がないときはクッションで頭を守るのが有効です。'),
    Quiz_3(question: '避難所では大声で話してもよい。', correctAnswer: '×', explanation: '周囲の人に配慮し、落ち着いて行動することが大切です。'),
    Quiz_3(question: '家族と連絡方法を決めておくのがよい。', correctAnswer: '〇', explanation: '災害時にはぐれても合流できるように、事前のルール作りが重要です。'),
    Quiz_3(question: '地震が終わったらすぐ遊びに行ってもよい。', correctAnswer: '×', explanation: '余震の危険があるため、安全が確認されるまで自宅や避難所で待機しましょう。'),
  ];

  late List<Quiz_3> selectedQuizzes;
  late List<String?> answers;

  @override
  void initState() {
    super.initState();
    selectedQuizzes = _getRandomQuizzes(eazyquizList, 5);
    answers = List.filled(selectedQuizzes.length, null);
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
                      context.go(RoutePaths.st_pro_easy_quake6, extra: {
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