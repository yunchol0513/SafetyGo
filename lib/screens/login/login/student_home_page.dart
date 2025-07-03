// lib/student_home_page.dart
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'detail_page.dart';
//下の2文はgo_routerを使うために必要
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});
@override
  State<StudentHomePage> createState() => _StudentHomePageState();
}
class _StudentHomePageState extends State<StudentHomePage> {
  bool tasks1 = false;
  bool tasks2 = false;
  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final doc = await FirebaseFirestore.instance.collection('progress').doc(user.uid).get();
    //ドキュメントが存在するかチェック
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      setState(() {
        tasks1 = data['task1'] ?? false;
        tasks2 = data['task2'] ?? false;
      });
    }
  }
  void saveProgress() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  await FirebaseFirestore.instance.collection('progress').doc(user.uid).set({
    'name': user.email,          // 生徒の名前（またはメールアドレス）
    'task1': tasks1,              // 課題1の状態（true/false）
    'task2': tasks2,              // 課題2の状態（true/false）
    'updatedAt': FieldValue.serverTimestamp(), // 最終保存時刻
  });

  // 保存完了を通知（画面下に出るやつ）
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('保存しました！')),
  );
}

  
@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('生徒用ホーム'),
        leading: 
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip:'ログアウト',
            onPressed: () => AuthService().signOut(),//()=>はボタンが押されたときに実行を示している．
          ),
        
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //チェックリストを作成していく
           CheckboxListTile(
      title: const Text('課題1:提出済み'),
      value: tasks1,
      onChanged: (value) {//チェックすることで実行される
        setState(() {
          tasks1 = value!;//状態を変える
        });
      },
    ),
    CheckboxListTile(
      title: const Text('課題2:提出済み'),
      value: tasks2,
      onChanged: (value) {
        setState(() {
          tasks2 = value!;
        });
      },
    ),//保存ボタンを追加
    
    ElevatedButton(
      onPressed:saveProgress,
      child: const Text('進捗を保存'),
       ),
    ElevatedButton(onPressed:(){
      Navigator.push(context, MaterialPageRoute
      (builder: (context) => const DetailPage(studentName:'アプリの使い方')));

    }, child:Text('アプリの使い方')),
    ElevatedButton(
      onPressed:() => context.go(RoutePaths.genre),
      child: const Text('セレクト画面'),
       ),
    ],),
      )
    


    );
  }
}