import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce1_ans extends StatefulWidget {
  const Sce1_ans({super.key});

  @override
  State<Sce1_ans> createState() => _Sce1_ansState();
}

class _Sce1_ansState extends State<Sce1_ans> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);

    return Scaffold(
      appBar: AppBar(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (flg.ans1 == 1) 
                        const Text('メリケンパークに行く途中で津波が来ちゃった。海の近くには絶対に行っては行けないよ'),
                      if (flg.ans2 == 1) 
                        const Text('こうべまちづくり会館は津波'),
                      if (flg.ans3 == 1) const Text('津波が来るらしい！早く高いとこへ行こう！'),
                      if (flg.ans4 == 1) const Text('揺れが収まったね。このまま観光しようかな'),
                    ],
                  ),
                ),
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
              alignment: Alignment.centerRight,
              child: Container(
                width: 160,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('状態確認', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('flg1: ${flg.flg1}'),
                    Text('flg2: ${flg.flg2}'),
                    Text('flg3: ${flg.flg3}'),
                    Text('flg3: ${flg.flg4}'),
                    Text('flg3: ${flg.flg5}'),
                    Text('flg3: ${flg.flg6}'),
                    Text('flg3: ${flg.flg7}'),
                    Text('flg3: ${flg.flg8}'),
                    ElevatedButton(
                      onPressed: () => context.push(RoutePaths.sce1_10), 
                      child: Text('Escape')),
                    ElevatedButton(
                      onPressed: () => context.go(RoutePaths.scehome), 
                      child: Text('Home'))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
