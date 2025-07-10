import 'package:flutter/material.dart';
import 'dart:async';
import 'sce_2_7.dart';

class Sce_2_5 extends StatefulWidget {
  const Sce_2_5({super.key});

  @override
  State<Sce_2_5> createState() => _Sce_2_5State();
}

class _Sce_2_5State extends State<Sce_2_5> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  bool _showWarning = false;
  bool _earthquakeEnded = false;

  String _text = '初めての神戸、小籠包にタピオカ、南京町にはおいしいものがたくさんあるなぁ';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 0), weight: 1),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startEarthquakeSequence() {
    if (_controller.isAnimating) return;

    setState(() {
      _showWarning = true;
    });

    _controller.repeat();

    Timer(const Duration(seconds: 3), () {
      _controller.stop();
      _controller.reset();
      setState(() {
        _showWarning = false;
        _earthquakeEnded = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Sce_2_7()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 1',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 地震時の揺れ付き背景画像
          AnimatedBuilder(
            animation: _shakeAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_shakeAnimation.value, 0),
                child: child,
              );
            },
            child: Center(
              child: Image.asset(
                'assets/images/nankin_background.jpg',
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          // 下部のテキストと「次へ」ボタン
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _earthquakeEnded ? '地震が終わりました。' : _text,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  if (!_earthquakeEnded)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton.icon(
                        onPressed: _startEarthquakeSequence,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('次へ'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                          elevation: 4,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 地震警告オーバーレイ
          if (_showWarning)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: const Text(
                  '地震だ！',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
