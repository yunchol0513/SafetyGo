import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_zh.dart';

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
    Locale('zh'),
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

  /// No description provided for @selectChinese.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get selectChinese;

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

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Scene'**
  String get shop;

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

  /// No description provided for @backlogin.
  ///
  /// In en, this message translates to:
  /// **'Return to login screen'**
  String get backlogin;

  /// No description provided for @touchp.
  ///
  /// In en, this message translates to:
  /// **'Touch people and listen to them'**
  String get touchp;

  /// No description provided for @gothere.
  ///
  /// In en, this message translates to:
  /// **'Go here'**
  String get gothere;

  /// No description provided for @tapi.
  ///
  /// In en, this message translates to:
  /// **'Tapioca shop'**
  String get tapi;

  /// No description provided for @xiao.
  ///
  /// In en, this message translates to:
  /// **'Xiaolongbao shop'**
  String get xiao;

  /// No description provided for @notapi.
  ///
  /// In en, this message translates to:
  /// **'The place I want to go to is a Xiaolongbao shop, so I\'ll ask someone else.'**
  String get notapi;

  /// No description provided for @goxiao.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go to a Xiaolongbao shop'**
  String get goxiao;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @sce3_1.
  ///
  /// In en, this message translates to:
  /// **'I\'m in Nankinmachi now, so I want to eat some Xiaolongbao.'**
  String get sce3_1;

  /// No description provided for @sce3_2.
  ///
  /// In en, this message translates to:
  /// **'Let\'s ask people in Nankinmachi where to buy Xiaolongbao'**
  String get sce3_2;

  /// No description provided for @sce3_3.
  ///
  /// In en, this message translates to:
  /// **'Press the arrows to find people'**
  String get sce3_3;

  /// No description provided for @sce3_4.
  ///
  /// In en, this message translates to:
  /// **'I\'m going to a tapioca shop. Let\'s go together.'**
  String get sce3_4;

  /// No description provided for @sce3_5.
  ///
  /// In en, this message translates to:
  /// **'Click on the \'Go here\' button'**
  String get sce3_5;

  /// No description provided for @sce3_6.
  ///
  /// In en, this message translates to:
  /// **'I\'m going to a tapioca shop. Let\'s go together.\n\nWhere are you going?'**
  String get sce3_6;

  /// No description provided for @sce3_8.
  ///
  /// In en, this message translates to:
  /// **'I\'m looking forward to the Xiaolongbao! Want to join me?'**
  String get sce3_8;

  /// No description provided for @sce3_10.
  ///
  /// In en, this message translates to:
  /// **'I\'m going to a tapioca shop. Let\'s go together.\nI\'m looking forward to the Xiaolongbao! Want to join me?\n\nWhere are you going?'**
  String get sce3_10;

  /// No description provided for @sce3_11.
  ///
  /// In en, this message translates to:
  /// **'Xiaolongbao is so delicious\nStage clear!!!'**
  String get sce3_11;

  /// No description provided for @stage.
  ///
  /// In en, this message translates to:
  /// **'Entering'**
  String get stage;

  /// No description provided for @gostage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get gostage;

  /// No description provided for @backselect.
  ///
  /// In en, this message translates to:
  /// **'Return to stage selection'**
  String get backselect;

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

  /// No description provided for @stage2.
  ///
  /// In en, this message translates to:
  /// **'Stage 2'**
  String get stage2;

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

  /// No description provided for @proof.
  ///
  /// In en, this message translates to:
  /// **'Proof of Clear'**
  String get proof;

  /// No description provided for @cleared.
  ///
  /// In en, this message translates to:
  /// **'Already cleared\n'**
  String get cleared;

  /// No description provided for @easypart1.
  ///
  /// In en, this message translates to:
  /// **'Earn first title!'**
  String get easypart1;

  /// No description provided for @easypart2.
  ///
  /// In en, this message translates to:
  /// **'Earned the title of Disaster Preparedness!'**
  String get easypart2;

  /// No description provided for @easypart3.
  ///
  /// In en, this message translates to:
  /// **'Earned the title of OX Master!'**
  String get easypart3;

  /// No description provided for @nomalpart1.
  ///
  /// In en, this message translates to:
  /// **'Learn the wisdom of disaster signage!'**
  String get nomalpart1;

  /// No description provided for @nomalpart2.
  ///
  /// In en, this message translates to:
  /// **'Earned the title of Disaster Avoidance!'**
  String get nomalpart2;

  /// No description provided for @nomalpart3.
  ///
  /// In en, this message translates to:
  /// **'Earned the title of Sign Master.'**
  String get nomalpart3;

  /// No description provided for @swipehpart1.
  ///
  /// In en, this message translates to:
  /// **'Received the title of Disaster Level I!'**
  String get swipehpart1;

  /// No description provided for @swipehpart2.
  ///
  /// In en, this message translates to:
  /// **'Received the title of Disaster Level Ⅱ!'**
  String get swipehpart2;

  /// No description provided for @swipehpart3.
  ///
  /// In en, this message translates to:
  /// **'Received the title of Disaster Level Ⅲ!'**
  String get swipehpart3;

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

  /// No description provided for @choosestage.
  ///
  /// In en, this message translates to:
  /// **'Stage Selection'**
  String get choosestage;

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

  /// No description provided for @bignoise.
  ///
  /// In en, this message translates to:
  /// **'＊Loud sound'**
  String get bignoise;

  /// No description provided for @nomal1a.
  ///
  /// In en, this message translates to:
  /// **'Run to the square'**
  String get nomal1a;

  /// No description provided for @nomal1b.
  ///
  /// In en, this message translates to:
  /// **'Evacuation site'**
  String get nomal1b;

  /// No description provided for @nomal1c.
  ///
  /// In en, this message translates to:
  /// **'Be careful not to fall into the manhole'**
  String get nomal1c;

  /// No description provided for @nomal1ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is B: Evacuation site.'**
  String get nomal1ans;

  /// No description provided for @nomal1.
  ///
  /// In en, this message translates to:
  /// **'It allows you to temporarily escape from tsunamis, floods, earthquakes, fires, etc.'**
  String get nomal1;

  /// No description provided for @nomal1q.
  ///
  /// In en, this message translates to:
  /// **'Question 1: What is the correct meaning of the following symbols?'**
  String get nomal1q;

  /// No description provided for @nomal2a.
  ///
  /// In en, this message translates to:
  /// **'restroom'**
  String get nomal2a;

  /// No description provided for @nomal2b.
  ///
  /// In en, this message translates to:
  /// **'Emergency exit'**
  String get nomal2b;

  /// No description provided for @nomal2c.
  ///
  /// In en, this message translates to:
  /// **'Evacuation shelter'**
  String get nomal2c;

  /// No description provided for @nomal2ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is C: Evacuation shelter.'**
  String get nomal2ans;

  /// No description provided for @nomal2.
  ///
  /// In en, this message translates to:
  /// **'It is a place where people who have lost their home due to the disaster can stay for a while.'**
  String get nomal2;

  /// No description provided for @nomal2_2.
  ///
  /// In en, this message translates to:
  /// **'This is Japanese saying \'It\'s an earthquake. This building is safe. Stay calm.\''**
  String get nomal2_2;

  /// No description provided for @nomal2q.
  ///
  /// In en, this message translates to:
  /// **'Question 2: What is the correct meaning of the following symbols?'**
  String get nomal2q;

  /// No description provided for @nomal3a.
  ///
  /// In en, this message translates to:
  /// **'Exit for safe evacuation'**
  String get nomal3a;

  /// No description provided for @nomal3b.
  ///
  /// In en, this message translates to:
  /// **'Safe places to evacuate from tsunamis'**
  String get nomal3b;

  /// No description provided for @nomal3c.
  ///
  /// In en, this message translates to:
  /// **'Climb the slide from the other side'**
  String get nomal3c;

  /// No description provided for @nomal3ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is B: A place where you can safely evacuate to from a tsunami.'**
  String get nomal3ans;

  /// No description provided for @nomal3.
  ///
  /// In en, this message translates to:
  /// **'It will tell you where to evacuate in case of a tsunami.'**
  String get nomal3;

  /// No description provided for @nomal3q.
  ///
  /// In en, this message translates to:
  /// **'Question 3: What is the correct meaning of the following symbols?'**
  String get nomal3q;

  /// No description provided for @nomal4a.
  ///
  /// In en, this message translates to:
  /// **'A safe building to evacuate to in the event of a tsunami'**
  String get nomal4a;

  /// No description provided for @nomal4b.
  ///
  /// In en, this message translates to:
  /// **'Run fast anyway'**
  String get nomal4b;

  /// No description provided for @nomal4c.
  ///
  /// In en, this message translates to:
  /// **'This building will not be safe in the event of a tsunami.'**
  String get nomal4c;

  /// No description provided for @nomal4ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is A: A safe building where you can evacuate to in the event of a tsunami.'**
  String get nomal4ans;

  /// No description provided for @nomal4.
  ///
  /// In en, this message translates to:
  /// **'If you see this mark, you can evacuate.'**
  String get nomal4;

  /// No description provided for @nomal4_2.
  ///
  /// In en, this message translates to:
  /// **'This is the sound of an alarm when a tsunami is coming.'**
  String get nomal4_2;

  /// No description provided for @nomal4q.
  ///
  /// In en, this message translates to:
  /// **'Question 4: What is the correct meaning of the following symbols?'**
  String get nomal4q;

  /// No description provided for @nomal5a.
  ///
  /// In en, this message translates to:
  /// **'Earthquake mark'**
  String get nomal5a;

  /// No description provided for @nomal5b.
  ///
  /// In en, this message translates to:
  /// **'Building danger mark'**
  String get nomal5b;

  /// No description provided for @nomal5c.
  ///
  /// In en, this message translates to:
  /// **'Hot spring mark'**
  String get nomal5c;

  /// No description provided for @nomal5ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is A: Earthquake mark.'**
  String get nomal5ans;

  /// No description provided for @nomal5.
  ///
  /// In en, this message translates to:
  /// **'This mark and OX are used at the entrances to evacuation shelters to indicate whether they can withstand an earthquake.'**
  String get nomal5;

  /// No description provided for @nomal5_2.
  ///
  /// In en, this message translates to:
  /// **'This is the sound of an alarm when a earthquake is coming.'**
  String get nomal5_2;

  /// No description provided for @nomal5q.
  ///
  /// In en, this message translates to:
  /// **'Question 5: What is the correct meaning of the following symbols?'**
  String get nomal5q;

  /// No description provided for @nomal6a.
  ///
  /// In en, this message translates to:
  /// **'Beware of falling rocks'**
  String get nomal6a;

  /// No description provided for @nomal6b.
  ///
  /// In en, this message translates to:
  /// **'Landslide'**
  String get nomal6b;

  /// No description provided for @nomal6c.
  ///
  /// In en, this message translates to:
  /// **'Don\'t drop things'**
  String get nomal6c;

  /// No description provided for @nomal6ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is B: Cliff collapse.'**
  String get nomal6ans;

  /// No description provided for @nomal6.
  ///
  /// In en, this message translates to:
  /// **'This mark is followed by OX to indicate information about a landslide.'**
  String get nomal6;

  /// No description provided for @nomal7a.
  ///
  /// In en, this message translates to:
  /// **'River in the mountains'**
  String get nomal7a;

  /// No description provided for @nomal7b.
  ///
  /// In en, this message translates to:
  /// **'Don\'t throw anything in the river'**
  String get nomal7b;

  /// No description provided for @nomal7c.
  ///
  /// In en, this message translates to:
  /// **'Mudslide'**
  String get nomal7c;

  /// No description provided for @nomal7ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is C: Mudslide.'**
  String get nomal7ans;

  /// No description provided for @nomal7.
  ///
  /// In en, this message translates to:
  /// **'This mark followed by OX indicates information about a mudslide.'**
  String get nomal7;

  /// No description provided for @nomal8a.
  ///
  /// In en, this message translates to:
  /// **'Be careful of cliff collapses'**
  String get nomal8a;

  /// No description provided for @nomal8b.
  ///
  /// In en, this message translates to:
  /// **'No cliff collapses allowed'**
  String get nomal8b;

  /// No description provided for @nomal8c.
  ///
  /// In en, this message translates to:
  /// **'A cliff collapse is occurring.'**
  String get nomal8c;

  /// No description provided for @nomal8ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is A: Be careful of cliff collapses.'**
  String get nomal8ans;

  /// No description provided for @nomal8.
  ///
  /// In en, this message translates to:
  /// **'These signs are often found in the mountains, so if you see one, be careful of landslides.'**
  String get nomal8;

  /// No description provided for @nomal9a.
  ///
  /// In en, this message translates to:
  /// **'Be careful of lost items'**
  String get nomal9a;

  /// No description provided for @nomal9b.
  ///
  /// In en, this message translates to:
  /// **'Beware of falling rocks'**
  String get nomal9b;

  /// No description provided for @nomal9c.
  ///
  /// In en, this message translates to:
  /// **'Debris flow warnig'**
  String get nomal9c;

  /// No description provided for @nomal9ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is C: Debris flow warning.'**
  String get nomal9ans;

  /// No description provided for @nomal9.
  ///
  /// In en, this message translates to:
  /// **'These signs are common in the mountains, and if you see one, be careful of landslides.'**
  String get nomal9;

  /// No description provided for @nomal9_2.
  ///
  /// In en, this message translates to:
  /// **'This is the sound of an actual mudslide.If you hear this sound, pay attention.'**
  String get nomal9_2;

  /// No description provided for @nomal10a.
  ///
  /// In en, this message translates to:
  /// **'Tsunami warning'**
  String get nomal10a;

  /// No description provided for @nomal10b.
  ///
  /// In en, this message translates to:
  /// **'Tsunami caution'**
  String get nomal10b;

  /// No description provided for @nomal10c.
  ///
  /// In en, this message translates to:
  /// **'I can surf'**
  String get nomal10c;

  /// No description provided for @nomal10ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is B: Tsunami caution.'**
  String get nomal10ans;

  /// No description provided for @nomal10.
  ///
  /// In en, this message translates to:
  /// **'This sign is in an area where tsunamis are common. Be careful on bad weather days.'**
  String get nomal10;

  /// No description provided for @nomal11a.
  ///
  /// In en, this message translates to:
  /// **'Tsunami'**
  String get nomal11a;

  /// No description provided for @nomal11b.
  ///
  /// In en, this message translates to:
  /// **'I can surf'**
  String get nomal11b;

  /// No description provided for @nomal11c.
  ///
  /// In en, this message translates to:
  /// **'Strong wind'**
  String get nomal11c;

  /// No description provided for @nomal11ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is A: Tsunami.'**
  String get nomal11ans;

  /// No description provided for @nomal11.
  ///
  /// In en, this message translates to:
  /// **'This mark and OX indicate tsunami information.'**
  String get nomal11;

  /// No description provided for @nomal12a.
  ///
  /// In en, this message translates to:
  /// **'Earthquake'**
  String get nomal12a;

  /// No description provided for @nomal12b.
  ///
  /// In en, this message translates to:
  /// **'Wave'**
  String get nomal12b;

  /// No description provided for @nomal12c.
  ///
  /// In en, this message translates to:
  /// **'Flood'**
  String get nomal12c;

  /// No description provided for @nomal12ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is C: Flood.'**
  String get nomal12ans;

  /// No description provided for @nomal12.
  ///
  /// In en, this message translates to:
  /// **'This mark and OX indicate flood information.'**
  String get nomal12;

  /// No description provided for @nomal13a.
  ///
  /// In en, this message translates to:
  /// **'A large-scale fire'**
  String get nomal13a;

  /// No description provided for @nomal13b.
  ///
  /// In en, this message translates to:
  /// **'Construction zone'**
  String get nomal13b;

  /// No description provided for @nomal13c.
  ///
  /// In en, this message translates to:
  /// **'Be careful of smoke'**
  String get nomal13c;

  /// No description provided for @nomal13ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is A: A large-scale fire.'**
  String get nomal13ans;

  /// No description provided for @nomal13.
  ///
  /// In en, this message translates to:
  /// **'This mark, along with OX, indicates information about a large-scale fire.'**
  String get nomal13;

  /// No description provided for @nomal13_2.
  ///
  /// In en, this message translates to:
  /// **'This is the sound when the fire alarm is activated.'**
  String get nomal13_2;

  /// No description provided for @nomal14a.
  ///
  /// In en, this message translates to:
  /// **'Toilet route'**
  String get nomal14a;

  /// No description provided for @nomal14b.
  ///
  /// In en, this message translates to:
  /// **'Emergency exit'**
  String get nomal14b;

  /// No description provided for @nomal14c.
  ///
  /// In en, this message translates to:
  /// **'Evacuation route'**
  String get nomal14c;

  /// No description provided for @nomal14ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is C: Evacuation route.'**
  String get nomal14ans;

  /// No description provided for @nomal14.
  ///
  /// In en, this message translates to:
  /// **'It shows the way to the emergency exit.'**
  String get nomal14;

  /// No description provided for @nomal15a.
  ///
  /// In en, this message translates to:
  /// **'Toilet'**
  String get nomal15a;

  /// No description provided for @nomal15b.
  ///
  /// In en, this message translates to:
  /// **'Emergency exit'**
  String get nomal15b;

  /// No description provided for @nomal15c.
  ///
  /// In en, this message translates to:
  /// **'Evacuation shelter'**
  String get nomal15c;

  /// No description provided for @nomal15ans.
  ///
  /// In en, this message translates to:
  /// **'The correct answer is B: Emergency exit.'**
  String get nomal15ans;

  /// No description provided for @nomal15.
  ///
  /// In en, this message translates to:
  /// **'It represents an evacuation exit in the event of a disaster or other emergency.'**
  String get nomal15;

  /// No description provided for @inhuman.
  ///
  /// In en, this message translates to:
  /// **'Let\'s bring in people'**
  String get inhuman;

  /// No description provided for @swipeh.
  ///
  /// In en, this message translates to:
  /// **'Swipe the person\'s icon to any frame'**
  String get swipeh;

  /// No description provided for @wp.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get wp;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **' of '**
  String get mon;

  /// No description provided for @wnd.
  ///
  /// In en, this message translates to:
  /// **''**
  String get wnd;

  /// No description provided for @wndch.
  ///
  /// In en, this message translates to:
  /// **''**
  String get wndch;

  /// No description provided for @tn.
  ///
  /// In en, this message translates to:
  /// **'RIght answers'**
  String get tn;

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

  /// No description provided for @swipeh1_1q.
  ///
  /// In en, this message translates to:
  /// **'Which represents an evacuation route?'**
  String get swipeh1_1q;

  /// No description provided for @swipeh1_1a.
  ///
  /// In en, this message translates to:
  /// **'Signs with a white background indicate evacuation routes. Signs with a green background indicate emergency exits. Therefore, follow the white sign to the green background.'**
  String get swipeh1_1a;

  /// No description provided for @swipeh1_2q.
  ///
  /// In en, this message translates to:
  /// **'Which represents drinkable water?'**
  String get swipeh1_2q;

  /// No description provided for @swipeh1_2a.
  ///
  /// In en, this message translates to:
  /// **'The water in the cup represents drinkable water. Note that the water in the bucket is not drinkable.'**
  String get swipeh1_2a;

  /// No description provided for @swipeh1_3q.
  ///
  /// In en, this message translates to:
  /// **'Which kanji represents \'earthquake\'?'**
  String get swipeh1_3q;

  /// No description provided for @swipeh1_3a.
  ///
  /// In en, this message translates to:
  /// **'Kanji may be used in news reports and disaster signs, so try to learn the kanji as a set!'**
  String get swipeh1_3a;

  /// No description provided for @swipeh1_4q.
  ///
  /// In en, this message translates to:
  /// **'If you are near the sea and a tsunami comes, what is the appropriate action to take?'**
  String get swipeh1_4q;

  /// No description provided for @swipeh1_4a.
  ///
  /// In en, this message translates to:
  /// **'If you are near the sea, there is a high possibility of a tsunami, so be prepared and quickly escape to high ground if an earthquake occurs.'**
  String get swipeh1_4a;

  /// No description provided for @swipeh1_5q.
  ///
  /// In en, this message translates to:
  /// **'In the event of a disaster, where would you choose to evacuate temporarily?'**
  String get swipeh1_5q;

  /// No description provided for @swipeh1_5a.
  ///
  /// In en, this message translates to:
  /// **'This is the difference between a place where you can live as an evacuee and a place where you can only escape temporarily. Rules are important when living as an evacuee. Please be careful.'**
  String get swipeh1_5a;

  /// No description provided for @swipeh2_1q.
  ///
  /// In en, this message translates to:
  /// **'Which represents flooding or inland flooding?'**
  String get swipeh2_1q;

  /// No description provided for @swipeh2_1a.
  ///
  /// In en, this message translates to:
  /// **'The tsunami symbol on the left expresses the danger of approaching waves, while the flood symbol on the right expresses the danger of being flooded, in one sentence.'**
  String get swipeh2_1a;

  /// No description provided for @swipeh2_2q.
  ///
  /// In en, this message translates to:
  /// **'Would an umbrella be of any use if it rained more than 60mm per hour?'**
  String get swipeh2_2q;

  /// No description provided for @swipeh2_2a.
  ///
  /// In en, this message translates to:
  /// **'Umbrellas are completely useless. Water splashes over everything, making it dangerous to drive a car.'**
  String get swipeh2_2a;

  /// No description provided for @swipeh2_3q.
  ///
  /// In en, this message translates to:
  /// **'What is the number to record a message on the disaster message dial \'171\'?'**
  String get swipeh2_3q;

  /// No description provided for @swipeh2_3a.
  ///
  /// In en, this message translates to:
  /// **'The Disaster Message Dial \'171\' is a service that allows you to enter the phone number of the person you want to check on their safety, then press \'1\' to record the message and press \'2\' to play it back to find out their safety.'**
  String get swipeh2_3a;

  /// No description provided for @swipeh2_4q.
  ///
  /// In en, this message translates to:
  /// **'To check someone\'s safety on Web171, do I need their phone number or their date of birth?'**
  String get swipeh2_4q;

  /// No description provided for @swipeh2_4a.
  ///
  /// In en, this message translates to:
  /// **'Web171 is a service that allows you to check the safety of others over the Internet using a phone number, just like the Disaster Message Dial (171).'**
  String get swipeh2_4a;

  /// No description provided for @swipeh2_5q.
  ///
  /// In en, this message translates to:
  /// **'Which symbol indicates the location of an AED (Automated External Defibrillator)?'**
  String get swipeh2_5q;

  /// No description provided for @swipeh2_5a.
  ///
  /// In en, this message translates to:
  /// **'The \'lightning bolt in a heart\' symbolizes the AED\'s ability to deliver an electric shock to the heart, while the \'snake on a stick\' symbolizes medical care as a whole and does not identify where an AED may be installed.'**
  String get swipeh2_5a;

  /// No description provided for @ver.
  ///
  /// In en, this message translates to:
  /// **'Vertically'**
  String get ver;

  /// No description provided for @hoei.
  ///
  /// In en, this message translates to:
  /// **'Horizonatally'**
  String get hoei;

  /// No description provided for @swipeh3_1q.
  ///
  /// In en, this message translates to:
  /// **'Which is faster, a mudslide or a moped?'**
  String get swipeh3_1q;

  /// No description provided for @swipeh3_1a.
  ///
  /// In en, this message translates to:
  /// **'The speed of a mudslide is about 40km, while the speed limit for a moped is 30km, so the mudslide is faster.'**
  String get swipeh3_1a;

  /// No description provided for @swipeh3_2q.
  ///
  /// In en, this message translates to:
  /// **'If smoke and a person run 25 meters, who will win?'**
  String get swipeh3_2q;

  /// No description provided for @swipeh3_2a.
  ///
  /// In en, this message translates to:
  /// **'The human wins. The speed at which the smoke spreads horizontally is 0.5 to 1 meter per second, which is slightly faster than an adult walking.'**
  String get swipeh3_2a;

  /// No description provided for @swipeh3_3q.
  ///
  /// In en, this message translates to:
  /// **'Does smoke spread faster vertically or horizontally?'**
  String get swipeh3_3q;

  /// No description provided for @swipeh3_3a.
  ///
  /// In en, this message translates to:
  /// **'It is fast vertically. The vertical speed is 3 to 5 meters per second, and the horizontal speed is 0.5 to 1 meter per second.'**
  String get swipeh3_3a;

  /// No description provided for @swipeh3_4q.
  ///
  /// In en, this message translates to:
  /// **'Which is faster: an earthquake or an emergency earthquake alert?'**
  String get swipeh3_4q;

  /// No description provided for @swipeh3_4a.
  ///
  /// In en, this message translates to:
  /// **'The emergency earthquake alert is fast. The earthquake will occur within a few seconds after the emergency earthquake alert sounds.'**
  String get swipeh3_4a;

  /// No description provided for @swipeh3_5q.
  ///
  /// In en, this message translates to:
  /// **'How many meters of tsunami are expected in the event of a major earthquake in the Nankai Trough?'**
  String get swipeh3_5q;

  /// No description provided for @swipeh3_5a.
  ///
  /// In en, this message translates to:
  /// **'10m. In certain areas such as Shizuoka Prefecture, tsunamis of over 20 to 30m are expected, so be careful.'**
  String get swipeh3_5a;
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
      <String>['en', 'ja', 'ko', 'zh'].contains(locale.languageCode);

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
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
