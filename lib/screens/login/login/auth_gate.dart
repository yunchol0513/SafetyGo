// lib/auth_gate.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart';
import 'student_home_page.dart';
import 'teacher_home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // ↓↓↓↓↓ 教師のメールアドレスをここに設定してください ↓↓↓↓↓
    const  teacherlist =['e1923069@oit.ac.jp','e1923075@oit.ac.jp'];
    /*const String teacherEmail1 = 'e1923069@oit.ac.jp';
    const String teacherEmail2 = 'e1923075@ad.oit.ac.jp';*/

    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        // 接続待機中はローディング画面を表示
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // ログインしているかどうかをチェック
        if (snapshot.hasData) {
          // ログインしているユーザーの情報を取得
          final user = snapshot.data!;
          // メールアドレスを比較し、教師か生徒かを判断
          if (user.email == teacherlist[0] || user.email == teacherlist[1]) {
            // 教師なら教師用画面へ
            return const TeacherHomePage();
          } else {
            // 生徒なら生徒用画面へ
            return const StudentHomePage();
          }
        } else {
          // ログインしていなければログイン画面へ
          return const LoginPage();
        }
      },
    );
  }
}
