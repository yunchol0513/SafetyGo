// import 'package:flutter/material.dart';
// import 'package:safety_go/app_router.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: appRouter,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
//import 'package:go_router/go_router.dart';
import 'package:safety_go/l10n/app_localizations.dart';
//import 'package:safety_go/screens/language/select_language.dart';
//import 'package:safety_go/constants/route_paths.dart';
//import 'package:safety_go/screens/login/rogin.dart';
import 'package:safety_go/app_router.dart';
import 'package:safety_go/screens/login/login/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safety_go/screens/scenario/sce_1flg.dart';
//import 'package:safety_go/constants/route_paths.dart';


void main() async{

  // main関数で非同期処理を呼び出すためのおまじない
  WidgetsFlutterBinding.ensureInitialized();
  // Firebaseの初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => FlgModel(),
      child:const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ja'); // 初期は英語dayo

//   late final GoRouter _router = GoRouter(
//     initialLocation: RoutePaths.language,
//     routes: [
//       GoRoute(
//         path: RoutePaths.language,
//         builder: (context, state) => Select_language(
//           onLanguageSelected: (locale) {
//             setState(() {
//               _locale = locale;
//             });
//           },
//         ),
//       ),
//       GoRoute(
//         path: RoutePaths.rogin,
//         builder: (context, state) => const Rogin(),
//       ),
//     ],
//   );

  @override
  Widget build(BuildContext context) {
     // ✅ appRouter を使って routerConfig を受け取る
    final router = appRouter(
      locale: _locale,
      onLocaleChanged: (newLocale) {
        setState(() {
          _locale = newLocale;
        });
      },
    );

    return MaterialApp.router(
      theme: _getThemeForLocale(_locale),
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
        Locale('ko'),
        Locale('vi'),
        Locale('zh'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
      // routeInformationParser: _router.routeInformationParser,
      // routerDelegate: _router.routerDelegate,
      // routeInformationProvider: _router.routeInformationProvider,
    );
  }

  ThemeData _getThemeForLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return ThemeData(fontFamily: 'NotoSansEN');
      case 'ko':
        return ThemeData(fontFamily: 'NotoSansKR');
      case 'zh':
        return ThemeData(fontFamily: 'NotoSansSC');
      default:
        return ThemeData(fontFamily: 'NotoSansJP');
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'app_router.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Locale _locale = const Locale('en');

//   late GoRouter _router;

//   @override
//   void initState() {
//     super.initState();
//     _router = createRouter(
//       locale: _locale,
//       onLocaleChanged: (newLocale) {
//         setState(() {
//           _locale = newLocale;
//           _router = createRouter(
//             locale: _locale,
//             onLocaleChanged: (locale) {
//               setState(() {
//                 _locale = locale;
//               });
//             },
//           );
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       locale: _locale,
//       supportedLocales: const [
//         Locale('en'),
//         Locale('ja'),
//         Locale('zh'), // 中国語を追加するならここも
//       ],
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       routerConfig: _router,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'app_router.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Locale _locale = const Locale('en');

//   @override
//   Widget build(BuildContext context) {
//     final router = createRouter(
//       locale: _locale,
//       onLocaleChanged: (newLocale) {
//         setState(() {
//           _locale = newLocale;
//         });
//       },
//     );

//     return MaterialApp.router(
//       locale: _locale,
//       supportedLocales: const [
//         Locale('en'),
//         Locale('ja'),
//         Locale('zh'), // 必要に応じて
//       ],
//       localizationsDelegates: const [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       routerConfig: router,
//     );
//   }
// }
