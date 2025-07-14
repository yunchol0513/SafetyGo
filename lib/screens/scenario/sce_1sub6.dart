import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1s6 extends StatefulWidget {
  const Sce1s6({super.key});

  @override
  State<Sce1s6> createState() => _Sce1s6State();
}

class _Sce1s6State extends State<Sce1s6> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    //final flg = Provider.of<FlgModel>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Scenario sub 1-6')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
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
              'assets/images/sce1-5back.jpg',
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
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0.9, 1.0),
                      child: SizedBox(
                          height: 400,
                          child: Image.asset('assets/images/people6.png'),
                      ),
                    ),
                  ],
                ),
              ),

          // 下のテキストエリア（2割）
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    // Positioned.fill(
                    Container(
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.pe6),
                          SizedBox(height: 8),
                          Text(t.scepeople6),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment(0, 0.7),
                      child: ElevatedButton(
                        onPressed: () => context.push(RoutePaths.sce1_10),
                         style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 60), // 幅200、高さ60に設定
                        ),
                        child: const Text("逃げる")
                      ),
                    ),
        
                    Align(
                      alignment: Alignment(0.9, 0.8),
                      child: ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text("戻る")
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //flgを上げる
          // Column(
          //   children: [
          //     Expanded(
          //       child: Center(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             ElevatedButton(
          //               onPressed: () => flg.toggleFlg(1),
          //               child: const Text('Toggle flg1'),
          //             ),
          //             const SizedBox(width: 16),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

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
