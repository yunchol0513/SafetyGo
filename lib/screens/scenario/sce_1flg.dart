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
  int flg9 = 0;
  int flg10 = 0;
  int flg11 = 0;
  int flg12 = 0;
  int flg13 = 0;
  int ans1 = 0;
  int ans2 = 0;
  int ans3 = 0;
  int ans4 = 0;

  void resetAllFlags() {
      flg1 = 0;
      flg2 = 0;
      flg3 = 0;
      flg4 = 0;
      flg5 = 0;
      flg6 = 0;
      flg7 = 0;
      flg8 = 0;
      flg9 = 0;
      flg10 = 0;
      flg11 = 0;
      flg12 = 0;
      flg13 = 0;
      ans1 = 0;
      ans2 = 0;
      ans3 = 0;
      ans4 = 0;
      notifyListeners();
  }

  void resetAns() {

      ans1 = 0;
      ans2 = 0;
      ans3 = 0;
      ans4 = 0;
      notifyListeners();
  }


void toggleFlg(int index) {
    switch (index) {
      case 1:
        if (flg1 == 0) flg1 = 1;
        break;
      case 2:
        if (flg2 == 0) flg2 = 1;
        break;
      case 3:
        if (flg3 == 0) flg3 = 1;
        break;
      case 4:
        if (flg4 == 0) flg4 = 1;
        break;
      case 5:
        if (flg5 == 0) flg5 = 1;
        break;
      case 6:
        if (flg6 == 0) flg6 = 1;
        break;
      case 7:
        if (flg7 == 0) flg7 = 1;
        break;
      case 8:
        if (flg8 == 0) flg8 = 1;
        break;
      case 9:
        if (flg9 == 0) flg9 = 1;
        break;
      case 10:
        if (flg10 == 0) flg10 = 1;
        break;
      case 11:
        if (flg11 == 0) flg11 = 1;
        break;
      case 12:
        if (flg12 == 0) flg12 = 1;
        break;
      case 13:
        if (flg13 == 0) flg13 = 1;
        break;
      case 21:
        if (ans1 == 0) ans1 = 1;
        break;
      case 22:
        if (ans2 == 0) ans2 = 1;
        break;
      case 23:
        if (ans3 == 0) ans3 = 1;
        break;
      case 24:
        if (ans4 == 0) ans4 = 1;
        break;
    }
    notifyListeners();
  }
}
