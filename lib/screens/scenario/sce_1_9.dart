import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce1_9 extends StatefulWidget {
  const Sce1_9({super.key});

  @override
  State<Sce1_9> createState() => _Sce1_9State();
}

class _Sce1_9State extends State<Sce1_9> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);

    return Scaffold(
      /*appBar: AppBar(
        title: const Center(child: Text('Scenario 1-9')),
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
      ),*/
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.push(RoutePaths.sce1s13),
                        child: const Text('Go To 1s13'),
                      ),
                      // const SizedBox(width: 16),
                      // ElevatedButton(
                      //   onPressed: () => flg.toggleFlg(2),
                      //   child: const Text('Toggle flg2'),
                      // ),
                      // const SizedBox(width: 16),
                      // ElevatedButton(
                      //   onPressed: () => flg.toggleFlg(3),
                      //   child: const Text('Toggle flg3'),
                      // ),
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
                    child: const Text('Go to 1-8'),
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
                    Text('flg4: ${flg.flg4}'),
                    Text('flg5: ${flg.flg5}'),
                    Text('flg6: ${flg.flg6}'),
                    Text('flg7: ${flg.flg7}'),
                    Text('flg8: ${flg.flg8}'),
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
