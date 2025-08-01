import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_go/l10n/app_localizations.dart';

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
      final doc = await FirebaseFirestore.instance.collection('game_progress').doc(uid).get();
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
    final t = AppLocalizations.of(context)!;
    print('クリア済みのステージ数: $_cleared');
    final isEnabled1 = _cleared >= 0;
    final isEnabled2 = _cleared >= 1;
    final isEnabled3 = _cleared >= 2;
    final isEnabled4 = _cleared >= 3;
    final Enabled2 = _cleared >= 1 ? 1.0:0.0;
    final Enabled3 = _cleared >= 2 ? 1.0:0.0;
    final Enabled4 = _cleared >= 3 ? 1.0:0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.choosestage),
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
             
              _buildStageButton(
                label: 'Part 1',
                enabled: isEnabled1,
                onPressed: () {
                  context.go(RoutePaths.First);
                  print('part:1');
                },
                color: Colors.deepPurple,
              ),
              _buildBadge(
                visible: isEnabled2,
                text: 'Part 1 ' + t.cleared + t.swipehpart1,
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
                text: 'Part 2 ' + t.cleared + t.swipehpart2,
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
                text: 'Part 3 ' + t.cleared + t.swipehpart3,
              ),
              const SizedBox(height: 40),
              _buildStageButton(
                label: t.back,
                enabled: true,
                onPressed: () {
                  context.go(RoutePaths.diffculty_quake);
                  print(t.back);
                },
                color: Colors.grey.shade700,
              ),
              Row(
          children: [
            SizedBox(width: 10),
              //if (isEnabled2)
                Flexible(
                flex: 1,
                child: Column(
      children: [
        AspectRatio(
          aspectRatio: 4.3 /6 ,
          child: Opacity(
          opacity: Enabled2, // 透明にする
          child: Image.asset('assets/images/enblem/トロッコ_part1.png',
            fit: BoxFit.cover,
          ),
        )),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part1' + t.proof,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(Enabled2),
            ),
          ),
        ),
      ],
                ),
                ),
              Flexible(
              flex: 1,
              child: Column(
      children: [
        AspectRatio(
          aspectRatio:4.3 / 6,
          child: Opacity(
          opacity: Enabled3, // 透明にする
          child: Image.asset('assets/images/enblem/トロッコ_part2.png'),
        )),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part2' + t.proof,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(Enabled3),
            ),
          ),
        ),
      ],
                ),
                ),
              Flexible(
              flex: 1,
              child: Column(
      children: [
        AspectRatio(
          aspectRatio: 4.3 / 6,
          child: Opacity(
          opacity: Enabled4, // 透明にする
          child: Image.asset('assets/images/enblem/トロッコ_part3.png'),
        )),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part3' + t.proof,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(Enabled4),
            ),
          ),
        ),
      ],
                ),
                ),
          ],
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
