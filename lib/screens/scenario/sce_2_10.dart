import 'package:flutter/material.dart';
import 'sce_2_9.dart';
import 'sce_2_4.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Sce_2_10 extends StatefulWidget {
  const Sce_2_10({super.key});

  @override
  State<Sce_2_10> createState() => _Sce_2_10State();
}

class _Sce_2_10State extends State<Sce_2_10> {
  String _message = '';
  bool _showButtons = false;

  void _onPersonTap() {
    final t = AppLocalizations.of(context)!;
    setState(() {
      _message = t.sce2_10 + t.mane;
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
      _message = '';
      _showButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.stage2,
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
                'assets/images/arigatai_5.jpg',
                fit: BoxFit.cover,           // 画面全体をカバー、中央基準で拡大縮小
                alignment: Alignment.center, // 中央を基準に表示
              ),
                ),
                Positioned(
                  right: 10,
                  top: 100,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 36),
                    color: const Color.fromARGB(221, 255, 254, 254),
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
                      _message.isEmpty ? t.koudou : _message,
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
                            child: Text(t.yes),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: _onNo,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            child: Text(t.no),
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
