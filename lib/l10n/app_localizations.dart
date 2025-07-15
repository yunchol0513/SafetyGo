import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
  ];

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Selected language：English'**
  String get languageTitle;

  /// No description provided for @selectEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get selectEnglish;

  /// No description provided for @selectJapanese.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get selectJapanese;

  /// No description provided for @selectKorean.
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get selectKorean;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @simulation.
  ///
  /// In en, this message translates to:
  /// **'Simulation game'**
  String get simulation;

  /// No description provided for @genreTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Genre'**
  String get genreTitle;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get mail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @nglogin.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get nglogin;

  /// No description provided for @ngsignup.
  ///
  /// In en, this message translates to:
  /// **'New registration failed'**
  String get ngsignup;

  /// No description provided for @ox.
  ///
  /// In en, this message translates to:
  /// **'OX Quiz'**
  String get ox;

  /// No description provided for @disastersign.
  ///
  /// In en, this message translates to:
  /// **'Disastersign Quiz'**
  String get disastersign;

  /// No description provided for @trolley.
  ///
  /// In en, this message translates to:
  /// **'Swipe Human'**
  String get trolley;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @mission.
  ///
  /// In en, this message translates to:
  /// **'Mission'**
  String get mission;

  /// No description provided for @scestart.
  ///
  /// In en, this message translates to:
  /// **'The shaking of the earthquake subsided. Discuss with the people of Nankinmachi and decide on an evacuation site!'**
  String get scestart;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Touch people and gather information!'**
  String get comment;

  /// No description provided for @escape.
  ///
  /// In en, this message translates to:
  /// **'Escape'**
  String get escape;

  /// No description provided for @pe1.
  ///
  /// In en, this message translates to:
  /// **'person1'**
  String get pe1;

  /// No description provided for @scepeople1.
  ///
  /// In en, this message translates to:
  /// **'If we go to \'Meriken Park\' we\'ll be able to understand the surroundings. Let\'s go towards the sea!'**
  String get scepeople1;

  /// No description provided for @pe2.
  ///
  /// In en, this message translates to:
  /// **'person2'**
  String get pe2;

  /// No description provided for @scepeople2.
  ///
  /// In en, this message translates to:
  /// **'I heard that \'Kobe Ikuta Junior High School\' was an evacuation shelter during the junior high school disaster prevention training.'**
  String get scepeople2;

  /// No description provided for @pe3.
  ///
  /// In en, this message translates to:
  /// **'person3'**
  String get pe3;

  /// No description provided for @scepeople3.
  ///
  /// In en, this message translates to:
  /// **'A tsunami is coming! Let\'s get to high ground quickly!'**
  String get scepeople3;

  /// No description provided for @pe4.
  ///
  /// In en, this message translates to:
  /// **'person4'**
  String get pe4;

  /// No description provided for @scepeople4.
  ///
  /// In en, this message translates to:
  /// **'The shaking has stopped. I think I\'ll continue sightseeing.'**
  String get scepeople4;

  /// No description provided for @pe5.
  ///
  /// In en, this message translates to:
  /// **'person5'**
  String get pe5;

  /// No description provided for @scepeople5.
  ///
  /// In en, this message translates to:
  /// **'The nearest evacuation centers are \'Kobe Ikuta Junior High School\', \'Kobe Community Building Center\', and \'Meriken Park\'.'**
  String get scepeople5;

  /// No description provided for @pe6.
  ///
  /// In en, this message translates to:
  /// **'person6'**
  String get pe6;

  /// No description provided for @scepeople6.
  ///
  /// In en, this message translates to:
  /// **'Do not go to \'Kobe Community Building Center\' in the event of a tsunami.'**
  String get scepeople6;

  /// No description provided for @pe7.
  ///
  /// In en, this message translates to:
  /// **'person7'**
  String get pe7;

  /// No description provided for @scepeople7.
  ///
  /// In en, this message translates to:
  /// **'There was no damage in the recent earthquake. I don\'t think there is any need to go anywhere.'**
  String get scepeople7;

  /// No description provided for @pe8.
  ///
  /// In en, this message translates to:
  /// **'person8'**
  String get pe8;

  /// No description provided for @scepeople8.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go to a shelter for now.'**
  String get scepeople8;

  /// No description provided for @pe9.
  ///
  /// In en, this message translates to:
  /// **'person9'**
  String get pe9;

  /// No description provided for @scepeople9.
  ///
  /// In en, this message translates to:
  /// **'All evacuation shelters are about a 10-minute walk away.'**
  String get scepeople9;

  /// No description provided for @pe10.
  ///
  /// In en, this message translates to:
  /// **'person10'**
  String get pe10;

  /// No description provided for @scepeople10.
  ///
  /// In en, this message translates to:
  /// **'Where\'s mom? I got separated...'**
  String get scepeople10;

  /// No description provided for @pe11.
  ///
  /// In en, this message translates to:
  /// **'person11'**
  String get pe11;

  /// No description provided for @scepeople11.
  ///
  /// In en, this message translates to:
  /// **'I have to go to \'Kobe Community Building Center\' with my family!'**
  String get scepeople11;

  /// No description provided for @pe12.
  ///
  /// In en, this message translates to:
  /// **'person12'**
  String get pe12;

  /// No description provided for @scepeople12.
  ///
  /// In en, this message translates to:
  /// **'Where is the evacuation shelter?'**
  String get scepeople12;

  /// No description provided for @pe13.
  ///
  /// In en, this message translates to:
  /// **'person13'**
  String get pe13;

  /// No description provided for @scepeople13.
  ///
  /// In en, this message translates to:
  /// **'There is \'a junior high school\' across the street from the station! It will be safe even in the event of a tsunami.'**
  String get scepeople13;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit the game?'**
  String get finish;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finished;

  /// No description provided for @cont.
  ///
  /// In en, this message translates to:
  /// **'Continue the game'**
  String get cont;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Collected information'**
  String get info;

  /// No description provided for @ngescape.
  ///
  /// In en, this message translates to:
  /// **'Ask people nearby and gather information.'**
  String get ngescape;

  /// No description provided for @where.
  ///
  /// In en, this message translates to:
  /// **'Where are you escaping to?'**
  String get where;

  /// No description provided for @here.
  ///
  /// In en, this message translates to:
  /// **'Stay in place'**
  String get here;

  /// No description provided for @junior.
  ///
  /// In en, this message translates to:
  /// **'Kobe Ikuta Junior High School'**
  String get junior;

  /// No description provided for @hall.
  ///
  /// In en, this message translates to:
  /// **'Kobe Community Building Center'**
  String get hall;

  /// No description provided for @park.
  ///
  /// In en, this message translates to:
  /// **'Meriken Park'**
  String get park;

  /// No description provided for @wrong.
  ///
  /// In en, this message translates to:
  /// **'The answer is wrong'**
  String get wrong;

  /// No description provided for @gopark.
  ///
  /// In en, this message translates to:
  /// **'The tsunami came on the way to Meriken Park. You should never go near the ocean.'**
  String get gopark;

  /// No description provided for @gojunior.
  ///
  /// In en, this message translates to:
  /// **'You were able to gather the right information! You were able to evacuate to a shelter that was safe even in the event of a tsunami!'**
  String get gojunior;

  /// No description provided for @gohall.
  ///
  /// In en, this message translates to:
  /// **'Kobe Community Building Center will be engulfed by the tsunami. Let\'s go to the right evacuation shelter!'**
  String get gohall;

  /// No description provided for @gohere.
  ///
  /// In en, this message translates to:
  /// **'If you stay here you\'ll be swept away by the tsunami. Evacuate to a safe place.'**
  String get gohere;

  /// No description provided for @drag.
  ///
  /// In en, this message translates to:
  /// **'Drag running people into the correct image'**
  String get drag;

  /// No description provided for @tryag.
  ///
  /// In en, this message translates to:
  /// **'try again'**
  String get tryag;

  /// No description provided for @ans.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get ans;

  /// No description provided for @nextq.
  ///
  /// In en, this message translates to:
  /// **'Next question'**
  String get nextq;

  /// No description provided for @cre1q.
  ///
  /// In en, this message translates to:
  /// **'Which represents an evacuation route?'**
  String get cre1q;

  /// No description provided for @cre1a.
  ///
  /// In en, this message translates to:
  /// **'Signs with a white background indicate evacuation routes. Signs with a green background indicate emergency exits. Therefore, follow the white sign to the green background.'**
  String get cre1a;

  /// No description provided for @cre2q.
  ///
  /// In en, this message translates to:
  /// **'Which represents drinkable water?'**
  String get cre2q;

  /// No description provided for @cre2a.
  ///
  /// In en, this message translates to:
  /// **'The water in the cup represents drinkable water. Note that the water in the bucket is not drinkable.'**
  String get cre2a;

  /// No description provided for @cre3q.
  ///
  /// In en, this message translates to:
  /// **'Which kanji represents \'earthquake\'?'**
  String get cre3q;

  /// No description provided for @cre3a.
  ///
  /// In en, this message translates to:
  /// **'Kanji may be used in news reports and disaster signs, so try to learn the kanji as a set!'**
  String get cre3a;

  /// No description provided for @cre4q.
  ///
  /// In en, this message translates to:
  /// **'If you are near the sea and a tsunami comes, what is the appropriate action to take?'**
  String get cre4q;

  /// No description provided for @cre4a.
  ///
  /// In en, this message translates to:
  /// **'If you are near the sea, there is a high possibility of a tsunami, so be prepared and quickly escape to high ground if an earthquake occurs.'**
  String get cre4a;

  /// No description provided for @cre5q.
  ///
  /// In en, this message translates to:
  /// **'In the event of a disaster, where would you choose to evacuate temporarily?'**
  String get cre5q;

  /// No description provided for @cre5a.
  ///
  /// In en, this message translates to:
  /// **'This is the difference between a place where you can live as an evacuee and a place where you can only escape temporarily. Rules are important when living as an evacuee. Please be careful.'**
  String get cre5a;

  /// No description provided for @choosepart.
  ///
  /// In en, this message translates to:
  /// **'To the part selection screen'**
  String get choosepart;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Disaster quiz '**
  String get beginner;

  /// No description provided for @easy1q1.
  ///
  /// In en, this message translates to:
  /// **'If an earthquake occurs, the first thing to do is to protect your head.'**
  String get easy1q1;

  /// No description provided for @easy1a1.
  ///
  /// In en, this message translates to:
  /// **'Protecting your head is the most important protection from falling objects.'**
  String get easy1a1;

  /// No description provided for @easy1q2.
  ///
  /// In en, this message translates to:
  /// **'During an earthquake, it is safe to hide under a desk.'**
  String get easy1q2;

  /// No description provided for @easy1a2.
  ///
  /// In en, this message translates to:
  /// **'The basic rule is to hide under furniture that is unlikely to fall over and protect your head until the shaking stops.'**
  String get easy1a2;

  /// No description provided for @easy1q3.
  ///
  /// In en, this message translates to:
  /// **'Once outside, it is safe to stand near a utility pole.'**
  String get easy1q3;

  /// No description provided for @easy1a3.
  ///
  /// In en, this message translates to:
  /// **'Stay away from utility poles as there is a risk of them falling or the wires breaking and falling.'**
  String get easy1a3;

  /// No description provided for @easy1q4.
  ///
  /// In en, this message translates to:
  /// **'It is a good idea to wear shoes when evacuating.'**
  String get easy1q4;

  /// No description provided for @easy1a4.
  ///
  /// In en, this message translates to:
  /// **'Wear shoes when evacuating to protect your feet from glass shards and debris.'**
  String get easy1a4;

  /// No description provided for @easy1q5.
  ///
  /// In en, this message translates to:
  /// **'Avoid using fire after an earthquake.'**
  String get easy1q5;

  /// No description provided for @easy1a5.
  ///
  /// In en, this message translates to:
  /// **'Do not use fire as this may cause a gas leak.'**
  String get easy1a5;

  /// No description provided for @easy1q6.
  ///
  /// In en, this message translates to:
  /// **'In the event of an earthquake, evacuate using the elevator.'**
  String get easy1q6;

  /// No description provided for @easy1a6.
  ///
  /// In en, this message translates to:
  /// **'Use the stairs instead of the elevator to avoid the risk of power outages and getting trapped inside.'**
  String get easy1a6;

  /// No description provided for @easy1q7.
  ///
  /// In en, this message translates to:
  /// **'At school, it is good to follow your teacher\'s instructions.'**
  String get easy1q7;

  /// No description provided for @easy1a7.
  ///
  /// In en, this message translates to:
  /// **'It is important to remain calm, listen to your teacher\'s instructions, and evacuate safely.'**
  String get easy1a7;

  /// No description provided for @easy1q8.
  ///
  /// In en, this message translates to:
  /// **'Being near a window is a safe place during an earthquake.'**
  String get easy1q8;

  /// No description provided for @easy1a8.
  ///
  /// In en, this message translates to:
  /// **'Stay away from windows as glass may break and fly at you.'**
  String get easy1a8;

  /// No description provided for @easy1q9.
  ///
  /// In en, this message translates to:
  /// **'During an earthquake, it is okay to walk near block walls.'**
  String get easy1q9;

  /// No description provided for @easy1a9.
  ///
  /// In en, this message translates to:
  /// **'Stay away from block walls as they may collapse.'**
  String get easy1a9;

  /// No description provided for @easy1q10.
  ///
  /// In en, this message translates to:
  /// **'If an earthquake occurs, the first thing you should do is call 119.'**
  String get easy1q10;

  /// No description provided for @easy1a10.
  ///
  /// In en, this message translates to:
  /// **'Please avoid calling without careful consideration, as calls will be concentrated during non-emergencies.'**
  String get easy1a10;

  /// No description provided for @easy1q11.
  ///
  /// In en, this message translates to:
  /// **'Keep water and food in your emergency bag.'**
  String get easy1q11;

  /// No description provided for @easy1a11.
  ///
  /// In en, this message translates to:
  /// **'Stock up on at least three days\' worth of water and food.'**
  String get easy1a11;

  /// No description provided for @easy1q12.
  ///
  /// In en, this message translates to:
  /// **'In the event of an earthquake, the middle of the road is safe.'**
  String get easy1q12;

  /// No description provided for @easy1a12.
  ///
  /// In en, this message translates to:
  /// **'Avoid areas with falling cars, signs, and glass from buildings as they pose many dangers.'**
  String get easy1a12;

  /// No description provided for @easy1q13.
  ///
  /// In en, this message translates to:
  /// **'It is important to gather information through the radio and smartphones.'**
  String get easy1q13;

  /// No description provided for @easy1a13.
  ///
  /// In en, this message translates to:
  /// **'Accurate information allows you to take appropriate action.'**
  String get easy1a13;

  /// No description provided for @easy1q14.
  ///
  /// In en, this message translates to:
  /// **'Earthquakes can cause fires.'**
  String get easy1q14;

  /// No description provided for @easy1a14.
  ///
  /// In en, this message translates to:
  /// **'Abnormalities in electrical and gas equipment caused by shaking can lead to fires.'**
  String get easy1a14;

  /// No description provided for @easy1q15.
  ///
  /// In en, this message translates to:
  /// **'Be careful of glass shards.'**
  String get easy1q15;

  /// No description provided for @easy1a15.
  ///
  /// In en, this message translates to:
  /// **'Watch your feet and hands, and wear protective gloves and shoes.'**
  String get easy1a15;

  /// No description provided for @easy1q16.
  ///
  /// In en, this message translates to:
  /// **'A safe place in the house is under the TV.'**
  String get easy1q16;

  /// No description provided for @easy1a16.
  ///
  /// In en, this message translates to:
  /// **'Stay away from furniture as it may fall over.'**
  String get easy1a16;

  /// No description provided for @easy1q17.
  ///
  /// In en, this message translates to:
  /// **'You may use a cushion to protect your head.'**
  String get easy1q17;

  /// No description provided for @easy1a17.
  ///
  /// In en, this message translates to:
  /// **'If there is no immediate place to hide, it is effective to protect your head with a cushion.'**
  String get easy1a17;

  /// No description provided for @easy1q18.
  ///
  /// In en, this message translates to:
  /// **'It is okay to talk loudly in evacuation shelters.'**
  String get easy1q18;

  /// No description provided for @easy1a18.
  ///
  /// In en, this message translates to:
  /// **'It is important to remain calm and be considerate of those around you.'**
  String get easy1a18;

  /// No description provided for @easy1q19.
  ///
  /// In en, this message translates to:
  /// **'It is a good idea to decide how to contact your family.'**
  String get easy1q19;

  /// No description provided for @easy1a19.
  ///
  /// In en, this message translates to:
  /// **'It is important to create rules in advance so that groups can be reunited if they get separated in the event of a disaster.'**
  String get easy1a19;

  /// No description provided for @easy1q20.
  ///
  /// In en, this message translates to:
  /// **'You can go and play as soon as the earthquake is over.'**
  String get easy1q20;

  /// No description provided for @easy1a20.
  ///
  /// In en, this message translates to:
  /// **'There is a risk of aftershocks, so please wait at home or in an evacuation shelter until it is safe.'**
  String get easy1a20;

  /// No description provided for @easy3q1.
  ///
  /// In en, this message translates to:
  /// **'If an earthquake occurs, contact your family first.'**
  String get easy3q1;

  /// No description provided for @easy3a1.
  ///
  /// In en, this message translates to:
  /// **'If an earthquake occurs, the first thing to do is to ensure your own safety.If an earthquake occurs, the first thing to do is to ensure your own safety.'**
  String get easy3a1;

  /// No description provided for @easy3q2.
  ///
  /// In en, this message translates to:
  /// **'The seaside is safe during an earthquake.'**
  String get easy3q2;

  /// No description provided for @easy3a2.
  ///
  /// In en, this message translates to:
  /// **'After an earthquake, avoid the seaside as tsunamis may occur.'**
  String get easy3a2;

  /// No description provided for @easy3q3.
  ///
  /// In en, this message translates to:
  /// **'In the event of a fire, stay low and escape.'**
  String get easy3q3;

  /// No description provided for @easy3a3.
  ///
  /// In en, this message translates to:
  /// **'Smoke from a fire is harmful. It accumulates at the top, so get low and avoid inhaling it when escaping.'**
  String get easy3a3;

  /// No description provided for @easy3q4.
  ///
  /// In en, this message translates to:
  /// **'In preparation for a disaster, discuss evacuation routes and evacuation shelters with your family.'**
  String get easy3q4;

  /// No description provided for @easy3a4.
  ///
  /// In en, this message translates to:
  /// **'Disasters happen suddenly. Let\'s talk about how to protect our precious families.'**
  String get easy3a4;

  /// No description provided for @easy3q5.
  ///
  /// In en, this message translates to:
  /// **'In the event of an earthquake, if you leave your car and escape, lock it.'**
  String get easy3q5;

  /// No description provided for @easy3a5.
  ///
  /// In en, this message translates to:
  /// **'To be moved if it gets in the way of an emergency vehicle.'**
  String get easy3a5;

  /// No description provided for @easy3q6.
  ///
  /// In en, this message translates to:
  /// **'Immediately after evacuation, I went back home to get something I had left behind.'**
  String get easy3q6;

  /// No description provided for @easy3a6.
  ///
  /// In en, this message translates to:
  /// **'Earthquakes are dangerous because they can occur multiple times.'**
  String get easy3a6;

  /// No description provided for @easy3q7.
  ///
  /// In en, this message translates to:
  /// **'Put cold weather gear in your emergency bag.'**
  String get easy3q7;

  /// No description provided for @easy3a7.
  ///
  /// In en, this message translates to:
  /// **'There will be many people in the shelter, so bring warm clothing to help regulate your personal body temperature.'**
  String get easy3a7;

  /// No description provided for @easy3q8.
  ///
  /// In en, this message translates to:
  /// **'Carry a portable radio in your emergency bag.'**
  String get easy3q8;

  /// No description provided for @easy3a8.
  ///
  /// In en, this message translates to:
  /// **'Information is important in an emergency, so make sure you bring something that will give you information.'**
  String get easy3a8;

  /// No description provided for @easy3q9.
  ///
  /// In en, this message translates to:
  /// **'Put away anything that may be blown away around the house before the typhoon arrives.'**
  String get easy3q9;

  /// No description provided for @easy3a9.
  ///
  /// In en, this message translates to:
  /// **'If it gets blown away, it will be a nuisance to those around you.'**
  String get easy3a9;

  /// No description provided for @easy3q10.
  ///
  /// In en, this message translates to:
  /// **'Go to the river during a typhoon.'**
  String get easy3q10;

  /// No description provided for @easy3a10.
  ///
  /// In en, this message translates to:
  /// **'During typhoons and heavy rains, the river flows quickly. Do not go near the river as you may be swept away.'**
  String get easy3a10;

  /// No description provided for @easy3q11.
  ///
  /// In en, this message translates to:
  /// **'It was the first time I looked up evacuation routes on my smartphone during an earthquake.'**
  String get easy3q11;

  /// No description provided for @easy3a11.
  ///
  /// In en, this message translates to:
  /// **'During an earthquake, communication devices such as smartphones may not work, so be sure to check in advance.'**
  String get easy3a11;

  /// No description provided for @easy3q12.
  ///
  /// In en, this message translates to:
  /// **'It is important to gather information through the radio and smartphones.'**
  String get easy3q12;

  /// No description provided for @easy3a12.
  ///
  /// In en, this message translates to:
  /// **'Accurate information allows you to take appropriate action.'**
  String get easy3a12;

  /// No description provided for @easy3q13.
  ///
  /// In en, this message translates to:
  /// **'Supplies will arrive at the evacuation centre within a day.'**
  String get easy3q13;

  /// No description provided for @easy3a13.
  ///
  /// In en, this message translates to:
  /// **'On average it can take 3 to 9 days.。'**
  String get easy3a13;

  /// No description provided for @easy3q14.
  ///
  /// In en, this message translates to:
  /// **'If oil catches fire, pour water on it.'**
  String get easy3q14;

  /// No description provided for @easy3a14.
  ///
  /// In en, this message translates to:
  /// **'It won\'t go away with water. Use a fire extinguisher.'**
  String get easy3a14;

  /// No description provided for @easy3q15.
  ///
  /// In en, this message translates to:
  /// **'Secure items that may fall over in an earthquake, such as dressers.'**
  String get easy3q15;

  /// No description provided for @easy3a15.
  ///
  /// In en, this message translates to:
  /// **'Secure your furniture to reduce the risk of it falling over.'**
  String get easy3a15;

  /// No description provided for @easy3q16.
  ///
  /// In en, this message translates to:
  /// **'Your shelter can be the same as your home.'**
  String get easy3q16;

  /// No description provided for @easy3a16.
  ///
  /// In en, this message translates to:
  /// **'There will be many people in evacuation shelters, so please be considerate of those around you.'**
  String get easy3a16;

  /// No description provided for @easy3q17.
  ///
  /// In en, this message translates to:
  /// **'When evacuating, they push through the crowds to escape.'**
  String get easy3q17;

  /// No description provided for @easy3a17.
  ///
  /// In en, this message translates to:
  /// **'When evacuating, think not only of yourself but also of those around you.'**
  String get easy3a17;

  /// No description provided for @easy5q1.
  ///
  /// In en, this message translates to:
  /// **'During a disaster, if you are trapped inside a building, you can make noise by hitting something nearby.'**
  String get easy5q1;

  /// No description provided for @easy5a1.
  ///
  /// In en, this message translates to:
  /// **'You can signal for help without exerting a lot of energy.'**
  String get easy5a1;

  /// No description provided for @easy5q2.
  ///
  /// In en, this message translates to:
  /// **'Put glow in the dark tape on the flashlight.'**
  String get easy5q2;

  /// No description provided for @easy5a2.
  ///
  /// In en, this message translates to:
  /// **'You can search even in pitch black after a power outage.'**
  String get easy5a2;

  /// No description provided for @easy5q3.
  ///
  /// In en, this message translates to:
  /// **'Wear beach sandals when evacuating.'**
  String get easy5q3;

  /// No description provided for @easy5a3.
  ///
  /// In en, this message translates to:
  /// **'When evacuating, wear shoes to protect your feet from broken glass and debris.'**
  String get easy5a3;

  /// No description provided for @easy5q4.
  ///
  /// In en, this message translates to:
  /// **'Walking in boots during floods.'**
  String get easy5q4;

  /// No description provided for @easy5a4.
  ///
  /// In en, this message translates to:
  /// **'Rubber boots tend to slip off easily and become difficult to walk in if water gets inside, so wear sneakers.'**
  String get easy5a4;

  /// No description provided for @easy5q5.
  ///
  /// In en, this message translates to:
  /// **'If you spot a fire, call 119.'**
  String get easy5q5;

  /// No description provided for @easy5a5.
  ///
  /// In en, this message translates to:
  /// **'When you call, say \'Kajidesu.\''**
  String get easy5a5;

  /// No description provided for @easy5q6.
  ///
  /// In en, this message translates to:
  /// **'The duration of use of a fire extinguisher is approximately 15 seconds.'**
  String get easy5q6;

  /// No description provided for @easy5a6.
  ///
  /// In en, this message translates to:
  /// **'It\'s shorter than I expected.'**
  String get easy5a6;

  /// No description provided for @easy5q7.
  ///
  /// In en, this message translates to:
  /// **'Clean dust off electrical outlets as a fire prevention measure.'**
  String get easy5q7;

  /// No description provided for @easy5a7.
  ///
  /// In en, this message translates to:
  /// **'Dust that accumulates in electrical outlets can cause fires, so clean them regularly.'**
  String get easy5a7;

  /// No description provided for @easy5q8.
  ///
  /// In en, this message translates to:
  /// **'Use a fire extinguisher at the tip of the fire.'**
  String get easy5q8;

  /// No description provided for @easy5a8.
  ///
  /// In en, this message translates to:
  /// **'Aim for the source of the fire and try to put it out. If the fire is large, prioritize your own safety.'**
  String get easy5a8;

  /// No description provided for @easy5q9.
  ///
  /// In en, this message translates to:
  /// **'When evacuating during an earthquake, wear light clothing and escape.'**
  String get easy5q9;

  /// No description provided for @easy5a9.
  ///
  /// In en, this message translates to:
  /// **'Wear long sleeves and long trousers to protect yourself from glass and other objects.'**
  String get easy5a9;

  /// No description provided for @easy5q10.
  ///
  /// In en, this message translates to:
  /// **'If an earthquake occurs in an elevator, press the emergency button.'**
  String get easy5q10;

  /// No description provided for @easy5a10.
  ///
  /// In en, this message translates to:
  /// **'Press all the floors and get off at the first floor it stops at.'**
  String get easy5a10;

  /// No description provided for @gostage1.
  ///
  /// In en, this message translates to:
  /// **'Entering Stage 1'**
  String get gostage1;

  /// No description provided for @gostage2.
  ///
  /// In en, this message translates to:
  /// **'Entering Stage 2'**
  String get gostage2;

  /// No description provided for @gostage3.
  ///
  /// In en, this message translates to:
  /// **'Entering Stage 3'**
  String get gostage3;

  /// No description provided for @shop1.
  ///
  /// In en, this message translates to:
  /// **'Scene 1'**
  String get shop1;

  /// No description provided for @shop2.
  ///
  /// In en, this message translates to:
  /// **'Scene 2'**
  String get shop2;

  /// No description provided for @shop3.
  ///
  /// In en, this message translates to:
  /// **'Scene 3'**
  String get shop3;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Correct Answer'**
  String get ok;

  /// No description provided for @ng.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Answer'**
  String get ng;

  /// No description provided for @yourans.
  ///
  /// In en, this message translates to:
  /// **'Your Answer'**
  String get yourans;

  /// No description provided for @per.
  ///
  /// In en, this message translates to:
  /// **'Correct Answer Rate'**
  String get per;

  /// No description provided for @exandre.
  ///
  /// In en, this message translates to:
  /// **'Explanation and Results'**
  String get exandre;

  /// No description provided for @notans.
  ///
  /// In en, this message translates to:
  /// **'Not Answered'**
  String get notans;

  /// No description provided for @choosestage.
  ///
  /// In en, this message translates to:
  /// **'Stage Selection'**
  String get choosestage;

  /// No description provided for @sce2_1.
  ///
  /// In en, this message translates to:
  /// **'Cover your head with your bag and crouch down to protect yourself from falling objects.'**
  String get sce2_1;

  /// No description provided for @rakkabutu.
  ///
  /// In en, this message translates to:
  /// **'Falling object hazard: You could be hit by objects falling from above, such as building exteriors, signs, glass, vending machines, etc.\n\n'**
  String get rakkabutu;

  /// No description provided for @siya.
  ///
  /// In en, this message translates to:
  /// **'Reduced visibility: It becomes difficult to grasp the situation around you, increasing the risk of being unable to escape in time.\n\n'**
  String get siya;

  /// No description provided for @humareru.
  ///
  /// In en, this message translates to:
  /// **'Risk of being stepped on: In crowded places, you may be stepped on by others and cause a fall.\n\n'**
  String get humareru;

  /// No description provided for @jimen.
  ///
  /// In en, this message translates to:
  /// **'Fissures and changes in the ground: During a large earthquake, the ground may crack or liquefaction may occur, so if you are lying down, it will be slower to respond.'**
  String get jimen;

  /// No description provided for @kega.
  ///
  /// In en, this message translates to:
  /// **'Risk of falls and injury: The ground may be unstable while shaking, and if you run you may fall and get injured.\n\n'**
  String get kega;

  /// No description provided for @syoutotu.
  ///
  /// In en, this message translates to:
  /// **'Collisions with others: In a crowd, you may bump into other people and fall, which may cause panic.\n\n'**
  String get syoutotu;

  /// No description provided for @jiware.
  ///
  /// In en, this message translates to:
  /// **'Delayed response to cracks and sinkholes: In a large earthquake, roads may collapse or cracks may form in the ground. If you are running, you may not pay attention to your feet and may get caught in them.'**
  String get jiware;

  /// No description provided for @firstkobe.
  ///
  /// In en, this message translates to:
  /// **'It\'s my first time in Kobe, and there are so many delicious things in Nankinmachi, from Xiaolongbao to tapioca!'**
  String get firstkobe;

  /// No description provided for @stage1.
  ///
  /// In en, this message translates to:
  /// **'Stage 1'**
  String get stage1;

  /// No description provided for @jisin.
  ///
  /// In en, this message translates to:
  /// **'It\'s an earthquake!'**
  String get jisin;

  /// No description provided for @angen.
  ///
  /// In en, this message translates to:
  /// **'Is it safer closer to the ground?'**
  String get angen;

  /// No description provided for @mane.
  ///
  /// In en, this message translates to:
  /// **'Would you copy this person?'**
  String get mane;

  /// No description provided for @koudou.
  ///
  /// In en, this message translates to:
  /// **'What actions will you take?'**
  String get koudou;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @answer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answer;

  /// No description provided for @sce2_8.
  ///
  /// In en, this message translates to:
  /// **'I wonder if that place is safe.'**
  String get sce2_8;

  /// No description provided for @sce2_9.
  ///
  /// In en, this message translates to:
  /// **'That person is carrying a bag on his head.'**
  String get sce2_9;

  /// No description provided for @sce2_10.
  ///
  /// In en, this message translates to:
  /// **'Maybe it\'s better to run away?'**
  String get sce2_10;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
