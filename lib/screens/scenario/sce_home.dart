import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'sce_2_5.dart';
import 'sce_1_1.dart';
import 'sce_3_1.dart';

class SceHome extends StatefulWidget {
  final int initialUnlockedStage;
  const SceHome({super.key, this.initialUnlockedStage = 3});

  @override
  State<SceHome> createState() => _SceHomeState();
}

class _SceHomeState extends State<SceHome> with SingleTickerProviderStateMixin {
  int currentStage = 1;
  late int unlockedStages;
  double characterX = 0;

  AnimationController? _controller;

  final List<GlobalKey> stageKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void initState() {
    super.initState();
    unlockedStages = widget.initialUnlockedStage;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveToStage(currentStage, animate: false);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _moveToStage(int stage, {bool animate = true}) {
    if (stage > unlockedStages) return;

    final keyContext = stageKeys[stage - 1].currentContext;
    final stackBox = context.findRenderObject() as RenderBox?;
    if (keyContext == null || stackBox == null) return;

    final box = keyContext.findRenderObject() as RenderBox;
    final stagePos = box.localToGlobal(Offset.zero);
    final stackPos = stackBox.localToGlobal(Offset.zero);

    final centerX = stagePos.dx - stackPos.dx + box.size.width / 2;

    setState(() {
      characterX = centerX - 25; // キャラクターサイズ 50 の半分
      currentStage = stage;
    });
  }

  void _enterStage() {
    if (currentStage == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Sce_3_1()),
      );
    } else if (currentStage == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Sce_2_5()),
      );
    } else if (currentStage == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Sce1_1()),
      );
    }
  }

  Widget _buildStage(int number) {
    final isUnlocked = number <= unlockedStages;
    return GestureDetector(
      key: stageKeys[number - 1],
      onTap: () => _moveToStage(number),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: isUnlocked ? Colors.deepOrange.shade400 : Colors.grey.shade500,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Icon(
              isUnlocked ? Icons.storefront : Icons.lock,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '店 $number',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEnterEnabled = currentStage <= unlockedStages;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RoutePaths.rogin),
          tooltip: 'ログイン画面に戻る',
        ),
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade400,
        elevation: 4,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.shade200.withOpacity(0.9),
                      Colors.deepOrange.shade100.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              if (_controller != null)
                AnimatedBuilder(
                  animation: _controller!,
                  builder: (context, child) {
                    final dy = 5 * (1 - (_controller!.value * 2 - 1).abs());
                    return Positioned(
                      top: 150 - dy,
                      left: characterX,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Icon(Icons.person, color: Colors.white, size: 30),
                        ),
                      ),
                    );
                  },
                )
              else
                const SizedBox.shrink(),
              Positioned(
                bottom: 210,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStage(1),
                    _buildStage(2),
                    _buildStage(3),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    onPressed: isEnterEnabled ? _enterStage : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isEnterEnabled ? Colors.deepOrange : Colors.grey.shade500,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      shadowColor: Colors.deepOrange.shade300,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      'ステージ $currentStage に入る',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
