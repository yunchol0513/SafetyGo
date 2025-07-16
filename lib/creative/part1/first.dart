// first.dart

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ★ 削除: 不要なimport
// import 'package:safety_go/creative/score_display.dart';
// import 'package:safety_go/correct_counter.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _First();
}

class _First extends State<First> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  // ★ 削除: タイマー関連の変数を削除
  // Timer? _gameTimer;
  // int _remainingTime = gameTotalTime;
  // bool _isTimeUp = false;

  bool _isNavigating = false;

  static const double avatarMaxSize = 200.0;
  static const double avatarMinSize = 80.0;
  static const double targetSize = 100.0;
  static const int animationDurationSeconds = 8;
  static const int totalQuestions = 5;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: animationDurationSeconds),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    
    // ★ 修正: _resetGame()の呼び出しを削除し、アニメーションを直接開始
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    // ★ 削除: タイマー関連の処理を削除
    // _gameTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // ★ 削除: タイマーをリセットする _resetGame メソッド全体を削除
  /*
  void _resetGame() { ... }
  */

  void _navigateToResultScreen(bool isCorrect) {
    if (_isNavigating) return;
    // ★ 削除: タイマー関連の処理を削除
    // _gameTimer?.cancel();
    _controller.stop();
    setState(() {
      _isNavigating = true;
    });
    // ★ 削除: スコアを増加させる処理を削除
    // if (isCorrect) {
    //   CorrectCounter_creative_1.increment();
    // }
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) {
        // isCorrectは常にtrueなので、そのまま渡します
        context.go('/creative_1', extra: isCorrect);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final roadTopY = screenSize.height * 0.4;
    final roadBottomY = screenSize.height;
    final roadTopWidth = screenSize.width * 0.2;
    final roadBottomWidth = screenSize.width * 0.9;

    return Scaffold(
      body: _isNavigating
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
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
                        top: roadTopY - (targetSize * 0.7),
                        left: (screenSize.width / 2) -
                            (roadTopWidth / 2) -
                            targetSize,
                      ),
                      _buildTarget(
                        context: context,
                        targetId: 'B',
                        top: roadTopY - (targetSize * 0.7),
                        left: (screenSize.width / 2) + (roadTopWidth / 2),
                      ),
                      AnimatedBuilder( // ★ 修正: if (!_isTimeUp) の条件を削除
                        animation: _animation,
                        builder: (context, child) {
                          final progress = 1.0 - _animation.value;
                          final currentY =
                              roadTopY + (roadBottomY - roadTopY) * progress;
                          final currentScale =
                              (avatarMinSize / avatarMaxSize) +
                                  (1 - (avatarMinSize / avatarMaxSize)) *
                                      progress;
                          final roadCurrentWidth = roadTopWidth +
                              (roadBottomWidth - roadTopWidth) * progress;
                          final wobble = sin(_animation.value * pi * 8) *
                              (roadCurrentWidth * 0.1);
                          return Positioned(
                            top: currentY - (avatarMaxSize * currentScale),
                            left: (screenSize.width / 2) -
                                (avatarMaxSize * currentScale / 2) +
                                wobble,
                            child: Draggable<String>(
                              data: 'avatar',
                              onDragStarted: () {
                                _controller.stop();
                              },
                              onDragEnd: (details) {
                                if (!details.wasAccepted) {
                                  _controller.forward();
                                }
                              },
                              feedback: AvatarWidget(
                                size: avatarMaxSize * currentScale,
                                isDragging: true,
                                animationValue: _animation.value,
                              ),
                              childWhenDragging: Opacity(
                                opacity: (0.4).clamp(0.0, 1.0),
                                child: AvatarWidget(
                                  size: avatarMaxSize * currentScale,
                                  animationValue: _animation.value,
                                ),
                              ),
                              child: AvatarWidget(
                                size: avatarMaxSize * currentScale,
                                animationValue: _animation.value,
                              ),
                            ),
                          );
                        },
                      ),
                      // ★ 修正: ProblemStatement以外のUIを削除
                      Align(
                        alignment: Alignment.topCenter,
                        child: ProblemStatement(),
                      ),
                      // ★ 削除: タイマーとスコア表示のContainer全体を削除
                    ],
                  ),
                ),
                // ★ 削除: 時間切れ(GAME OVER)のUIを削除
              ],
            ),
    );
  }

  Widget _buildTarget({
    required BuildContext context,
    required String targetId,
    required double top,
    required double left,
  }) {
    final t = AppLocalizations.of(context)!;
    return Positioned(
      top: top,
      left: left,
      child: DragTarget<String>(
        onAccept: (data) {
          // ★ 修正: _isTimeUpのチェックを削除
          _navigateToResultScreen(true);
        },
        builder: (context, candidateData, rejectedData) {
          return TargetTextWidget(
            isHovered: candidateData.isNotEmpty,
            text: t.inhuman,
          );
        },
      ),
    );
  }
}

class TargetTextWidget extends StatelessWidget {
  final bool isHovered;
  final String text;
  const TargetTextWidget(
      {super.key, required this.isHovered, required this.text});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isHovered ? 1.0 : 0.8,
      child: Container(
        width: _First.targetSize,
        height: _First.targetSize,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHovered
              ? [
                  const BoxShadow(
                      color: Colors.yellow, blurRadius: 20, spreadRadius: 2)
                ]
              : [
                  const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      offset: Offset(2, 2))
                ],
          border: Border.all(
              color: isHovered ? Colors.yellow : Colors.white60, width: 2),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
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

// ★ 削除: TimerDisplay ウィジェット全体を削除

// ★ 修正: ProblemStatementから不要な引数を削除
class ProblemStatement extends StatelessWidget {
  const ProblemStatement({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    const double currentFontSize = 20.0;
    return Container(
      margin: const EdgeInsets.only(top: 40.0), // 位置を少し調整
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text( // ★ 修正: AnimatedSwitcherとl10nを削除し、テキストを直接記述
        t.swipeh,
        style: TextStyle(
          color: Colors.white,
          fontSize: currentFontSize,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}