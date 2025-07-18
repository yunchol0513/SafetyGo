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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      /*appBar: AppBar(
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
      ),*/
      body: Stack(
        children: [
          // 背景画像
          Positioned.fill(
            child: Image.asset(
              'assets/images/1_7.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // メインUI
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          // 上：人と矢印のエリア
                          Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0.2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildPerson('assets/images/hito9.png', () {
                                        context.push(RoutePaths.sce1s9);
                                        flg.toggleFlg(9);
                                      }),
                                      _buildPerson('assets/images/hito10.png', () {
                                        context.push(RoutePaths.sce1s10);
                                        flg.toggleFlg(10);
                                      }),
                                      _buildPerson('assets/images/hito11.png', () {
                                        context.push(RoutePaths.sce1s11);
                                        flg.toggleFlg(11);
                                      }),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Stack(
                                      children: [
                                        const Icon(Icons.arrow_drop_up, size: 90, color: Colors.black),
                                        Positioned.fill(
                                          child: GestureDetector(
                                            onTap: () => context.push(RoutePaths.sce1_8),
                                            child: Container(color: Colors.transparent),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Stack(
                                    children: [
                                      const Icon(Icons.arrow_drop_down, size: 90, color: Colors.black),
                                      Positioned.fill(
                                        child: GestureDetector(
                                          onTap: () => context.pop(),
                                          child: Container(color: Colors.transparent),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // 下：テキストエリア
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                    style: ElevatedButton.styleFrom(minimumSize: const Size(200, 60)),
                                    child: Text(t.escape),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Flg確認パネル
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
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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

  Widget _buildPerson(String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 130,
        child: Image.asset(imagePath),
      ),
    );
  }
}

