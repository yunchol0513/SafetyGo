import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';

class Sce1_1 extends StatefulWidget {
  const Sce1_1({super.key});

  @override
  State<Sce1_1> createState() => _Sce1_1State();
}

class _Sce1_1State extends State<Sce1_1> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title: const Center(child: Text('Scenario 1-1')),
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
              'assets/images/sce1-1back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
            color: Colors.black.withOpacity(0.3),
            ),
          ),

          Column(
            children: [
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    //キャラクター設置
                    // Row(
                    //   children: [
                    //     SizedBox(width: 300),
                    //     Align(
                    //       alignment: Alignment(0.5, 0.7),
                    //       child: GestureDetector(
                    //           onTap: () => context.push(RoutePaths.sce1s1),
                    //           child: SizedBox(
                    //             height: 130,
                    //             child: Image.asset('assets/images/image1.png'),
                    //           ),
                    //         ),
                    //       ),

                    //       SizedBox(width: 350),
                    

                    //     //右のキャラ
                    //     // Positioned(
                    //     //   left: 250,
                    //     //   bottom: 15,
                    //     //   child: SizedBox(
                    //     //     height: 80,
                    //     //     child: Image.asset('assets/images/people.jpg'),
                    //     //   ),
                    //     // ),

                    //     Align(
                    //       alignment: Alignment(0.8, 0.9),
                    //       child: SizedBox(
                    //         height: 200,
                    //         child: Image.asset('assets/images/image1.png'),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    //ボタン上
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
                              onTap: () => context.push(RoutePaths.sce1_5),
                              child: Container(
                                color: Colors.transparent, // 完全に透明
                              ),
                            ),
                          ),
                          ],
                        )
                        
                      ),
                    ),

                    //ボタン下
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
                              onTap: () => context.push(RoutePaths.sce1_2),
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

              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ミッション'),
                          SizedBox(height: 8),
                          Text('揺れが収まった！南京町にいる人に話しを聞いて、どこに避難するか決めよう'),
                          SizedBox(height: 8),
                          Text('人をタッチして、情報を集めよう！'),
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
                  ],
                )
                
              ),
            ],
          ),

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
                
            //     Stack(
            //       children: [
            //         //右のキャラ
            //     Positioned(
            //       right: 180,
            //       bottom: 10,
            //       child: GestureDetector(
            //         onTap: () => context.push(RoutePaths.sce1s1),
            //         child: SizedBox(
            //           height: 130,
            //           child: Image.asset('assets/images/image1.png'),
            //         ),
            //       ),
            //     ),

            //     //移動(上)
            //     Positioned(
            //       top: 10,
            //       left: 0,
            //       right: 0,
            //       child: Align(
            //         alignment: Alignment.topCenter,
            //         child:  Icon(
            //             Icons.arrow_drop_up,
            //             size: 90,
            //             color: Colors.black,
            //         ),
            //       )
            //     ),

            //     Positioned(
            //         top: 10,
            //         left: 0,
            //         right: 0,
            //         child: GestureDetector(
            //         onTap: () => context.push(RoutePaths.sce1_5),
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           color: Colors.red,
            //             ),
            //           ),
            //         ),


            //     //移動(下)
            //     Positioned(
            //       bottom: 0,
            //       left: 0,
            //       right: 0,
            //       child: Align(
            //         alignment: Alignment.bottomCenter,
            //         child: Icon(
            //           Icons.arrow_drop_down,
            //           size: 90,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),

            //     Positioned(
            //       bottom: 0,
            //       left: 0,
            //       right: 0,
            //       child: GestureDetector(
            //       onTap: () => context.push(RoutePaths.sce1_2),
            //       child: Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.transparent,
            //           ),
            //         ),
            //       )
            //       ],
            //     ),
            //   ),

            //   Expanded(
            //   flex: 3,
            //   child: Container(
            //     width: double.infinity,
            //     color: Colors.white.withOpacity(0.7),
            //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            //     child: const Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text('(見出し)'),
            //         SizedBox(height: 8),
            //         Text('ここにテキストを表示')
            //       ],
            //     ),
            //   ),
            // ),

          // 状態確認パネル（右側表示）
          // if (showStatus)
          //   Align(
          //     alignment: Alignment.centerRight,
          //     child: Container(
          //       width: 160,
          //       margin: const EdgeInsets.all(16),
          //       padding: const EdgeInsets.all(12),
          //       decoration: BoxDecoration(
          //         color: Colors.blue.shade100,
          //         borderRadius: BorderRadius.circular(12),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black26,
          //             blurRadius: 6,
          //             offset: Offset(-2, 2),
          //           )
          //         ],
          //       ),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text('状態確認', style: Theme.of(context).textTheme.titleMedium),
          //           const SizedBox(height: 8),
          //           Text('flg1: ${flg.flg1}'),
          //           Text('flg2: ${flg.flg2}'),
          //           Text('flg3: ${flg.flg3}'),
          //           Text('flg4: ${flg.flg4}'),
          //           Text('flg5: ${flg.flg5}'),
          //           Text('flg6: ${flg.flg6}'),
          //           Text('flg7: ${flg.flg7}'),
          //           Text('flg8: ${flg.flg8}'),
          //           ElevatedButton(
          //             onPressed: () => context.push(RoutePaths.sce1_10), 
          //             child: Text('Escape')),
          //           ElevatedButton(
          //             onPressed: () => context.go(RoutePaths.scehome), 
          //             child: Text('Home'))
          //         ],
          //       ),
          //     ),
          //   ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:safety_go/screens/scenario/sce_1flg.dart';
// import 'package:safety_go/constants/route_paths.dart';

// class Sce1_1 extends StatelessWidget {
//   const Sce1_1({super.key});

//   next(BuildContext context){
//     context.push('/b');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/sce1-1back.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//             color: Colors.black.withOpacity(0.3),
//             ),
//           ),

//           Column(
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: Stack(
//                   children: [
//                     //右のキャラ
//                 Positioned(
//                   right: 180,
//                   bottom: 10,
//                   child: GestureDetector(
//                     onTap: () => context.push(RoutePaths.sce1s1),
//                     child: SizedBox(
//                       height: 130,
//                       child: Image.asset('assets/images/image1.png'),
//                     ),
//                   ),
//                 ),

//                 //左のキャラ
//                 // Positioned(
//                 //   left: 250,
//                 //   bottom: 15,
//                 //   child: SizedBox(
//                 //     height: 80,
//                 //     child: Image.asset('assets/images/people.jpg'),
//                 //   ),
//                 // ),

//                 //移動(上)
//                 Positioned(
//                   top: 10,
//                   left: 0,
//                   right: 0,
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Icon(
//                         Icons.arrow_drop_up,
//                         size: 90,
//                         color: Colors.black,
//                       ),
//                     ),
//                   )
//                 ),

//                 //移動(下)
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Icon(
//                       Icons.arrow_drop_down,
//                       size: 90,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // 下のテキストエリア（2割）
//           Expanded(
//             flex: 3,
//             child: Container(
//               width: double.infinity,
//               color: Colors.white.withOpacity(0.7),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('(見出し)'),
//                   SizedBox(height: 8),
//                   Text('ここにテキストを表示')
//                 ],
//               ),
//             ),
//           ),

          
//         ],
//       ),
//     ],
//   ),
//   );    
//   }
// }