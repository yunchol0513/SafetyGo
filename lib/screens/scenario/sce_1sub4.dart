import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui';

class Sce1s4 extends StatefulWidget {
  const Sce1s4({super.key});

  @override
  State<Sce1s4> createState() => _Sce1s4State();
}

class _Sce1s4State extends State<Sce1s4> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    final flg = Provider.of<FlgModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Scenario sub 1-4')),
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
              'assets/images/sce1-4back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0.9, 1.0),
                      child: SizedBox(
                          height: 400,
                          child: Image.asset('assets/images/people4.png'),
                      ),
                    ),
                  ],
                ),
              ),

          // 下のテキストエリア（2割）
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    // Positioned.fill(
                    Container(
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('(見出し)'),
                          SizedBox(height: 8),
                          Text('避難所が近くにあった気がする！'),
                        ],
                      ),
                    ),
        
                    Align(
                      alignment: Alignment(0.9, 0.8),
                      child: ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text("戻る")
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //flgを上げる
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => flg.toggleFlg(3),
                        child: const Text('Toggle flg3'),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 状態確認パネル（右側表示）
          if (showStatus)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 160,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(-2, 2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('状態確認', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('flg1: ${flg.flg1}'),
                    Text('flg2: ${flg.flg2}'),
                    Text('flg3: ${flg.flg3}'),
                    Text('flg4: ${flg.flg4}'),
                    Text('flg5: ${flg.flg5}'),
                    Text('flg6: ${flg.flg6}'),
                    Text('flg7: ${flg.flg7}'),
                    Text('flg8: ${flg.flg8}'),
                    ElevatedButton(
                      onPressed: () => context.push(RoutePaths.sce1_10), 
                      child: Text('Escape')),
                    ElevatedButton(
                      onPressed: () => context.go(RoutePaths.scehome), 
                      child: Text('Home'))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
