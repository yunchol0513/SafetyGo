import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1_7 extends StatefulWidget {
  const Sce1_7({super.key});

  @override
  State<Sce1_7> createState() => _Sce1_7State();
}

class _Sce1_7State extends State<Sce1_7> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Scenario 1-7')),
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
          //背景画像
          Positioned.fill(
            child: Image.asset(
              'assets/images/sce1-7.back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
            color: Colors.black.withOpacity(0.3),
            ),
          ),
          
          //キャラクターと遷移ボタンの設置
          Column(
            children: [
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //左のキャラクター
                          GestureDetector(
                            onTap: () {
                              context.push(RoutePaths.sce1s9);
                              flg.toggleFlg(9);
                            },
                            child: SizedBox(
                              height: 130,
                              child: Image.asset('assets/images/people9.png'),
                            ),
                          ),

                          //右のキャラクター
                          GestureDetector(
                            onTap: () {
                              context.push(RoutePaths.sce1s10);
                              flg.toggleFlg(10);
                            },
                            child: SizedBox(
                              height: 130,
                              child: Image.asset('assets/images/people10.png'),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              context.push(RoutePaths.sce1s11);
                              flg.toggleFlg(11);
                            },
                            child: SizedBox(
                              height: 130,
                              child: Image.asset('assets/images/people11.png'),
                            ),
                          ),

                          //キャラクターを１つしか使用しない場合
                          //  Opacity(
                          //   opacity: 0.0, // 完全に透明
                          //   child: SizedBox(
                          //     height: 130,
                          //     child: Image.asset('assets/images/image_right_placeholder.png'),
                          //   ),
                          //  ),
                        ],
                      ),
                    ),
                    
                    //画面遷移ボタン
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              size: 90,
                              color: Colors.black,
                            ),
                            Positioned.fill(
                            child: GestureDetector(
                              onTap: () => context.push(RoutePaths.sce1_8),
                              child: Container(
                                color: Colors.transparent, // 完全に透明
                              ),
                            ),
                          ),
                          ],
                        )
                        
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        // alignment: Aligment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            size: 90,
                            color: Colors.black,
                          ),
                           Positioned.fill(
                            child: GestureDetector(
                              onTap: () => context.pop(),
                              child: Container(
                                color: Colors.transparent, // 完全に透明
                              ),
                            ),
                          ),
                        ],
                      )
                      // Icon(
                      //   Icons.arrow_drop_down,
                      //   size: 90,
                      //   color: Colors.black,
                      // ),
                    ),
                  ],
                )
              ),
              
              //テキストボックス
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.mission),
                          SizedBox(height: 8),
                          Text(t.scestart),
                          SizedBox(height: 8),
                          Text(t.comment),
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
                        child: Text(t.escape)
                      ),
                    ),
                  ],
                )
                
              ),
            ],
          ),
          
          //Flg確認
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


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:go_router/go_router.dart';
// import 'package:safety_go/screens/scenario/sce_1flg.dart';
// import 'package:safety_go/constants/route_paths.dart';

// class Sce1_7 extends StatefulWidget {
//   const Sce1_7({super.key});

//   @override
//   State<Sce1_7> createState() => _Sce1_7State();
// }

// class _Sce1_7State extends State<Sce1_7> {
//   bool showStatus = false;

//   @override
//   Widget build(BuildContext context) {
//     final flg = Provider.of<FlgModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Scenario 1-7')),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.info),
//             onPressed: () {
//               setState(() {
//                 showStatus = !showStatus;
//               });
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               // 最上部中央にSecondScreenへ
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     onPressed: () => context.push(RoutePaths.sce1_8),
//                     child: const Text('Go to 1-8'),
//                   ),
//                 ),
//               ),

//               // 中央に変数トグルボタンを横並び
//               Expanded(
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () => context.push(RoutePaths.sce1s9),
//                         child: const Text('Go To 1s9'),
//                       ),
//                       const SizedBox(width: 16),
//                       ElevatedButton(
//                         onPressed: () => context.push(RoutePaths.sce1s10),
//                         child: const Text('Go To 1s10'),
//                       ),
//                       const SizedBox(width: 16),
//                       ElevatedButton(
//                         onPressed: () => context.push(RoutePaths.sce1s11),
//                         child: const Text('Go To 1s11'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // 最下部中央にThirdScreenへ
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: ElevatedButton(
//                     onPressed: () => context.pop(),
//                     child: const Text('Go to 1-6'),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // 状態確認パネル（右側表示）
//           if (showStatus)
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 width: 160,
//                 margin: const EdgeInsets.all(16),
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade100,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 6,
//                       offset: Offset(-2, 2),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('状態確認', style: Theme.of(context).textTheme.titleMedium),
//                     const SizedBox(height: 8),
//                     Text('flg1: ${flg.flg1}'),
//                     Text('flg2: ${flg.flg2}'),
//                     Text('flg3: ${flg.flg3}'),
//                     Text('flg4: ${flg.flg4}'),
//                     Text('flg5: ${flg.flg5}'),
//                     Text('flg6: ${flg.flg6}'),
//                     Text('flg7: ${flg.flg7}'),
//                     Text('flg8: ${flg.flg8}'),
//                     ElevatedButton(
//                       onPressed: () => context.push(RoutePaths.sce1_10), 
//                       child: Text('Escape')),
//                     ElevatedButton(
//                       onPressed: () => context.go(RoutePaths.scehome), 
//                       child: Text('Home'))
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
