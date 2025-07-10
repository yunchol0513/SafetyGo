import 'package:flutter/material.dart';

class FlgModel extends ChangeNotifier {
  int flg1 = 0;
  int flg2 = 0;
  int flg3 = 0;
  int flg4 = 0;
  int flg5 = 0;
  int flg6 = 0;
  int flg7 = 0;
  int flg8 = 0;

  void toggleFlg(int index) {
    if (index == 1) {
      flg1 = flg1 == 0 ? 1 : 0;
    } else if (index == 2) {
      flg2 = flg2 == 0 ? 1 : 0;
    } else if (index == 3) {
      flg3 = flg3 == 0 ? 1 : 0;
    } else if (index == 4) {
      flg4 = flg4 == 0 ? 1 : 0;
    } else if (index == 5) {
      flg5 = flg5 == 0 ? 1 : 0;
    } else if (index == 6) {
      flg6 = flg6 == 0 ? 1 : 0;
    } else if (index == 7) {
      flg7 = flg7 == 0 ? 1 : 0;
    } else if (index == 8) {
      flg8 = flg8 == 0 ? 1 : 0;
    }
    notifyListeners();
  }
}
