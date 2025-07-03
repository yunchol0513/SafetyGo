import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
    //1.データを受け取るための変数をfinalで宣言する
    final String studentName ;
    const DetailPage({
      super.key,
      required this.studentName,
    });
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title:Text('$studentNameさんの詳細ページ'),
      ),
      body: const Center(
        child: Text('ここは詳細ページです',
        style: TextStyle(fontSize: 24),),
        
        
      )
    );

      
    }
}

