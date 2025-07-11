import 'package:flutter/material.dart';
import 'sce_2_9.dart';
import 'sce_2_4.dart';

class Sce_2_10 extends StatefulWidget {
  const Sce_2_10({super.key});

  @override
  State<Sce_2_10> createState() => _Sce_2_10State();
}

class _Sce_2_10State extends State<Sce_2_10> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    setState(() {
      _message = '走って逃げるほうがいいのかな。この人のまねをする？';
      _showButtons = true;
    });
  }

  void _onYes() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Sce_2_4()),
    );
  }

  void _onNo() {
    setState(() {
      _message = '「いいえ」が選ばれました。';
      _showButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ステージ 1',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade400,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/haikei1_7.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 36),
                    color: Colors.black87,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Sce_2_9()),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: GestureDetector(
                    onTap: _onPersonTap,
                    child: Image.asset(
                      'assets/images/chara_1_7.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _message.isEmpty ? 'どんな行動をする？' : _message,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  if (_showButtons)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: _onYes,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: const Text('はい'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: _onNo,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            child: const Text('いいえ'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
