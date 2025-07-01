import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart'; // just_audioをインポート
import 'package:safety_go/constants/route_paths.dart';

// 状態を管理するため StatefulWidget に変更
class St_problem_normal_quake1 extends StatefulWidget {
  const St_problem_normal_quake1({super.key});

  @override
  State<St_problem_normal_quake1> createState() =>
      _St_problem_normal_quake1State();
}

class _St_problem_normal_quake1State extends State<St_problem_normal_quake1> {
  // AudioPlayerのインスタンスを作成
  late final AudioPlayer _audioPlayer;

  final List<String> options = ['A', 'B', 'C', 'D'];
  final String explanation = "これは選択肢の解説です。正解は B です。";

  // Widgetが作成されたときに一度だけ呼ばれる初期化処理
  @override
  void initState() {
    super.initState();
    // AudioPlayerを初期化
    _audioPlayer = AudioPlayer();
    // 音声ファイルをセット（ステップ2で追加したファイルのパスを指定）
    _setAudioSource();
  }

  // 音声ファイルをプレーヤーに設定するメソッド
  Future<void> _setAudioSource() async {
    try {
      // assetsから音声を読み込む場合
      await _audioPlayer.setAsset('assets/images/audio/地震.m4a');
      // ネットワーク上の音声ファイルを再生する場合は以下のようにします
      // await _audioPlayer.setUrl('https://example.com/audio.mp3');
    } catch (e) {
      // エラーハンドリング
      print("Error loading audio source: $e");
    }
  }

  // Widgetが破棄されるときに呼ばれる後処理
  @override
  void dispose() {
    // AudioPlayerのリソースを解放
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showExplanation(BuildContext context) {
    // 解説表示の前に音声を停止
    _audioPlayer.stop();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              explanation,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: 'st_pro_normal_quake2' というパスがルーターに存在するか確認してください
                  context.go(RoutePaths.st_pro_normal_quake2);
                },
                child: Text('次の問題へ'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("問題")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // 子を水平方向に広げる
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "問題文：次の中で正しいのは？",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          // ここに音声プレーヤーを配置
          _buildAudioPlayerControls(),
          
          SizedBox(height: 20), // スペーサー

          // 選択肢の部分
          ...options.map((option) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: ElevatedButton(
                  child: Text("選択肢 $option"),
                  onPressed: () => _showExplanation(context),
                ),
              )),
        ],
      ),
    );
  }

  // 音声プレーヤーのUIを構築するメソッド
  Widget _buildAudioPlayerControls() {
    return StreamBuilder<PlayerState>(
      stream: _audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;

        // 読み込み中の表示
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: EdgeInsets.all(8.0),
            width: 64.0,
            height: 64.0,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // 再生/一時停止ボタン
        return IconButton(
          icon: Icon(playing == true ? Icons.pause_circle_filled : Icons.play_circle_filled),
          iconSize: 64.0,
          onPressed: () {
            if (playing == true) {
              _audioPlayer.pause();
            } else {
              // 再生が終わっていたら、最初から再生
              if (processingState == ProcessingState.completed) {
                _audioPlayer.seek(Duration.zero);
              }
              _audioPlayer.play();
            }
          },
        );
      },
    );
  }
}
