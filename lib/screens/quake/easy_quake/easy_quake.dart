import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class Easy_quake extends StatefulWidget {
  const Easy_quake({super.key});

  @override
  State<Easy_quake> createState() => _Easy_quakeState();
}

class _Easy_quakeState extends State<Easy_quake> {
  int _cleared = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      final doc = await firestore.collection('game_progress').doc(uid).get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('part_1')) {
          final part1Value = (data['part_1'] as num).toInt();
          setState(() {
            _cleared = part1Value;
          });
        }
      }
    } catch (e) {
      print('エラー: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFE8F5E9)],
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
              //if (isEnabled2)
                Flexible(
                flex: 1,
                /*child: AspectRatio(
                aspectRatio: 5 / 6, // 幅:高さ = 200:240
                child: Image.asset(
                  'assets/images/maru_part1.jpg',
                  fit: BoxFit.cover,
                ),
                ),
                ),*/
                child: Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 6,
          child: Opacity(
          opacity: Enabled2, // 透明にする
          child: Image.asset('assets/images/maru_part1.jpg',
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
            ),
          ),
        ),
      ],
                ),
                ),
            SizedBox(width: 10),
            //if (isEnabled3)
              Flexible(
              flex: 1,
              child: Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 6,
          child: Opacity(
          opacity: Enabled3, // 透明にする
          child: Image.asset('assets/images/enblem/丸バツ_part2.jpg',
            fit: BoxFit.cover,
          ),
        )),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part2' + t.proof,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025,
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
                'assets/images/enblem/丸バツ_part2.jpg',
                fit: BoxFit.cover,
              ),
              ),
              ),*/
            SizedBox(width: 10),
            //if (isEnabled4)
              Flexible(
              flex: 1,
              child: Column(
      children: [
        AspectRatio(
          aspectRatio: 5 / 6,
          child: Opacity(
          opacity: Enabled4, // 透明にする
          child: Image.asset('assets/images/enblem/丸バツ_part3.jpg',
            fit: BoxFit.cover,
          ),
        )),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'part3' + t.proof,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.025,
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
                'assets/images/enblem/丸バツ_part3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ),*/
          ],
        ),
              buildStageButton(
                label: 'Part 1',
                onPressed: () => context.go(RoutePaths.st_pro_easy_quake1),
                enabled: isEnabled1,
              ),
              buildBadge(
                visible: isEnabled2,
                text: 'Part 1 ' + t.cleared + t.easypart1,
              ),
              const SizedBox(height: 20),
              buildStageButton(
                label: 'Part 2',
                onPressed: () => context.go(RoutePaths.st_pro_easy_quake3),
                enabled: isEnabled2,
              ),
              buildBadge(
                visible: isEnabled3,
                text: 'Part 2 ' + t.cleared + t.easypart2,
              ),
              const SizedBox(height: 20),
              buildStageButton(
                label: 'Part 3',
                onPressed: () => context.go(RoutePaths.st_pro_easy_quake5),
                enabled: isEnabled3,
              ),
              buildBadge(
                visible: isEnabled4,
                text: 'Part 3 ' + t.cleared + t.easypart3,
              ),
              const SizedBox(height: 40),
              buildStageButton(
                label: t.back,
                onPressed: () => context.go(RoutePaths.diffculty_quake),
                enabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStageButton({
    required String label,
    required VoidCallback onPressed,
    required bool enabled,
  }) {
    return ElevatedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: const Icon(Icons.arrow_forward_ios),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? Colors.indigo : Colors.grey,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget buildBadge({required bool visible, required String text}) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: visible ? 1.0 : 0.0,
      child: Visibility(
        visible: visible,
        child: Card(
          color: Colors.amber.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.only(top: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
