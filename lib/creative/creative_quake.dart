import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Creative_quake extends StatefulWidget {
  const Creative_quake({super.key});
  @override
  State<Creative_quake> createState() => _Creative_quakeState();
}

class _Creative_quakeState extends State<Creative_quake> {
  int _cleared = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      final doc = await FirebaseFirestore.instance.collection('progress').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('part_3')) {
          final part3Value = (data['part_3'] as num).toInt();
          setState(() {
            _cleared = part3Value;
          });
        }
      }
    } catch (e) {
      print('Error loading progress: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled1 = _cleared >= 0;
    final isEnabled2 = _cleared >= 1;
    final isEnabled3 = _cleared >= 2;
    final isEnabled4 = _cleared >= 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('上級ステージ選択'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFF3E5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
             Row(
          children: [
            SizedBox(width: 10),
              if (isEnabled2)
                Flexible(
                flex: 1,
                child: Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 6,
          child: Image.asset(
            'assets/images/enblem/トロッコ_part1.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part1クリアの証',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
                ),
                ),
                /*child: AspectRatio(
                aspectRatio: 5 / 6, // 幅:高さ = 200:240
                child: Image.asset(
                  'assets/images/enblem/トロッコ_part1.png',
                  fit: BoxFit.cover,
                ),
                ),
                ),*/
            if (isEnabled3)
              Flexible(
              flex: 1,
              child: Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 6,
          child: Image.asset(
            'assets/images/enblem/トロッコ_part2.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part2クリアの証',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
                ),
                ),
              /*child: AspectRatio(
              aspectRatio: 5 / 6,
              child: Image.asset(
                'assets/images/enblem/トロッコ_part2.png',
                fit: BoxFit.cover,
              ),
              ),
              ),
            SizedBox(width: 10),*/
            if (isEnabled4)
              Flexible(
              flex: 1,
              child: Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 6,
          child: Image.asset(
            'assets/images/enblem/トロッコ_part3.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part3クリアの証',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
                ),
                ),
              /*child: AspectRatio(
              aspectRatio: 5 / 6,
              child: Image.asset(
                'assets/images/enblem/トロッコ_part3.png',
                fit: BoxFit.cover,
              ),
            ),
            ),*/
          ],
        ),
              _buildStageButton(
                label: 'Part 1',
                enabled: isEnabled1,
                onPressed: () {
                  context.go(RoutePaths.creative_1);
                  print('part:1');
                },
                color: Colors.deepPurple,
              ),
              _buildBadge(
                visible: isEnabled2,
                text: 'Part 1 クリア済み\n災害レベルⅠの称号を獲得！',
              ),
              const SizedBox(height: 20),
              _buildStageButton(
                label: 'Part 2',
                enabled: isEnabled2,
                onPressed: () {
                  context.go(RoutePaths.creative_21);
                  print('part:2');
                },
                color: Colors.deepPurple,
              ),
              _buildBadge(
                visible: isEnabled3,
                text: 'Part 2 クリア済み\n災害レベルⅡの称号を獲得！',
              ),
              const SizedBox(height: 20),
              _buildStageButton(
                label: 'Part 3',
                enabled: isEnabled3,
                onPressed: () {
                  context.go(RoutePaths.creative_31);
                  print('part:3');
                },
                color: Colors.deepPurple,
              ),
              _buildBadge(
                visible: isEnabled4,
                text: 'Part 3 クリア済み\n災害マスターの称号を獲得！',
              ),
              const SizedBox(height: 40),
              _buildStageButton(
                label: '戻る',
                enabled: true,
                onPressed: () {
                  context.go(RoutePaths.diffculty_quake);
                  print('戻る');
                },
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageButton({
    required String label,
    required bool enabled,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: const Icon(Icons.arrow_forward),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? color : Colors.grey,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildBadge({required bool visible, required String text}) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: visible ? 1.0 : 0.0,
      child: Visibility(
        visible: visible,
        child: Card(
          color: Colors.deepPurple.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.only(top: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.deepPurple),
            ),
          ),
        ),
      ),
    );
  }
}
