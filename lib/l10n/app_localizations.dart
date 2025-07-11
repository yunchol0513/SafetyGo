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

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

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
  /// **'Swipe Quiz'**
  String get trolley;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @genreTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Genre'**
  String get genreTitle;

  /// No description provided for @modifyLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get modifyLanguage;

  /// No description provided for @disaster.
  ///
  /// In en, this message translates to:
  /// **'Disaster'**
  String get disaster;

  /// No description provided for @detaileTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Detaile'**
  String get detaileTitle;

  /// No description provided for @quake.
  ///
  /// In en, this message translates to:
  /// **'Earthquake'**
  String get quake;

  /// No description provided for @diffcultyTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Diffculty'**
  String get diffcultyTitle;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @quakeEasy.
  ///
  /// In en, this message translates to:
  /// **'Earthquake～Easy～'**
  String get quakeEasy;

  /// No description provided for @study.
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get study;

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
  /// **'The nearest evacuation centers are \'Kobe Ikuta Junior High School\', \'Kobe City Planning Center\', and \'Meriken Park\'.'**
  String get scepeople5;

  /// No description provided for @pe6.
  ///
  /// In en, this message translates to:
  /// **'person6'**
  String get pe6;

  /// No description provided for @scepeople6.
  ///
  /// In en, this message translates to:
  /// **'Do not go to \'Kobe City Planning Center\' in the event of a tsunami.'**
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
  /// **'I have to go to \'Kobe City Planning Center\' with my family!'**
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
