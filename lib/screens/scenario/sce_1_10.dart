import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1_10 extends StatefulWidget {
  const Sce1_10({super.key});

  @override
  State<Sce1_10> createState() => _Sce1_10State();
}

class _Sce1_10State extends State<Sce1_10> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Scenario 1 Escape')),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              setState(() {
                showStatus = !showStatus;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sce1-1back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),

          Column(
            children: [
              // 最上部中央にSecondScreenへ
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ElevatedButton(
              //       onPressed: () => context.push(RoutePaths.sce1_1),
              //       child: const Text('Go to 1-1'),
              //     ),
              //   ),
              // ),

              // 中央に変数トグルボタンを横並び
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('集めた情報',
                          style: TextStyle(fontSize: 20),
                        ),
                        if (flg.flg1 == 1) const Text('「メリケンパーク」へ行ったら周りの状況がわかりそうだ。海の方へいこう！'),
                        if (flg.flg2 == 1) const Text('中学校の防災訓練で「神戸生田中学校」が避難所だって聞いたよ'),
                        if (flg.flg3 == 1) const Text('津波が来るらしい！早く高いとこへ行こう！'),
                        if (flg.flg4 == 1) const Text('揺れが収まったね。このまま観光しようかな'),
                        if (flg.flg5 == 1) const Text('近くの避難所は「神戸生田中学校」と「こうべまちづくり会館」と「メリケンパーク」だよ'),
                        if (flg.flg6 == 1) const Text('「こうべまちづくり会館」は津波のときに行かないでね'),
                        if (flg.flg7 == 1) const Text('この前の地震でも被害がなかったね。どこにもいかないでいいかな'),
                        if (flg.flg8 == 1) const Text('とりあえず避難所に行こう'),
                        if (flg.flg9 == 1) const Text('どこの避難所も、歩いて１０分くらいだよ'),
                        if (flg.flg10 == 1) const Text('お母さんどこ？はぐれちゃった...'),
                        if (flg.flg11 == 1) const Text('家族と「こうべまちづくり会館」へいかないと！'),
                        if (flg.flg12 == 1) const Text('避難所ってどこだろう？'),
                        if (flg.flg13 == 1) const Text('駅の向こうに「中学校」があるよ！そこは津波でも大丈夫だよ'),
                        SizedBox(height: 40),
                        if (flg.flg1 == 0 && flg.flg2 == 0 && flg.flg3 == 0 && flg.flg4 == 0 && flg.flg5 == 0 && flg.flg6 == 0 && flg.flg7 == 0 && flg.flg8 == 0 && flg.flg9 == 0 && flg.flg10 == 0 && flg.flg11 == 0 && flg.flg12 == 0 && flg.flg13 == 0) 
                          const Text('近くの人に聞いて、情報を集めてね')
                        else 
                          const Text('どこへ逃げる？'),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (flg.flg1 == 1 || flg.flg5 == 1)
                              ElevatedButton(
                                onPressed: () {
                                  context.push(RoutePaths.sce1_ans);
                                  flg.toggleFlg(21);
                                },
                                child: Text('メリケンパーク')),
                            if (flg.flg2 == 1 || flg.flg5 == 1 || flg.flg13 == 1)
                              ElevatedButton(
                                onPressed: () {
                                  context.push(RoutePaths.sce1_ans);
                                  flg.toggleFlg(22);
                                },
                                child: Text('神戸生田中学校')),
                            if (flg.flg5 == 1 || flg.flg6 == 1 || flg.flg11 == 1)
                              ElevatedButton(
                                onPressed: () {
                                  context.push(RoutePaths.sce1_ans);
                                  flg.toggleFlg(23);
                                },
                                child: Text('こうべまちづくり会館')),
                            if (flg.flg4 == 1 || flg.flg5 == 4 || flg.flg6 == 1)
                              ElevatedButton(
                                onPressed: () {
                                  context.push(RoutePaths.sce1_ans);
                                  flg.toggleFlg(24);
                                },
                                child: Text('その場にとどまる')),
                          ],
                        ),
                      ]
                    ),
                  ),
                )
                
              ),

              // 最下部中央にThirdScreenへ
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Back'),
                  ),
                ),
              ),
            ],
          ),

          // 状態確認パネル（右側表示）
          if (showStatus)
              Align(
                alignment: Alignment.center,
                child: Container(
                  //width: 160,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(-2, 2),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('ゲームを終了しますか？', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          context.push(RoutePaths.scehome);
                          final flg = Provider.of<FlgModel>(context, listen: false);
                          flg.resetAllFlags();
                        },
                        child: Text('終了する')),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showStatus = !showStatus;
                          });
                        },
                        child: Text('ゲームを続ける'))
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
