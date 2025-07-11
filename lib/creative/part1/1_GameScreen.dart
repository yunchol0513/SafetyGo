// GameScreen.dart

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/creative/score_display.dart';
import 'package:safety_go/correct_counter.dart';


class GameScreen1 extends StatefulWidget {
  const GameScreen1({super.key});

  @override
  State<GameScreen1> createState() => _GameScreenState1();
}

class _GameScreenState1 extends State<GameScreen1>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _gameTimer;
  Timer? _countdownTimer;
  int _countdownTime = 3;
  bool _isCountingDown = true;
  bool _showInstructions = true;

  int _remainingTime = gameTotalTime;
  bool _isTimeUp = false;
  bool _isNavigating = false;

  static const int gameTotalTime = 8;
  static const int animationDurationSeconds = 8;
  final String _correctAnswerId = 'A';
  static const int totalQuestions = 5;

  @override
  void initState() {
    super.initState();
    CorrectCounter_creative_1.reset();
    _controller = AnimationController(
      duration: const Duration(seconds: animationDurationSeconds),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _startCountdown();
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    _countdownTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startGame() {
    _gameTimer?.cancel();
    setState(() {
      _remainingTime = gameTotalTime;
      _isTimeUp = false;
      _isNavigating = false;
      _controller.forward(from: 0.0);
    });

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _showInstructions = false;
        });
      }
    });

    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _navigateToResultScreen(false);
      }
    });
  }

  void _startCountdown() {
    _gameTimer?.cancel();
    _controller.reset();
    setState(() {
      _isCountingDown = true;
      _showInstructions = true;
      _isTimeUp = false;
      _countdownTime = 3;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_countdownTime > 1) {
        setState(() {
          _countdownTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isCountingDown = false;
        });
        _startGame();
      }
    });
  }

  void _navigateToResultScreen(bool isCorrect) {
    if (_isNavigating) return;
    _gameTimer?.cancel();
    _controller.stop();
    setState(() {
      _isNavigating = true;
    });
    if (isCorrect) {
      CorrectCounter_creative_1.increment();
    }
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) {
        context.go('/creative_1_1', extra: isCorrect);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('人を正しい画像にドラッグしよう'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // --- レイアウト調整用のパラメータ ---
          final double roadDepthRatio = 0.2;     // 奥行き (0.1で深く、0.4で浅く)
          final double roadWidthRatio = 0.6;     // 道の幅
          final double targetYOffsetRatio = 0.1; // 画像の手前具合
          final double targetSizeRatio = 0.25;   // 画像の大きさ
          final double targetSpacingRatio = 0.02; // 画像と道端の余白

          // --- 上のパラメータに基づいた計算 ---
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          final double roadTopY = screenHeight * roadDepthRatio;
          final double roadTopWidth = screenWidth * roadWidthRatio;
          final double roadBottomWidth = screenWidth * 0.9;
          final double roadBottomY = screenHeight;
          final double targetSize = screenWidth * targetSizeRatio;
          final double avatarMaxSize = screenWidth * 0.4;
          final double avatarMinSize = screenWidth * 0.15;
          
          // ★★★ ここが最重要の修正点 ★★★
          final double targetTopY = roadTopY + (screenHeight * targetYOffsetRatio);
          final double spacing = screenWidth * targetSpacingRatio;

          // 左ターゲットの左端 = 道路の左端 + 余白
          final double leftTargetLeft = (screenWidth / 2) - (roadTopWidth / 2) + spacing;
          // 右ターゲットの左端 = 道路の右端 - 画像サイズ - 余白
          final double rightTargetLeft = (screenWidth / 2) + (roadTopWidth / 2) - targetSize - spacing;
          
          // チュートリアル用の中心座標
          final leftTargetPosition = Offset(leftTargetLeft + targetSize / 2, targetTopY + targetSize / 2);
          final rightTargetPosition = Offset(rightTargetLeft + targetSize / 2, targetTopY + targetSize / 2);

          return _isNavigating
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    _buildGameContent(
                      constraints: constraints,
                      roadTopY: roadTopY,
                      roadBottomY: roadBottomY,
                      roadTopWidth: roadTopWidth,
                      roadBottomWidth: roadBottomWidth,
                      leftTargetLeft: leftTargetLeft,
                      rightTargetLeft: rightTargetLeft,
                      targetTopY: targetTopY,
                      targetSize: targetSize,
                      avatarMaxSize: avatarMaxSize,
                      avatarMinSize: avatarMinSize,
                    ),
                    _buildTopInfoBar(),
                    if (_showInstructions && !_isCountingDown && !_isTimeUp)
                      _buildInstructionalOverlay(
                        screenWidth: screenWidth,
                        roadBottomY: roadBottomY,
                        avatarMaxSize: avatarMaxSize,
                        leftTargetPosition: leftTargetPosition,
                        rightTargetPosition: rightTargetPosition,
                      ),
                    if (_isCountingDown) _buildCountdownOverlay(),
                    if (_isTimeUp) _buildGameOverOverlay(),
                    if (_isNavigating) const Center(child: CircularProgressIndicator()),
                  ],
                );
        },
      ),
    );
  }

  // --- UIを構築するための専用メソッド群 ---
  
  Widget _buildGameContent({
    required BoxConstraints constraints,
    required double roadTopY,
    required double roadBottomY,
    required double roadTopWidth,
    required double roadBottomWidth,
    required double leftTargetLeft,
    required double rightTargetLeft,
    required double targetTopY,
    required double targetSize,
    required double avatarMaxSize,
    required double avatarMinSize,
  }) {
    final screenWidth = constraints.maxWidth;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: CustomPaint(
            size: Size.infinite,
            painter: RoadPainter(
              topY: roadTopY,
              bottomY: roadBottomY,
              topWidth: roadTopWidth,
              bottomWidth: roadBottomWidth,
            ),
          ),
        ),
        _buildTarget(
          context: context,
          targetId: 'A',
          top: targetTopY,
          left: leftTargetLeft,
          targetSize: targetSize,
        ),
        _buildTarget(
          context: context,
          targetId: 'B',
          top: targetTopY,
          left: rightTargetLeft,
          targetSize: targetSize,
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
                left: (screenWidth / 2) - (avatarMaxSize * currentScale / 2) + wobble,
                child: Draggable<String>(
                  data: 'avatar',
                  onDragStarted: () => _controller.stop(),
                  onDragEnd: (details) {
                    if (!details.wasAccepted) _controller.forward();
                  },
                  feedback: AvatarWidget(size: avatarMaxSize * currentScale, isDragging: true, animationValue: _animation.value),
                  childWhenDragging: Opacity(opacity: 0.4, child: AvatarWidget(size: avatarMaxSize * currentScale, animationValue: _animation.value)),
                  child: AvatarWidget(size: avatarMaxSize * currentScale, animationValue: _animation.value),
                ),
              );
            },
          ),
      ],
    );
  }
  
  Widget _buildTopInfoBar() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ScoreDisplay(
              questionNumber: 1,
              score: CorrectCounter_creative_1.correctCount,
              totalQuestions: totalQuestions,
            ),
            const SizedBox(height: 8),
            ProblemStatement(
                remainingTime: _remainingTime, totalTime: gameTotalTime),
            const SizedBox(height: 8),
            TimerDisplay(remainingTime: _remainingTime),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionalOverlay({
    required double screenWidth,
    required double roadBottomY,
    required double avatarMaxSize,
    required Offset leftTargetPosition,
    required Offset rightTargetPosition,
  }) {
    return IgnorePointer(
      child: InstructionalOverlay(
        avatarStartPosition: Offset(screenWidth / 2, roadBottomY - avatarMaxSize / 2),
        leftTargetPosition: leftTargetPosition,
        rightTargetPosition: rightTargetPosition,
      ),
    );
  }

  Widget _buildCountdownOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
          child: Text(
            '$_countdownTime',
            key: ValueKey<int>(_countdownTime),
            style: const TextStyle(fontSize: 150, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildGameOverOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.75),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('GAME OVER', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red, letterSpacing: 4)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _startCountdown,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              child: const Text('もう一度挑戦する', style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  // ★★★ 変更点: 引数をOffsetではなく、topとleftにシンプル化 ★★★
  Widget _buildTarget({
    required BuildContext context,
    required String targetId,
    required double top,
    required double left,
    required double targetSize,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: DragTarget<String>(
        onAccept: (data) {
          if (!_isTimeUp) {
            final isCorrect = (targetId == _correctAnswerId);
            _navigateToResultScreen(isCorrect);
          }
        },
        builder: (context, candidateData, rejectedData) {
          return TargetImageWidget(
            isHovered: candidateData.isNotEmpty,
            imagePath: targetId == 'A'
                ? 'assets/images/creative/白非常出口.png'
                : 'assets/images/creative/緑非常出口.png',
            targetSize: targetSize,
          );
        },
      ),
    );
  }
}

// ... (InstructionalOverlay, ArrowPainter, AvatarWidget, 他のクラスは変更なし) ...
class InstructionalOverlay extends StatefulWidget {
  final Offset avatarStartPosition;
  final Offset leftTargetPosition;
  final Offset rightTargetPosition;

  const InstructionalOverlay({
    super.key,
    required this.avatarStartPosition,
    required this.leftTargetPosition,
    required this.rightTargetPosition,
  });

  @override
  State<InstructionalOverlay> createState() => _InstructionalOverlayState();
}

class _InstructionalOverlayState extends State<InstructionalOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: ArrowPainter(
        animation: _animationController,
        startPoint: widget.avatarStartPosition,
        leftEndPoint: widget.leftTargetPosition,
        rightEndPoint: widget.rightTargetPosition,
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Animation<double> animation;
  final Offset startPoint;
  final Offset leftEndPoint;
  final Offset rightEndPoint;

  ArrowPainter({
    required this.animation,
    required this.startPoint,
    required this.leftEndPoint,
    required this.rightEndPoint,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    _drawDashedArrow(canvas, startPoint, leftEndPoint, Colors.red[400]!);
    _drawDashedArrow(canvas, startPoint, rightEndPoint, Colors.blue[400]!);
  }

  void _drawDashedArrow(Canvas canvas, Offset start, Offset end, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final distance = (end - start).distance;
    const dashSize = 15.0;
    const gapSize = 10.0;
    final totalSegmentLength = dashSize + gapSize;
    
    final animProgress = animation.value;
    final visibleDistance = distance * animProgress;
    
    final path = Path();
    path.moveTo(start.dx, start.dy);
    
    double currentDistance = 0;
    while (currentDistance < visibleDistance) {
      final endDash = min(currentDistance + dashSize, visibleDistance);
      final p1 = Offset.lerp(start, end, currentDistance / distance)!;
      final p2 = Offset.lerp(start, end, endDash / distance)!;
      path.moveTo(p1.dx, p1.dy);
      path.lineTo(p2.dx, p2.dy);
      currentDistance += totalSegmentLength;
    }
    
    canvas.drawPath(path, paint);

    if (visibleDistance > 0) {
      final tipPoint = Offset.lerp(start, end, visibleDistance / distance)!;
      final angle = (end - start).direction;
      const arrowSize = 20.0;
      const arrowAngle = 0.5; // rad

      final arrowPath = Path()
        ..moveTo(tipPoint.dx - arrowSize * cos(angle - arrowAngle), tipPoint.dy - arrowSize * sin(angle - arrowAngle))
        ..lineTo(tipPoint.dx, tipPoint.dy)
        ..lineTo(tipPoint.dx - arrowSize * cos(angle + arrowAngle), tipPoint.dy - arrowSize * sin(angle + arrowAngle));
        
      canvas.drawPath(arrowPath, paint..style=PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AvatarWidget extends StatelessWidget {
  final double size;
  final bool isDragging;
  final double animationValue;

  const AvatarWidget({
    super.key,
    required this.size,
    this.isDragging = false,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    final scaleX = (animationValue * 15).floor() % 2 == 0 ? 1.0 : -1.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(scaleX, 1.0),
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          Icons.directions_run,
          color: isDragging ? Colors.yellow : Colors.black,
          size: size,
          shadows: const [
            Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))
          ],
        ),
      ),
    );
  }
}

class TargetImageWidget extends StatelessWidget {
  final bool isHovered;
  final String imagePath;
  final double targetSize;

  const TargetImageWidget({
    super.key,
    required this.isHovered,
    required this.imagePath,
    required this.targetSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: targetSize,
      height: targetSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isHovered
            ? [
                const BoxShadow(
                    color: Colors.yellow, blurRadius: 20, spreadRadius: 2)
              ]
            : [
              const BoxShadow(
                    color: Colors.black38, blurRadius: 5, offset: Offset(2, 2))
            ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            opacity: isHovered ? 1.0 : 0.85,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                    child: Text('画像', style: TextStyle(color: Colors.black)));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RoadPainter extends CustomPainter {
  final double topY, bottomY, topWidth, bottomWidth;
  RoadPainter(
      {required this.topY,
      required this.bottomY,
      required this.topWidth,
      required this.bottomWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paintRoad = Paint()..color = Colors.grey[700]!;
    final paintLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.square;
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
      canvas.drawLine(
          Offset(size.width / 2, y1), Offset(size.width / 2, y2), paintLine);
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
      builder: (context, scale, child) =>
          Transform.scale(scale: scale, child: child),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: displayColor, width: 2),
          boxShadow: [
            BoxShadow(
                color: displayColor.withOpacity(0.8),
                blurRadius: isUrgent ? 15 : 0,
                spreadRadius: isUrgent ? 2 : 0)
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.timer_outlined, color: displayColor, size: 22),
            const SizedBox(width: 8),
            Text(
              remainingTime.toString().padLeft(2, '0'),
              style: TextStyle(
                  color: displayColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace'),
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
  const ProblemStatement(
      {super.key, required this.remainingTime, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '避難経路を表しているのはどっち？',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}