import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'quiz.dart';

class St_pro_easy_quake1 extends StatefulWidget {
  const St_pro_easy_quake1({super.key});

  @override
  State<St_pro_easy_quake1> createState() => _StProblemEasyQuake1State();
}

class _StProblemEasyQuake1State extends State<St_pro_easy_quake1> {
  final List<Quiz_1> eazyquizList = [
    Quiz_1(question: '地震が起きたら、まず頭を守る行動が大切である。', correctAnswer: '〇', explanation: '落下物から身を守るため、頭を守ることが最も重要です。'),
    Quiz_1(question: '地震のとき、机の下に隠れるのは安全である。', correctAnswer: '〇', explanation: '揺れが収まるまでは、倒れにくい家具の下に隠れて頭を守ることが基本です。'),
    Quiz_1(question: '家の外に出たら、電柱の近くに立つと安全である。', correctAnswer: '×', explanation: '電柱は倒れたり、電線が切れて落ちたりする危険があるため近づかないようにします。'),
    Quiz_1(question: '避難するときは、靴を履くのがよい。', correctAnswer: '〇', explanation: 'ガラスの破片や瓦礫から足を守るために靴を履いて避難します。'),
    Quiz_1(question: '地震の後は火を使わないようにする。', correctAnswer: '〇', explanation: 'ガス漏れの可能性があるため、火を使わないようにしましょう。'),
    Quiz_1(question: '地震のときはエレベーターで避難する。', correctAnswer: '×', explanation: '停電や閉じ込めの危険があるためエレベーターは使わず階段を使いましょう。'),
    Quiz_1(question: '学校では先生の指示に従うのがよい。', correctAnswer: '〇', explanation: '落ち着いて先生の指示を聞き、安全に避難することが大切です。'),
    Quiz_1(question: '窓のそばは地震のときに安全な場所である。', correctAnswer: '×', explanation: 'ガラスが割れて飛んでくる危険があるため、窓から離れましょう。'),
    Quiz_1(question: '地震のとき、ブロック塀の近くを歩いてよい。', correctAnswer: '×', explanation: '倒れてくる危険があるのでブロック塀からは離れましょう。'),
    Quiz_1(question: '地震が来たらまず119番に電話するのがよい。', correctAnswer: '×', explanation: '緊急時以外は電話が集中するため、安易な通報は避けましょう。'),
    Quiz_1(question: '非常用袋には水と食べ物を入れておく。', correctAnswer: '〇', explanation: '最低3日分の水や食料は備蓄しておきましょう。'),
    Quiz_1(question: '地震のとき、道路の真ん中が安全である。', correctAnswer: '×', explanation: '自動車や看板、建物のガラスの落下など危険が多いため避けましょう。'),
    Quiz_1(question: 'ラジオやスマホで情報を集めるのは大切。', correctAnswer: '〇', explanation: '正確な情報を得ることで適切な行動ができます。'),
    Quiz_1(question: '地震で火災が起きることがある。', correctAnswer: '〇', explanation: '揺れによる電気・ガス設備の異常が火災の原因になります。'),
    Quiz_1(question: 'ガラスの破片に注意が必要である。', correctAnswer: '〇', explanation: '足元や手元に注意し、手袋や靴で保護しましょう。'),
    Quiz_1(question: '家の中ではテレビの下が安全である。', correctAnswer: '×', explanation: '倒れてくる危険があるため、家具から離れて行動しましょう。'),
    Quiz_1(question: '頭を守るためにクッションを使ってもよい。', correctAnswer: '〇', explanation: 'すぐに隠れる場所がないときはクッションで頭を守るのが有効です。'),
    Quiz_1(question: '避難所では大声で話してもよい。', correctAnswer: '×', explanation: '周囲の人に配慮し、落ち着いて行動することが大切です。'),
    Quiz_1(question: '家族と連絡方法を決めておくのがよい。', correctAnswer: '〇', explanation: '災害時にはぐれても合流できるように、事前のルール作りが重要です。'),
    Quiz_1(question: '地震が終わったらすぐ遊びに行ってもよい。', correctAnswer: '×', explanation: '余震の危険があるため、安全が確認されるまで自宅や避難所で待機しましょう。'),
  ];

  late List<Quiz_1> selectedQuizzes;
  late List<String?> answers;

  @override
  void initState() {
    super.initState();
    selectedQuizzes = _getRandomQuizzes(eazyquizList, 5);
    answers = List.filled(selectedQuizzes.length, null);
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
    final quiz = selectedQuizzes[index];
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

  Widget _buildAnswerButton(int index, String symbol, Color color, bool isSelected) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () => _selectAnswer(index, symbol),
        icon: Icon(
          symbol == '〇' ? Icons.check_circle : Icons.cancel,
          color: isSelected ? Colors.white : color,
          size: 18,
        ),
        label: Text(symbol),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? color : Colors.white,
          foregroundColor: isSelected ? Colors.white : color,
          side: BorderSide(color: color, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  '地震クイズ（初級）',
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
                      selectedQuizzes.length,
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
                  label: const Text('答える'),
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
