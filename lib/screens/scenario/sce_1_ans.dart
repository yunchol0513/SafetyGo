import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui';
import 'package:safety_go/l10n/app_localizations.dart';

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
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      /*appBar: AppBar(
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
      ),*/
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
                        // Text('flg21: ${flg.ans1}'),
                        // Text('flg22: ${flg.ans2}'),
                        // Text('flg23: ${flg.ans3}'),
                        // Text('flg24: ${flg.ans4}'),
                        if (flg.ans1 == 1) ...[
                          Text(t.wrong + '...',
                          style: TextStyle(fontSize: 20),),
                          Text(t.gopark)],
                        if (flg.ans2 == 1)  ...[
                          Text(t.ok + '...',
                          style: TextStyle(fontSize: 20),),
                          Text(t.gojunior)],
                        if (flg.ans3 == 1)  ...[
                          Text(t.wrong + '...',
                          style: TextStyle(fontSize: 20),),
                          Text(t.gohall)],
                        if (flg.ans4 == 1) ...[
                          Text(t.wrong + '...',
                          style: TextStyle(fontSize: 20),),
                          Text(t.gohere)],
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            context.push(RoutePaths.scehome);
                            final flg = Provider.of<FlgModel>(context, listen: false);
                            flg.resetAllFlags();
                          },
                          child: Text(t.back),
                        ),
                      ],
                    ),
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
                      Text(t.finish, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          context.push(RoutePaths.scehome);
                          final flg = Provider.of<FlgModel>(context, listen: false);
                          flg.resetAllFlags();
                        },
                        child: Text(t.finished)),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showStatus = !showStatus;
                          });
                        },
                        child: Text(t.cont))
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
