//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/screens/language/select_language.dart';
import 'package:safety_go/screens/language/modify_language.dart';
import 'package:safety_go/screens/login/rogin.dart';
import 'package:safety_go/screens/mainpage/select_detail.dart';
import 'package:safety_go/screens/mainpage/select_genre.dart';
import 'package:safety_go/screens/quake/select_difficulty_quake.dart';

import 'package:safety_go/screens/quake/easy_quake/easy_quake.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_1.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_2.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_3.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_1.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_2.dart';

import 'package:safety_go/screens/quake/normal_quake/normal_quake.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_1.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_2.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_3.dart';

import 'package:safety_go/screens/scenario/sce_home.dart';
import 'package:safety_go/screens/scenario/sce_1_1.dart';
import 'package:safety_go/screens/scenario/sce_1_2.dart';
import 'package:safety_go/screens/scenario/sce_1_3.dart';
import 'package:safety_go/screens/scenario/sce_1_4.dart';
import 'package:safety_go/screens/scenario/sce_1_5.dart';
import 'package:safety_go/screens/scenario/sce_1_6.dart';
import 'package:safety_go/screens/scenario/sce_1_7.dart';
import 'package:safety_go/screens/scenario/sce_1_8.dart';
import 'package:safety_go/screens/scenario/sce_1_9.dart';
import 'package:safety_go/screens/scenario/sce_1_10.dart';
import 'package:safety_go/screens/scenario/sce_1sub1.dart';
import 'package:safety_go/screens/scenario/sce_1sub2.dart';
import 'package:safety_go/screens/scenario/sce_1sub3.dart';
import 'package:safety_go/screens/scenario/sce_1sub4.dart';
import 'package:safety_go/screens/scenario/sce_1sub5.dart';
import 'package:safety_go/screens/scenario/sce_1sub6.dart';
import 'package:safety_go/screens/scenario/sce_1sub7.dart';
import 'package:safety_go/screens/scenario/sce_1sub8.dart';
import 'package:safety_go/screens/scenario/sce_1sub9.dart';
import 'package:safety_go/screens/scenario/sce_1sub10.dart';
import 'package:safety_go/screens/scenario/sce_1sub11.dart';
import 'package:safety_go/screens/scenario/sce_1sub12.dart';
import 'package:safety_go/screens/scenario/sce_1sub13.dart';

import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_1.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_2.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_3.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_4.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_5.dart';

import'package:safety_go/screens/login/login/auth_gate.dart';

GoRouter appRouter({
  required Locale locale,
  required void Function(Locale) onLocaleChanged,
}) {
  return GoRouter(
    initialLocation: '/language',//最初の画面なので，GoRoteのpathで変更可能
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

    //scenario
    GoRoute(path: '/scehome', builder: (context, state) => SceHome()),
    GoRoute(path: '/sce1_1', builder: (context, state) => Sce1_1()),
    GoRoute(path: '/sce1_2', builder: (context, state) => Sce1_2()),
    GoRoute(path: '/sce1_3', builder: (context, state) => Sce1_3()),
    GoRoute(path: '/sce1_4', builder: (context, state) => Sce1_4()),
    GoRoute(path: '/sce1_5', builder: (context, state) => Sce1_5()),
    GoRoute(path: '/sce1_6', builder: (context, state) => Sce1_6()),
    GoRoute(path: '/sce1_7', builder: (context, state) => Sce1_7()),
    GoRoute(path: '/sce1_8', builder: (context, state) => Sce1_8()),
    GoRoute(path: '/sce1_9', builder: (context, state) => Sce1_9()),
    GoRoute(path: '/sce1_10', builder: (context, state) => Sce1_10()),
    GoRoute(path: '/sce1s1', builder: (context, state) => Sce1s1()),
    GoRoute(path: '/sce1s2', builder: (context, state) => Sce1s2()),
    GoRoute(path: '/sce1s3', builder: (context, state) => Sce1s3()),
    GoRoute(path: '/sce1s4', builder: (context, state) => Sce1s4()),
    GoRoute(path: '/sce1s5', builder: (context, state) => Sce1s5()),
    GoRoute(path: '/sce1s6', builder: (context, state) => Sce1s6()),
    GoRoute(path: '/sce1s7', builder: (context, state) => Sce1s7()),
    GoRoute(path: '/sce1s8', builder: (context, state) => Sce1s8()),
    GoRoute(path: '/sce1s9', builder: (context, state) => Sce1s9()),
    GoRoute(path: '/sce1s10', builder: (context, state) => Sce1s10()),
    GoRoute(path: '/sce1s11', builder: (context, state) => Sce1s11()),
    GoRoute(path: '/sce1s12', builder: (context, state) => Sce1s12()),
    GoRoute(path: '/sce1s13', builder: (context, state) => Sce1s13()),

    //ログイン画面
    GoRoute(path: '/rogin_1',builder: (context, state) => const AuthGate(),),

    
    ],
  );
}