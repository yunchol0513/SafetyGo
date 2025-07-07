// quiz_state.dart

class QuizState {
  // アプリ全体で共有する静的変数
  static int correctCount = 0;

  // 正解時に呼び出すメソッド
  static void increment() {
    correctCount++;
  }

  // ゲーム開始時にスコアを0に戻すメソッド
  static void reset() {
    correctCount = 0;
  }
}