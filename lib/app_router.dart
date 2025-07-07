//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/creative/part1/1_GameScreen.dart';
import 'package:safety_go/screens/language/select_language.dart';
import 'package:safety_go/screens/language/modify_language.dart';
import 'package:safety_go/screens/login/rogin.dart';
import 'package:safety_go/screens/mainpage/select_detail.dart';
import 'package:safety_go/screens/mainpage/select_genre.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_10.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_6.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_7.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_8.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_9.dart';
import 'package:safety_go/screens/quake/select_difficulty_quake.dart';

import 'package:safety_go/screens/quake/easy_quake/easy_quake.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_1.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_2.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_3.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_1.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_2.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_3.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_4.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_5.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_6.dart';
import 'package:safety_go/screens/quake/normal_quake/normal_quake.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_1.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_2.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_3.dart';

import 'package:safety_go/screens/scenario/sce_1_1.dart';
import 'package:safety_go/screens/scenario/sce_1_2.dart';
import 'package:safety_go/screens/scenario/sce_1_3.dart';
import 'package:safety_go/screens/scenario/sce_1_4.dart';
import 'package:safety_go/screens/scenario/sce_1_5.dart';
import 'package:safety_go/screens/scenario/sce_1_6.dart';
import 'package:safety_go/screens/scenario/sce_1_7.dart';

import 'package:safety_go/screens/scenario/sce_2_1.dart';
import 'package:safety_go/screens/scenario/sce_2_2.dart';
import 'package:safety_go/screens/scenario/sce_2_3.dart';
import 'package:safety_go/screens/scenario/sce_2_4.dart';
import 'package:safety_go/screens/scenario/sce_2_5.dart';
import 'package:safety_go/screens/scenario/sce_2_6.dart';
import 'package:safety_go/screens/scenario/sce_2_7.dart';
import 'package:safety_go/screens/scenario/sce_2_8.dart';
import 'package:safety_go/screens/scenario/sce_2_9.dart';
import 'package:safety_go/screens/scenario/sce_2_10.dart';
import 'package:safety_go/screens/scenario/sce_2_11.dart';
import 'package:safety_go/screens/scenario/sce_2_12.dart';
import 'package:safety_go/screens/scenario/sce_2_13.dart';

import 'package:safety_go/screens/scenario/sce_3_1.dart';
import 'package:safety_go/screens/scenario/sce_3_2.dart';

import 'package:safety_go/screens/scenario/sce_4_1.dart';
import 'package:safety_go/screens/scenario/sce_4_2.dart';

import 'package:safety_go/screens/scenario/sce_5_1.dart';
import 'package:safety_go/screens/scenario/sce_5_2.dart';

import 'package:safety_go/screens/scenario/sce_6_1.dart';
import 'package:safety_go/screens/scenario/sce_6_2.dart';

import 'package:safety_go/screens/scenario/sce_7_1.dart';
import 'package:safety_go/screens/scenario/sce_7_2.dart';

import 'package:safety_go/screens/scenario/sce_8_1.dart';
import 'package:safety_go/screens/scenario/sce_8_2.dart';

import 'package:safety_go/screens/scenario/sce_9_1.dart';
import 'package:safety_go/screens/scenario/sce_9_2.dart';

import 'package:safety_go/screens/scenario/sce_10_1.dart';
import 'package:safety_go/screens/scenario/sce_10_2.dart';

import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_1.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_2.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_3.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_4.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_5.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_11.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_12.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_13.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_14.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_15.dart';

import'package:safety_go/screens/login/login/auth_gate.dart';

import 'package:safety_go/creative/part1/1_GameScreen.dart';
import 'package:safety_go/creative/part1/1_ResultScreen.dart';
import 'package:safety_go/creative/part1/2_GameScreen.dart';
import 'package:safety_go/creative/part1/2_ResultScreen.dart';
import 'package:safety_go/creative/part1/3_GameScreen.dart';
import 'package:safety_go/creative/part1/3_ResultScreen.dart';
import 'package:safety_go/creative/part1/4_GameScreen.dart';
import 'package:safety_go/creative/part1/4_ResultScreen.dart';
import 'package:safety_go/creative/part1/5_GameScreen.dart';
import 'package:safety_go/creative/part1/5_ResultScreen.dart';

GoRouter appRouter({
  required Locale locale,
  required void Function(Locale) onLocaleChanged,
}) {
  return GoRouter(
    initialLocation: '/creative_1',//最初の画面なので，GoRoteのpathで変更可能
    routes: [
    //language
    GoRoute(path: '/language', builder: (context, state) => Select_language( onLanguageSelected: onLocaleChanged)),
    GoRoute(path: '/mode_language', builder: (context, state) => Mode_language()),

    //rogin
    GoRoute(path: '/rogin', builder: (context, state) => Rogin()),

    //mainscrean
    GoRoute(path: '/genre', builder: (context, state) => Genre()),
    GoRoute(path: '/detail', builder: (context, state) => Detail()),
    GoRoute(path: '/diffculty_quake', builder: (context, state) => Diffculty_quake()),

    //quake_easy
    GoRoute(path: '/easy_quake', builder: (context, state) => Easy_quake()),
    GoRoute(path: '/st_easy_quake1', builder: (context, state) => St_easy_quake1()),
    GoRoute(path: '/st_easy_quake2', builder: (context, state) => St_easy_quake2()),
    GoRoute(path: '/st_easy_quake3', builder: (context, state) => St_easy_quake3()),
    GoRoute(path: '/st_pro_easy_quake1', builder: (context, state) => St_pro_easy_quake1()),
    GoRoute(path: '/st_pro_easy_quake2', builder: (context, state) => St_pro_easy_quake2()),
    GoRoute(path: '/st_pro_easy_quake3', builder: (context, state) => St_pro_easy_quake3()),
    GoRoute(path: '/st_pro_easy_quake4', builder: (context, state) => St_pro_easy_quake4()),
    GoRoute(path: '/st_pro_easy_quake5', builder: (context, state) => St_pro_easy_quake5()),
    GoRoute(path: '/st_pro_easy_quake6', builder: (context, state) => St_pro_easy_quake6()),

    //quake_normal
    GoRoute(path: '/normal_quake', builder: (context, state) => Normal_quake()),
    GoRoute(path: '/st_normal_quake1', builder: (context, state) => St_normal_quake1()),
    GoRoute(path: '/st_normal_quake2', builder: (context, state) => St_normal_quake2()),
    GoRoute(path: '/st_normal_quake3', builder: (context, state) => St_normal_quake3()),
    GoRoute(path: '/st_pro_normal_quake1', builder: (context, state) => St_problem_normal_quake1()),
    GoRoute(path: '/st_pro_normal_quake2', builder: (context, state) => St_problem_normal_quake2()),
    GoRoute(path: '/st_pro_normal_quake3', builder: (context, state) => St_problem_normal_quake3()),
    GoRoute(path: '/st_pro_normal_quake4', builder: (context, state) => St_problem_normal_quake4()),
    GoRoute(path: '/st_pro_normal_quake5', builder: (context, state) => St_problem_normal_quake5()),
    GoRoute(path: '/st_pro_normal_quake6', builder: (context, state) => St_problem_normal_quake6()),
    GoRoute(path: '/st_pro_normal_quake7', builder: (context, state) => St_problem_normal_quake7()),
    GoRoute(path: '/st_pro_normal_quake8', builder: (context, state) => St_problem_normal_quake8()),
    GoRoute(path: '/st_pro_normal_quake9', builder: (context, state) => St_problem_normal_quake9()),
    GoRoute(path: '/st_pro_normal_quake10', builder: (context, state) => St_problem_normal_quake10()),
    GoRoute(path: '/st_pro_normal_quake11', builder: (context, state) => St_problem_normal_quake11()),
    GoRoute(path: '/st_pro_normal_quake12', builder: (context, state) => St_problem_normal_quake12()),
    GoRoute(path: '/st_pro_normal_quake13', builder: (context, state) => St_problem_normal_quake13()),
    GoRoute(path: '/st_pro_normal_quake14', builder: (context, state) => St_problem_normal_quake14()),
    GoRoute(path: '/st_pro_normal_quake15', builder: (context, state) => St_problem_normal_quake15()),
    //scenario
    GoRoute(path: '/sce_1_1', builder: (context, state) => Sce_1_1()),
    GoRoute(path: '/sce_1_2', builder: (context, state) => Sce_1_2()),
    GoRoute(path: '/sce_1_3', builder: (context, state) => Sce_1_3()),
    GoRoute(path: '/sce_1_4', builder: (context, state) => Sce_1_4()),
    GoRoute(path: '/sce_1_5', builder: (context, state) => Sce_1_5()),
    GoRoute(path: '/sce_1_6', builder: (context, state) => Sce_1_6()),
    GoRoute(path: '/sce_1_7', builder: (context, state) => Sce_1_7()),

    GoRoute(path: '/sce_2_1', builder: (context, state) => Sce_2_1()),
    GoRoute(path: '/sce_2_2', builder: (context, state) => Sce_2_2()),
    GoRoute(path: '/sce_2_3', builder: (context, state) => Sce_2_3()),
    GoRoute(path: '/sce_2_4', builder: (context, state) => Sce_2_4()),
    GoRoute(path: '/sce_2_5', builder: (context, state) => Sce_2_5()),
    GoRoute(path: '/sce_2_6', builder: (context, state) => Sce_2_6()),
    GoRoute(path: '/sce_2_7', builder: (context, state) => Sce_2_7()),
    GoRoute(path: '/sce_2_8', builder: (context, state) => Sce_2_8()),
    GoRoute(path: '/sce_2_9', builder: (context, state) => Sce_2_9()),
    GoRoute(path: '/sce_2_10', builder: (context, state) => Sce_2_10()),
    GoRoute(path: '/sce_2_11', builder: (context, state) => Sce_2_11()),
    GoRoute(path: '/sce_2_12', builder: (context, state) => Sce_2_12()),
    GoRoute(path: '/sce_2_13', builder: (context, state) => Sce_2_13()),

    GoRoute(path: '/sce_3_1', builder: (context, state) => Sce_3_1()),
    GoRoute(path: '/sce_3_2', builder: (context, state) => Sce_3_2()),

    GoRoute(path: '/sce_4_1', builder: (context, state) => Sce_4_1()),
    GoRoute(path: '/sce_4_2', builder: (context, state) => Sce_4_2()),

    GoRoute(path: '/sce_5_1', builder: (context, state) => Sce_5_1()),
    GoRoute(path: '/sce_5_2', builder: (context, state) => Sce_5_2()),

    GoRoute(path: '/sce_6_1', builder: (context, state) => Sce_6_1()),
    GoRoute(path: '/sce_6_2', builder: (context, state) => Sce_6_2()),

    GoRoute(path: '/sce_7_1', builder: (context, state) => Sce_7_1()),
    GoRoute(path: '/sce_7_2', builder: (context, state) => Sce_7_2()),

    GoRoute(path: '/sce_8_1', builder: (context, state) => Sce_8_1()),
    GoRoute(path: '/sce_8_2', builder: (context, state) => Sce_8_2()),

    GoRoute(path: '/sce_9_1', builder: (context, state) => Sce_9_1()),
    GoRoute(path: '/sce_9_2', builder: (context, state) => Sce_9_2()),

    GoRoute(path: '/sce_10_1', builder: (context, state) => Sce_10_1()),
    GoRoute(path: '/sce_10_2', builder: (context, state) => Sce_10_2()),

    //ログイン画面
    GoRoute(path: '/rogin_1',builder: (context, state) => const AuthGate(),),

    //creative問題
    GoRoute(path: '/creative_1', builder: (context, state) => GameScreen1()),
    GoRoute(path: '/creative_1_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen1(isCorrect: isCorrect);},),
    GoRoute(path: '/creative_2', builder: (context, state) => GameScreen2()),
    GoRoute(path: '/creative_2_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen2(isCorrect: isCorrect);},), 
    GoRoute(path: '/creative_3', builder: (context, state) => GameScreen3()),
    GoRoute(path: '/creative_3_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen3(isCorrect: isCorrect);
  },), 
    GoRoute(path: '/creative_4', builder: (context, state) => GameScreen4()),
    GoRoute(path: '/creative_4_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen4(isCorrect: isCorrect);
  },), 
   GoRoute(path: '/creative_5', builder: (context, state) => GameScreen5()),
    GoRoute(path: '/creative_5_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen5(isCorrect: isCorrect);
  },), 
  
    
    ]
  );
}