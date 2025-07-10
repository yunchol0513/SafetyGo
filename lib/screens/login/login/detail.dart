import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('select_detail')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/detail_page/たろう'),
              child: const Text('たろうさんのページ'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/detail_page/はなこ'),
              child: const Text('はなこさんのページ'),
            ),
          ],
        ),
      ),
    );
  }
}