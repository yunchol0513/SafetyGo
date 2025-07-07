/*
import 'package:flutter/material.dart'; // Flutterの基本パッケージをインポート

// アプリのエントリーポイント（最初に実行される関数）
void main() => runApp(MyApp());

// StatelessWidget（不変のUI）を作成
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // アプリ全体のテーマやルートを定義
      home: Scaffold( // ページ全体の土台（AppBarなども載せられる）
        body: DragImageExample(), // 自作のWidgetを呼び出す
      ),
    );
  }
}

// StatefulWidget（状態を持つUI）を作成
class DragImageExample extends StatefulWidget {
  @override
  _DragImageExampleState createState() => _DragImageExampleState();
} // StatefulWidgetの定義で，動的に変化する画面を作るときの基本文法

// 状態管理用クラス
class _DragImageExampleState extends State<DragImageExample> {
  Offset? dropPosition; // ドラッグした画像がターゲットにドロップされたかを記録
  // 定数として画像の位置・サイズを定義
  final double targetLeft = 100;
  final double targetTop = 300;
  final double targetWidth = 200;
  final double targetHeight = 200;

  final double draggedWidth = 100;
  final double draggedHeight = 100;


  @override
  Widget build(BuildContext context) { // 画面を作る工場
    final size = MediaQuery.of(context).size;
    return Stack( // ウィジェットを自由な位置に重ねて配置できる
      children: [

        // ドロップされる側の画像を配置（ターゲット）
        Positioned( // 画面の好きな場所に配置
          top: 300, // 上から300ピクセルの位置
          left: 100, // 左から100ピクセルの位置
          child: DragTarget<String>( // ドロップを受け付ける領域
            onAcceptWithDetails: (data) {
              setState(() {
               dropPosition = Offset(
                targetLeft + (targetWidth / 2) - (draggedWidth / 2),
                targetTop + (targetHeight / 2) - (draggedHeight / 2),
);
 // 画像中心合わせ
              });
            },
            builder: (context, _, __) {
              return Container( // 枠の中に画像を表示
                width: 200, // 幅200ピクセル
                height: 200, // 高さ200ピクセル
                color: Colors.grey[300], // 背景色（淡いグレー）
                child: Image.asset('assets/images/red.png'), // 通常時の画像
              );
            },
          ),
        ),

        // ドラッグする画像（上に置く側）と画像を掴んで動かす部分について
        Positioned(
          top: 50, // 上から50ピクセル
          left: 100, // 左から100ピクセル
          child: Draggable<String>( // ドラッグ可能にするウィジェット
            data: 'image1', // ドラッグする時に渡すデータ（今回は文字列）
            feedback: Image.asset( // 指で動かす時に見える画像
              'assets/images/run.png',
              width: 120,
            ),
            childWhenDragging: Opacity( // ドラッグ中に元の位置に薄く表示する・ドラッグ中に「元の位置に残す影」見た目
              opacity: 0.4,
              child: Image.asset(
                'assets/images/run.png',
                width: 100,
              ),
            ),
            child: Image.asset( // 通常時に表示される画像
              'assets/images/run.png',
              width: 100,
            ),
          ),
        ),

        // ドロップされたrun.pngを表示（dropPositionがあるとき）
        if (dropPosition != null)
          Positioned(
            top: dropPosition!.dy,
            left: dropPosition!.dx,
            child: Image.asset(
              'assets/images/run.png',
              width: 100,
            ),
          ),
      ],
    );
  }
}*/
// //////////
import 'package:flutter/material.dart';
import 'dart:math'; // Transform.rotateで円周率(pi)を使うためにインポート

/*
 * ===========================================================================
 * アプリケーションの開始点 (エントリーポイント)
 * ===========================================================================
 * 全てのFlutterアプリは main() 関数から実行されます。
 */
void main() {
  // runApp() は、指定されたウィジェットを画面に表示し、アプリを起動する関数です。
  runApp(const MyApp());
}

/*
 * ===========================================================================
 * アプリケーションのルート（根っこ）となるウィジェット
 * ===========================================================================
 * ここでは、アプリ全体のテーマや基本的な構造を定義します。
 * StatelessWidget: 状態を持たない静的なウィジェット。一度描画されたら見た目は変わりません。
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp: マテリアルデザインのアプリを作るための基本的な部品を提供します。
    // アプリのタイトル、テーマ、画面遷移（ルーティング）などを管理します。
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 画面右上の「DEBUG」バナーを非表示にします。
      home: Scaffold(
        // Scaffold: アプリの基本的な骨組みを作るウィジェットです。
        // AppBarやBody（メインコンテンツ）などを簡単に配置できます。
        appBar: AppBar(
          title: const Text('動き回るアバターのドラッグ'),
          backgroundColor: Colors.deepPurple,
        ),
        body: const WanderingAvatarDemo(), // メインの画面となる自作ウィジェットを呼び出します。
      ),
    );
  }
}

/*
 * ===========================================================================
 * メイン画面を構成するウィジェット
 * ===========================================================================
 * アニメーションのように、時間と共に見た目が変化する要素を含むため、StatefulWidgetを使います。
 * StatefulWidget: 状態(State)を持ち、その状態が変化すると再描画される動的なウィジェットです。
 */
class WanderingAvatarDemo extends StatefulWidget {
  const WanderingAvatarDemo({super.key});

  // StatefulWidgetは必ず createState() メソッドを持ち、対となるStateクラスのインスタンスを返します。
  @override
  State<WanderingAvatarDemo> createState() => _WanderingAvatarDemoState();
}

/*
 * ===========================================================================
 * StatefulWidgetの状態を管理し、UIを構築するクラス
 * ===========================================================================
 * `with SingleTickerProviderStateMixin`:
 * アニメーションを滑らかに動かすための「おまじない」です。
 * 画面のリフレッシュレートとアニメーションの更新タイミングを同期させる役割(vsync)を
 * このクラスに持たせるために必要です。
 */
class _WanderingAvatarDemoState extends State<WanderingAvatarDemo>
    with SingleTickerProviderStateMixin {
  // --- 状態(State)として管理する変数 ---

  // AnimationController: アニメーションの再生、停止、繰り返しなどを管理する司令塔。
  late AnimationController _controller;
  // Animation<Offset>: アニメーション期間中の「値の変化」を定義します。
  // ここではOffset(x, y座標)が時間と共にどう変わるかを定義します。
  late Animation<Offset> _animation;

  // bool値の「旗(フラグ)」。アバターがターゲットにドロップされたかどうかを記録します。
  // trueになったら、アバターの動きを止めて固定表示に切り替えます。
  bool _isDropped = false;
  // ドロップされたアバターの最終的な位置を保存する変数。
  Offset _droppedPosition = Offset.zero; // Offset.zeroは (0, 0) を意味します。

  // --- 定数 ---
  // アプリ内で何度も使う固定値を定数として定義しておくと、後からの変更が楽になります。
  static const double _targetSize = 200.0; // ターゲット(的)の円の直径

  /*
   * ---------------------------------------------------------------------------
   * Stateの初期化処理 (initState)
   * ---------------------------------------------------------------------------
   * このウィジェットが作成される時に一度だけ呼ばれます。
   * アニメーションコントローラーの初期設定などを行います。
   */
  @override
  void initState() {
    super.initState();

    // AnimationControllerのインスタンスを作成します。
    _controller = AnimationController(
      duration: const Duration(seconds: 8), // アニメーションが1周するのにかかる時間
      vsync: this, // アニメーションの更新タイミングを画面の更新と同期させます。
    );

    // TweenSequence: 複数のアニメーション(Tween)をつなぎ合わせて、複雑な軌道を作ります。
    // ここでは、四角形を描くように4つの直線的な動きをつなげています。
    // Offset(x, y)の値は、画面全体の幅・高さに対する割合(0.0〜1.0)で指定します。
    _animation = TweenSequence<Offset>([
      // 1. 左上から右上へ
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0.1, 0.1), end: const Offset(0.8, 0.1)),
        weight: 1, // 各アニメーションの長さの比率。全て1なら均等な時間配分になる。
      ),
      // 2. 右上から右下へ
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0.8, 0.1), end: const Offset(0.8, 0.4)),
        weight: 1,
      ),
      // 3. 右下から左下へ
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0.8, 0.4), end: const Offset(0.1, 0.4)),
        weight: 1,
      ),
      // 4. 左下から左上へ
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0.1, 0.4), end: const Offset(0.1, 0.1)),
        weight: 1,
      ),
    ]).animate(_controller); // 作成したアニメーションをコントローラーに接続します。

    // アニメーションを無限に繰り返すように設定します。
    _controller.repeat();
  }

  /*
   * ---------------------------------------------------------------------------
   * Stateの破棄処理 (dispose)
   * ---------------------------------------------------------------------------
   * このウィジェットが不要になった時に呼ばれます。
   * AnimationControllerなどのリソースを解放し、メモリリークを防ぎます。
   */
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /*
   * ---------------------------------------------------------------------------
   * UIの構築処理 (build)
   * ---------------------------------------------------------------------------
   * 画面に表示されるウィジェットを組み立てる、最も重要なメソッドです。
   * setState()が呼ばれるたびに、このメソッドが再実行されて画面が更新されます。
   */
  @override
  Widget build(BuildContext context) {
    // MediaQuery: 現在のデバイスの画面サイズや向きなどの情報を取得できます。
    final screenSize = MediaQuery.of(context).size;

    // Stack: ウィジェットを重ねて表示できるレイアウトウィジェット。
    // Positionedと組み合わせることで、自由な位置にウィジェットを配置できます。
    return Stack(
      children: [
        // --- ブロック1: ターゲット（的）の描画 ---
        Positioned(
          // 画面の上から60%の位置に配置
          top: screenSize.height * 0.6,
          // 水平方向中央に配置するための計算
          left: (screenSize.width - _targetSize) / 2,
          // DragTarget: 他のウィジェットからのドロップを受け付ける領域
          child: DragTarget<String>(
            // Draggableがこの領域の上でドロップされた（指が離された）時に呼ばれる
            onAccept: (_) {
              // setState()を呼ぶことで、Flutterに「状態が変わった」と伝え、画面の再描画を促す
              setState(() {
                _isDropped = true; // ドロップされたフラグを立てる
                _controller.stop(); // アバターのアニメーションを完全に停止する
                // アバターをターゲットの中央に配置するための最終座標を計算して保存
                _droppedPosition = Offset(
                  (screenSize.width - AvatarWidget.size) / 2, // X座標（水平中央）
                  screenSize.height * 0.6 + (_targetSize - AvatarWidget.size) / 2, // Y座標（垂直中央）
                );
              });
            },
            // DragTargetの見た目を定義する
            builder: (context, candidateData, rejectedData) {
              // candidateData: ドロップ候補が上にある場合にそのデータが入るリスト
              // candidateDataが空でない ＝ ドラッグ中のアバターが真上にある
              final isHovered = candidateData.isNotEmpty;
              return Container(
                width: _targetSize,
                height: _targetSize,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  shape: BoxShape.circle, // 円形に描画
                  border: Border.all(
                    color: isHovered ? Colors.amber : Colors.deepPurple, // ホバー中は色を変える
                    width: 4,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.gps_fixed, color: Colors.deepPurple, size: 50),
                ),
              );
            },
          ),
        ),

        // --- ブロック2: アバターの描画 ---
        // まだドロップされていない場合（_isDroppedがfalseの場合）のみ、動き回るアバターを表示
        if (!_isDropped)
          // AnimatedBuilder: アニメーションの値が変わるたびに、builder内のウィジェットだけを効率的に再描画する
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // 現在のアニメーションの値(0.0~1.0の割合)から、画面上の実際の座標(ピクセル)を計算
              final currentPosition = Offset(
                _animation.value.dx * (screenSize.width - AvatarWidget.size),
                _animation.value.dy * screenSize.height,
              );
              // Positionedでアバターを計算された座標に配置
              return Positioned(
                left: currentPosition.dx,
                top: currentPosition.dy,
                // Draggable: このウィジェットをドラッグ可能にする
                child: Draggable<String>(
                  data: 'avatar', // DragTargetに渡すデータ
                  onDragStarted: () => _controller.stop(), // ドラッグ開始時にアニメーションを一時停止
                  onDragEnd: (details) {
                    // ドロップが失敗した場合(wasAcceptedがfalse)のみアニメーションを再開
                    if (!details.wasAccepted) {
                      _controller.repeat();
                    }
                  },
                  feedback: const AvatarWidget(isDragging: true), // ドラッグ中に指に追従するウィジェット
                  childWhenDragging: const SizedBox(), // ドラッグ中、元の場所には何も表示しない
                  child: const AvatarWidget(), // 通常時に表示されるウィジェット
                ),
              );
            },
          )
        // ドロップされた後（_isDroppedがtrueの場合）
        else
          // 計算された最終位置にアバターを固定して表示
          Positioned(
            left: _droppedPosition.dx,
            top: _droppedPosition.dy,
            child: const AvatarWidget(),
          ),
      ],
    );
  }
}

/*
 * ===========================================================================
 * アバターの見た目を定義するウィジェット
 * ===========================================================================
 * アバターの見た目に関するコードを別のウィジェットに分離することで、
 * コード全体の見通しが良くなり、再利用しやすくなります。
 */
class AvatarWidget extends StatelessWidget {
  final bool isDragging;
  const AvatarWidget({super.key, this.isDragging = false});

  // static const にすることで、このクラスのインスタンスを作らなくても
  // `AvatarWidget.size` のように外部からサイズを参照できます。
  static const double size = 80.0;

  @override
  Widget build(BuildContext context) {
    // Transform.rotate: 子ウィジェットを回転させることができます。
    return Transform.rotate(
      angle: isDragging ? -pi / 20.0 : 0, // ドラッグ中は少し傾けて、掴んでいる感を演出
      // Material: 影(elevation)やインクのはね返り効果(splash)など、マテリアルデザインの視覚効果を提供します。
      child: Material(
        elevation: isDragging ? 10 : 4, // ドラッグ中は影を濃くして、浮き上がっているように見せる
        borderRadius: BorderRadius.circular(size / 2), // 影の形を円形にする
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // 本体も円形に
            // LinearGradient: 線形のグラデーションを表現します。
            gradient: LinearGradient(
              colors: isDragging
                  ? [Colors.amber, Colors.orange] // ドラッグ中は色を変える
                  : [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.directions_run, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}
