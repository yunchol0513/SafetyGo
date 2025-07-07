import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('道を走るアバター'),
          backgroundColor: const Color(0xFF37474F),
        ),
        body: const RoadRunnerDemo(),
      ),
    );
  }
}

// ===========================================================================
// ゲーム画面
// ===========================================================================
class RoadRunnerDemo extends StatefulWidget {
  const RoadRunnerDemo({super.key});

  @override
  State<RoadRunnerDemo> createState() => _RoadRunnerDemoState();
}

class _RoadRunnerDemoState extends State<RoadRunnerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int _remainingTime = gameTotalTime;
  bool _isTimeUp = false;

  static const double avatarMaxSize = 100.0;
  static const double avatarMinSize = 30.0;
  static const double targetSize = 80.0;
  static const int gameTotalTime = 5;
  final String _correctAnswerId = 'A';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: gameTotalTime),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.addListener(_updateTimerDisplay);
    _controller.addStatusListener(_onAnimationStatusChanged);
    _resetGame();
  }

  void _updateTimerDisplay() {
    if (!mounted) return;
    final newRemainingTime = (gameTotalTime * (1.0 - _controller.value)).ceil();
    if (newRemainingTime != _remainingTime) {
      setState(() {
        _remainingTime = newRemainingTime;
      });
    }
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (mounted) {
        setState(() {
          _isTimeUp = true;
        });
      }
    }
  }

  void _resetGame() {
    setState(() {
      _remainingTime = gameTotalTime;
      _isTimeUp = false;
      _controller.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateTimerDisplay);
    _controller.removeStatusListener(_onAnimationStatusChanged);
    _controller.dispose();
    super.dispose();
  }

  // ★★★ 新しいロジック: 結果画面に遷移するメソッド ★★★
  void _navigateToResultScreen(bool isCorrect) {
    _controller.stop(); // アニメーションを停止

    Navigator.of(context).push(
      // フェードインするような画面遷移
      PageRouteBuilder(
        opaque: false, // 背景を透過させる
        pageBuilder: (context, _, __) => ResultScreen(
          isCorrect: isCorrect,
          onRetry: () {
            // 結果画面から戻ってきたら、ゲームをリセット
            Navigator.of(context).pop();
            _resetGame();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final roadTopY = screenSize.height * 0.4;
    final roadBottomY = screenSize.height;
    final roadTopWidth = screenSize.width * 0.2;
    final roadBottomWidth = screenSize.width * 0.9;

    return Stack(
      children: [
        // --- 背景とゲーム要素 ---
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [
              CustomPaint(
                size: Size.infinite,
                painter: RoadPainter(
                  topY: roadTopY,
                  bottomY: roadBottomY,
                  topWidth: roadTopWidth,
                  bottomWidth: roadBottomWidth,
                ),
              ),
              _buildTarget(
                context: context,
                targetId: 'A',
                top: roadTopY + 20,
                left: (screenSize.width / 2) - (roadTopWidth / 2) - targetSize * 0.5,
              ),
              _buildTarget(
                context: context,
                targetId: 'B',
                top: roadTopY + 20,
                left: (screenSize.width / 2) + (roadTopWidth / 2) - targetSize * 0.5,
              ),
              if (!_isTimeUp)
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final progress = 1.0 - _animation.value;
                    final currentY = roadTopY + (roadBottomY - roadTopY) * progress;
                    final currentScale = (avatarMinSize / avatarMaxSize) + (1 - (avatarMinSize / avatarMaxSize)) * progress;
                    final roadCurrentWidth = roadTopWidth + (roadBottomWidth - roadTopWidth) * progress;
                    final wobble = sin(_animation.value * pi * 8) * (roadCurrentWidth * 0.1);
                    return Positioned(
                      top: currentY - (avatarMaxSize * currentScale),
                      left: (screenSize.width / 2) - (avatarMaxSize * currentScale / 2) + wobble,
                      child: Draggable<String>(
                        data: 'avatar',
                        onDragStarted: () => _controller.stop(),
                        onDragEnd: (details) {
                          if (!details.wasAccepted) _controller.forward();
                        },
                        feedback: AvatarWidget(size: avatarMaxSize * currentScale, isDragging: true),
                        childWhenDragging: Opacity(opacity: 0.4, child: AvatarWidget(size: avatarMaxSize * currentScale)),
                        child: AvatarWidget(size: avatarMaxSize * currentScale),
                      ),
                    );
                  },
                ),
              Align(
                alignment: Alignment.topCenter,
                child: ProblemStatement(remainingTime: _remainingTime, totalTime: gameTotalTime),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 85.0),
                  child: TimerDisplay(remainingTime: _remainingTime),
                ),
              ),
            ],
          ),
        ),
        // --- ゲームオーバー表示 ---
        if (_isTimeUp)
          Container(
            color: Colors.black.withOpacity(0.75),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('GAME OVER', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red, letterSpacing: 4)),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _resetGame,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                    child: const Text('もう一度挑戦する', style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTarget({
    required BuildContext context,
    required String targetId,
    required double top,
    required double left,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: DragTarget<String>(
        onAccept: (data) {
          if (!_isTimeUp) {
            // ★★★ 新しいロジック: 結果を判定して、結果画面に遷移する ★★★
            final isCorrect = (targetId == _correctAnswerId);
            _navigateToResultScreen(isCorrect);
          }
        },
        builder: (context, candidateData, rejectedData) {
          return TargetImageWidget(
            isHovered: candidateData.isNotEmpty,
            imagePath: targetId == 'A' ? 'assets/images/red.png' : 'assets/images/blue.png',
          );
        },
      ),
    );
  }
}

// ===========================================================================
// ★★★ 新しい画面: 結果表示画面 ★★★
// ===========================================================================
class ResultScreen extends StatefulWidget {
  final bool isCorrect;
  final VoidCallback onRetry;

  const ResultScreen({
    super.key,
    required this.isCorrect,
    required this.onRetry,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _showExplanation = false;

  @override
  void initState() {
    super.initState();
    // 画面が表示された1.2秒後に、解説パネルを表示する
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _showExplanation = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景を半透明にする
      backgroundColor: Colors.black.withOpacity(0.75),
      body: Stack(
        children: [
          // 解説が表示される前は、○×を表示
          if (!_showExplanation)
            Center(
              child: ResultSymbol(isCorrect: widget.isCorrect),
            ),
          // 解説表示フラグが立ったら、解説パネルを表示
          if (_showExplanation)
            ExplanationPanel(onRetry: widget.onRetry),
        ],
      ),
    );
  }
}


// 以下、部品となるウィジェット群（変更なし）

class AvatarWidget extends StatelessWidget {
  final double size;
  final bool isDragging;
  const AvatarWidget({super.key, required this.size, this.isDragging = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Icon(
        Icons.directions_run,
        color: isDragging ? Colors.yellow : Colors.black,
        size: size,
        shadows: const [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))],
      ),
    );
  }
}

class TargetImageWidget extends StatelessWidget {
  final bool isHovered;
  final String imagePath;
  const TargetImageWidget({super.key, required this.isHovered, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isHovered ? 1.0 : 0.8,
      child: Container(
        width: _RoadRunnerDemoState.targetSize,
        height: _RoadRunnerDemoState.targetSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHovered
              ? [const BoxShadow(color: Colors.yellow, blurRadius: 20, spreadRadius: 2)]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                child: const Center(child: Text('画像', style: TextStyle(color: Colors.white))),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RoadPainter extends CustomPainter {
  final double topY, bottomY, topWidth, bottomWidth;
  RoadPainter({required this.topY, required this.bottomY, required this.topWidth, required this.bottomWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paintRoad = Paint()..color = Colors.grey[700]!;
    final paintLine = Paint()..color = Colors.white..strokeWidth = 4..strokeCap = StrokeCap.square;
    final roadPath = Path()
      ..moveTo(size.width / 2 - bottomWidth / 2, bottomY)
      ..lineTo(size.width / 2 - topWidth / 2, topY)
      ..lineTo(size.width / 2 + topWidth / 2, topY)
      ..lineTo(size.width / 2 + bottomWidth / 2, bottomY)
      ..close();
    canvas.drawPath(roadPath, paintRoad);
    const dashCount = 10;
    for (int i = 0; i < dashCount; i++) {
      final progress = i / dashCount;
      final nextProgress = (i + 0.5) / dashCount;
      final y1 = topY + (bottomY - topY) * (progress * progress);
      final y2 = topY + (bottomY - topY) * (nextProgress * nextProgress);
      if (y2 > bottomY) break;
      canvas.drawLine(Offset(size.width / 2, y1), Offset(size.width / 2, y2), paintLine);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TimerDisplay extends StatelessWidget {
  final int remainingTime;
  const TimerDisplay({super.key, required this.remainingTime});

  @override
  Widget build(BuildContext context) {
    final bool isUrgent = remainingTime <= 3;
    final Color displayColor = isUrgent ? Colors.red.shade400 : Colors.white;
    return TweenAnimationBuilder<double>(
      tween: Tween(end: isUrgent ? 1.1 : 1.0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.elasticOut,
      builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: displayColor, width: 2),
          boxShadow: [BoxShadow(color: displayColor.withOpacity(0.8), blurRadius: isUrgent ? 15 : 0, spreadRadius: isUrgent ? 2 : 0)],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.timer_outlined, color: displayColor, size: 22),
            const SizedBox(width: 8),
            Text(
              remainingTime.toString().padLeft(2, '0'),
              style: TextStyle(color: displayColor, fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProblemStatement extends StatelessWidget {
  final int remainingTime;
  final int totalTime;
  const ProblemStatement({super.key, required this.remainingTime, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    final progress = (totalTime - remainingTime) / totalTime;
    final double currentFontSize = 20.0 * (1 + (progress * 0.5));
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: Text(
          'どちらが正しいかを選ぼう',
          key: ValueKey<double>(currentFontSize),
          style: TextStyle(
            color: Colors.white,
            fontSize: currentFontSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ResultSymbol extends StatelessWidget {
  final bool isCorrect;
  const ResultSymbol({super.key, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Icon(
        isCorrect ? Icons.circle_outlined : Icons.close,
        color: isCorrect ? Colors.red : Colors.blue,
        size: 200,
        shadows: const [Shadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
      ),
    );
  }
}

class ExplanationPanel extends StatelessWidget {
  final VoidCallback onRetry;
  const ExplanationPanel({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1.0 - value)),
            child: child,
          ),
        );
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 15, offset: Offset(0, 5))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('【解説】', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text(
                'ここに、なぜその答えが正しいのか（あるいは違うのか）の解説文が入ります。この文章は正解・不正解どちらの場合でも同じ内容が表示されます。',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF37474F),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('もう一度挑戦する', style: TextStyle(fontSize: 18, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
