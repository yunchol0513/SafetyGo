import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1_3 extends StatefulWidget {
  const Sce1_3({super.key});

  @override
  State<Sce1_3> createState() => _Sce1_3State();
}

class _Sce1_3State extends State<Sce1_3> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 背景画像
          Positioned.fill(
            child: Image.asset(
              'assets/images/1_9.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // スクロール可能なメイン画面
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0.92),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 左のキャラクター（右に寄せる）
                            Transform.translate(
                              offset: const Offset(30, 0), // ← 右に30px
                              child: GestureDetector(
                                onTap: () {
                                  context.push(RoutePaths.sce1s2);
                                  flg.toggleFlg(2);
                                },
                                child: SizedBox(
                                  height: 130,
                                  child: Image.asset('assets/images/hito2.png'),
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),

                            // 右のキャラクター（少し左に寄せる）
                            Transform.translate(
                              offset: const Offset(-120, 0),
                              child: GestureDetector(
                                onTap: () {
                                  context.push(RoutePaths.sce1s3);
                                  flg.toggleFlg(3);
                                },
                                child: SizedBox(
                                  height: 170,
                                  child: Image.asset('assets/images/hito3.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 上矢印ボタン
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.arrow_drop_up,
                                size: 90,
                                color: Colors.black,
                              ),
                              Positioned.fill(
                                child: GestureDetector(
                                  onTap: () => context.pop(),
                                  child: Container(color: Colors.transparent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 下矢印ボタン
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 90,
                              color: Colors.black,
                            ),
                            Positioned.fill(
                              child: GestureDetector(
                                onTap: () => context.push(RoutePaths.sce1_4),
                                child: Container(color: Colors.transparent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // テキストボックスとボタン
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.mission),
                      const SizedBox(height: 8),
                      Text(t.scestart),
                      const SizedBox(height: 8),
                      Text(t.comment),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => context.push(RoutePaths.sce1_10),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 60),
                          ),
                          child: Text(t.escape),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 状態確認パネル
          if (showStatus)
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
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
                      child: Text(t.finished),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showStatus = !showStatus;
                        });
                      },
                      child: Text(t.cont),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
