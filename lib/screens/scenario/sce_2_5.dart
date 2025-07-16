import 'package:flutter/material.dart';
import 'dart:async';
import 'sce_2_7.dart';
import 'package:safety_go/l10n/app_localizations.dart';

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

  String _text = '';

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
    final t = AppLocalizations.of(context)!;
    _text = t.firstkobe;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.stage2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 背景画像＋揺れエフェクト（中央基準で拡大縮小）
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_shakeAnimation.value, 0),
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/arigatai_1.jpg',
                fit: BoxFit.cover,           // 画面全体をカバー、中央基準で拡大縮小
                alignment: Alignment.center, // 中央を基準に表示
              ),
            ),
          ),

          // 黒半透明オーバーレイ（背景を少し暗くしてテキスト見やすく）
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // メインのスクロールコンテンツ
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.6), // 背景が見える余白調整

                // 下部テキスト＋ボタン
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
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
                      const SizedBox(height: 20),
                      if (!_earthquakeEnded)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton.icon(
                            onPressed: _startEarthquakeSequence,
                            icon: const Icon(Icons.arrow_forward),
                            label: Text(t.next),
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
              ],
            ),
          ),

          // 地震警告オーバーレイ
          if (_showWarning)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: Text(
                  t.jisin,
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
