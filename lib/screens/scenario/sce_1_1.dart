import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce1_1 extends StatefulWidget {
  const Sce1_1({super.key});

  @override
  State<Sce1_1> createState() => _Sce1_1State();
}

class _Sce1_1State extends State<Sce1_1> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stack(
                    children: [
                      // 上矢印
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
                                  onTap: () => context.push(RoutePaths.sce1_5),
                                  child: Container(color: Colors.transparent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 下矢印
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
                                onTap: () => context.push(RoutePaths.sce1_2),
                                child: Container(color: Colors.transparent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 下部テキスト＋ボタンエリア
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.mission, style: const TextStyle(fontWeight: FontWeight.bold)),
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

          // ゲーム終了パネル
          if (showStatus)
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
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
                  children: [
                    Text(t.finish,
                        style: Theme.of(context).textTheme.titleMedium),
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
                          showStatus = false;
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
