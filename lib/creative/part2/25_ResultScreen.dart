// 5_ResultScreen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen25 extends StatefulWidget {
  final bool isCorrect;
  const ResultScreen25({
    super.key,
    required this.isCorrect,
  });

  @override
  State<ResultScreen25> createState() => _ResultScreenState25();
}

class _ResultScreenState25 extends State<ResultScreen25> {
  bool _showExplanation = false;

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.black.withOpacity(0.75),
      body: Stack(
        children: [
          if (!_showExplanation)
            Center(
              child: ResultSymbol5(isCorrect: widget.isCorrect),
            ),
          if (_showExplanation)
            ExplanationPanel(
              // ★ パート選択画面へ戻る
              onNextQuestion: () => context.go('/diffculty_quake'),
            ),
        ],
      ),
    );
  }
}

// ===========================================================================
// 以下、補助ウィジェット群
// ===========================================================================

class ResultSymbol5 extends StatelessWidget {
  final bool isCorrect;
  const ResultSymbol5({super.key, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value.clamp(0.0, 1.0), child: child),
        );
      },
      child: Icon(
        isCorrect ? Icons.circle_outlined : Icons.close,
        color: isCorrect ? Colors.red : Colors.blue,
        size: 200,
        shadows: const [
          Shadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
    );
  }
}

class ExplanationPanel extends StatelessWidget {
  final VoidCallback onNextQuestion;
  const ExplanationPanel({super.key, required this.onNextQuestion});

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
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, blurRadius: 15, offset: Offset(0, 5))
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('【解説】',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text(
                'ここに、なぜその答えが正しいのか（あるいは違うのか）の解説文が入ります。この文章は正解・不正解どちらの場合でも同じ内容が表示されます。',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onNextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF37474F),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('パート選択画面へ',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}