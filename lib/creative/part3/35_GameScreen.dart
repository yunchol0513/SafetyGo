// GameScreen.dart

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/quiz.dart';
import 'package:safety_go/creative/score_display.dart'; //ここにかいてる
import 'package:safety_go/correct_counter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class GameScreen35 extends StatefulWidget {
  const GameScreen35({super.key});

  @override
  State<GameScreen35> createState() => _GameScreenState35();
}

class _GameScreenState35 extends State<GameScreen35>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _gameTimer;

  int _remainingTime = gameTotalTime;
  bool _isTimeUp = false;
  bool _isNavigating = false;

  static const double avatarMaxSize = 200.0;
  static const double avatarMinSize = 80.0;
  static const double targetSize = 100.0;
  static const int gameTotalTime = 8;
  static const int animationDurationSeconds = 8;
  final String _correctAnswerId = 'A';
  static const int totalQuestions = 5;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: animationDurationSeconds),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _resetGame();
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _resetGame() {
    _gameTimer?.cancel();
    setState(() {
      _remainingTime = gameTotalTime;
      _isTimeUp = false;
      _isNavigating = false;
      _controller.forward(from: 0.0);
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

  void _navigateToResultScreen(bool isCorrect) {
    if (_isNavigating) return;
    _gameTimer?.cancel();
    _controller.stop();
    setState(() {
      _isNavigating = true;
    });
    if (isCorrect) {
      CorrectCounter_creative_3.increment();
    }
    _onQuizFinished();
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) {
        context.go('/creative_35_1', extra: isCorrect);
      }
    });
  }

  Future<void> _onQuizFinished() async {
    if (CorrectCounter_creative_3.correctCount == 5) {
      await _savePart1Flag();
    }
  }

  Future<void> _savePart1Flag() async {
  print('★★★★★ パート3の保存処理が呼び出されました ★★★★★');
  try {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = FirebaseFirestore.instance.collection('game_progress').doc(uid);

    await FirebaseFirestore.instance.runTransaction((tx) async {
      final snapshot = await tx.get(docRef);
      final current = (snapshot.data()?['part_3'] ?? 0) as int;
      if (current >= 3) {
        print('既にパート3はクリア済みのため、保存処理をスキップします。');
        return;
      }
      // ▼▼▼ ここが「1」になっていることが最も重要です ▼▼▼
      tx.set(docRef, {'part_3': 3}, SetOptions(merge: true));
    });

    print('パート3の達成フラグの保存に成功しました！');
  } catch (e) {
    print('エラー発生：パート3のフラグ保存に失敗しました。詳細: $e');
  }

}
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
                      if (!_isTimeUp)
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            final progress = 1.0 - _animation.value;
                            final currentY =
                                roadTopY + (roadBottomY - roadTopY) * progress;
                            final currentScale = (avatarMinSize /
                                    avatarMaxSize) +
                                (1 - (avatarMinSize / avatarMaxSize)) *
                                    progress;
                            final roadCurrentWidth = roadTopWidth +
                                (roadBottomWidth - roadTopWidth) * progress;
                            final wobble =
                                sin(_animation.value * pi * 8) *
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
                      Align(
                        alignment: Alignment.topCenter,
                        child: ProblemStatement(
                            remainingTime: _remainingTime,
                            totalTime: gameTotalTime),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 130.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // ★ 修正: totalTimeを渡して拡大アニメーションを有効化
                              TimerDisplay(
                                remainingTime: _remainingTime,
                                totalTime: gameTotalTime,
                              ),
                              ScoreDisplay(
                                questionNumber: 5,
                                score: CorrectCounter_creative_3.correctCount,
                                totalQuestions: totalQuestions,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isTimeUp)
                  Container(
                    color: Colors.black.withOpacity(0.75),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('GAME OVER',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  letterSpacing: 4)),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: _resetGame,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            child: Text(t.tryag,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
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
          return TargetTextWidget(
            isHovered: candidateData.isNotEmpty,
            text: targetId == 'B' ? '5m' : '10m',
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
        width: _GameScreenState35.targetSize,
        height: _GameScreenState35.targetSize,
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

// ★ 修正: TimerDisplayが徐々に大きくなるように変更
class TimerDisplay extends StatelessWidget {
  final int remainingTime;
  final int totalTime; // ★ 追加: 全体の時間を計算用に受け取る
  const TimerDisplay(
      {super.key, required this.remainingTime, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    final bool isUrgent = remainingTime <= 3;
    final Color displayColor = isUrgent ? Colors.red.shade400 : Colors.white;
    // ★ 追加: 時間の経過率(0.0 ~ 1.0)からスケール値を計算
    final double progress = (totalTime - remainingTime) / totalTime;
    final double scale = 1.0 + progress * 0.25; // 1.0倍から1.25倍まで拡大

    return TweenAnimationBuilder<double>(
      // ★ 修正: 計算したスケール値にアニメーション
      tween: Tween(end: scale),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut, // 弾む効果から滑らかな効果へ変更
      builder: (context, animatedScale, child) =>
          Transform.scale(scale: animatedScale, child: child),
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

// ★ 修正: ProblemStatementのフォントサイズを固定
class ProblemStatement extends StatelessWidget {
  final int remainingTime;
  final int totalTime;
  const ProblemStatement(
      {super.key, required this.remainingTime, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    // ★ 削除: 時間経過によるフォントサイズ計算を削除
    const double currentFontSize = 20.0; // ★ フォントサイズを20.0に固定
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: Text(
          t.swipeh3_5q,
          //t.cre5q,
          // ★ 修正: Keyをフォントサイズからテキスト内容に変更
          //key: ValueKey<String>(t.cre5q),
          style: const TextStyle(
            color: Colors.white,
            fontSize: currentFontSize, // ★ 固定したフォントサイズを使用
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}