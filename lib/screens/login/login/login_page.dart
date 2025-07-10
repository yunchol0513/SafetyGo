// lib/login_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _authService.signIn(_emailController.text, _passwordController.text);
    } on FirebaseAuthException catch (e) {
      _showErrorSnackBar('ログインに失敗しました: ${e.message}');
    }
  }

  Future<void> _handleSignUp() async {
    try {
      await _authService.signUp(_emailController.text, _passwordController.text);
    } on FirebaseAuthException catch (e) {
      _showErrorSnackBar('新規登録に失敗しました: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleSignIn,
                child: const Text('ログイン'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: _handleSignUp,
                child: const Text('新規登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//ここから日高