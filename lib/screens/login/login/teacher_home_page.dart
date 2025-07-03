// lib/teacher_home_page.dart
import 'package:flutter/material.dart';
import 'auth_service.dart';
//firestoreを使用するときは以下のコード
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detail_page.dart';
class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('教師用ダッシュボード'),
        leading: 
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'ログアウト',
            onPressed: () => AuthService().signOut(),
          ),
        
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('progress').snapshots(),
        builder:(context,snapshot){
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final name = data['name'] ?? '名前未設定';
              final task1 = data['task1'] ?? false;
              final task2 = data['task2'] ?? false;
              return ListTile(
                title: Text(name),
                subtitle: Text('課題1: ${task1 ? '提出済み' : '未提出'}\n課題2: ${task2 ? '提出済み' : '未提出'}'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage (studentName: name),
                      ),
                  );
                },
              );
            },
          );


        }

      )
      );
  }
}