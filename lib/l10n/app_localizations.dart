import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

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
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get appTitle;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @timeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timeline;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @daysSugarFree.
  ///
  /// In en, this message translates to:
  /// **'Days Sugar-Free'**
  String get daysSugarFree;

  /// No description provided for @didYouStaySugarFreeToday.
  ///
  /// In en, this message translates to:
  /// **'Did you stay sugar-free today?'**
  String get didYouStaySugarFreeToday;

  /// No description provided for @yesIWasSuccessful.
  ///
  /// In en, this message translates to:
  /// **'YES, I WAS SUCCESSFUL'**
  String get yesIWasSuccessful;

  /// No description provided for @successRecorded.
  ///
  /// In en, this message translates to:
  /// **'SUCCESS RECORDED ✓'**
  String get successRecorded;

  /// No description provided for @iHadASlipUp.
  ///
  /// In en, this message translates to:
  /// **'I had a slip-up'**
  String get iHadASlipUp;

  /// No description provided for @yourHistory.
  ///
  /// In en, this message translates to:
  /// **'Your History'**
  String get yourHistory;

  /// No description provided for @tapDayToToggle.
  ///
  /// In en, this message translates to:
  /// **'Tap any day to mark it as sugar-free or to remove it.'**
  String get tapDayToToggle;

  /// No description provided for @yourJourney.
  ///
  /// In en, this message translates to:
  /// **'Your Journey'**
  String get yourJourney;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'APPEARANCE'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @challenge.
  ///
  /// In en, this message translates to:
  /// **'CHALLENGE'**
  String get challenge;

  /// No description provided for @hardMode.
  ///
  /// In en, this message translates to:
  /// **'Hard Mode'**
  String get hardMode;

  /// No description provided for @hardModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hides your streak counter.'**
  String get hardModeSubtitle;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'DATA'**
  String get data;

  /// No description provided for @resetAllData.
  ///
  /// In en, this message translates to:
  /// **'Reset All Data'**
  String get resetAllData;

  /// No description provided for @resetAllDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete your streak and settings.'**
  String get resetAllDataSubtitle;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @actionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get actionCannotBeUndone;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'RESET'**
  String get reset;

  /// No description provided for @slipUpDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s okay, it happens.'**
  String get slipUpDialogTitle;

  /// No description provided for @slipUpDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One slip-up doesn\'t erase your progress. Every sugar-free day counts.'**
  String get slipUpDialogSubtitle;

  /// No description provided for @slipUpTriggerQuestion.
  ///
  /// In en, this message translates to:
  /// **'What was the trigger? (Optional)'**
  String get slipUpTriggerQuestion;

  /// No description provided for @slipUpTriggerHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., stress at work, a party...'**
  String get slipUpTriggerHint;

  /// No description provided for @resetMyStreak.
  ///
  /// In en, this message translates to:
  /// **'RESET MY STREAK'**
  String get resetMyStreak;

  /// No description provided for @todaysSuccessRemoved.
  ///
  /// In en, this message translates to:
  /// **'Today\'s success has been removed.'**
  String get todaysSuccessRemoved;

  /// No description provided for @appHasBeenReset.
  ///
  /// In en, this message translates to:
  /// **'App has been reset.'**
  String get appHasBeenReset;

  /// No description provided for @milestone1Title.
  ///
  /// In en, this message translates to:
  /// **'Day 1: The First Step'**
  String get milestone1Title;

  /// No description provided for @milestone1Body.
  ///
  /// In en, this message translates to:
  /// **'Your insulin levels are starting to stabilize. Your liver is getting a much-needed break from processing fructose, beginning the transition to fat-burning.'**
  String get milestone1Body;

  /// No description provided for @milestone1Mind.
  ///
  /// In en, this message translates to:
  /// **'The first psychological hurdle. You\'ve made a conscious decision and stuck with it. Well done.'**
  String get milestone1Mind;

  /// No description provided for @milestone2Title.
  ///
  /// In en, this message translates to:
  /// **'Day 2: The Cleanse'**
  String get milestone2Title;

  /// No description provided for @milestone2Body.
  ///
  /// In en, this message translates to:
  /// **'You might feel a bit foggy or have a headache. This is a positive sign! It\'s your body recalibrating its hormonal and metabolic systems. It\'s a true detox.'**
  String get milestone2Body;

  /// No description provided for @milestone2Mind.
  ///
  /// In en, this message translates to:
  /// **'This is often the toughest day for cravings as your brain\'s reward system screams for a fix. Acknowledge the feeling and let it pass. It\'s temporary.'**
  String get milestone2Mind;

  /// No description provided for @milestone3Title.
  ///
  /// In en, this message translates to:
  /// **'Day 3: Peak Challenge'**
  String get milestone3Title;

  /// No description provided for @milestone3Body.
  ///
  /// In en, this message translates to:
  /// **'Your dopamine pathways are starting to reset. Your body is becoming more \'insulin-sensitive,\' which is fantastic for your long-term health.'**
  String get milestone3Body;

  /// No description provided for @milestone3Mind.
  ///
  /// In en, this message translates to:
  /// **'You\'ve made it through the hardest part of the initial withdrawal. From here, the physical cravings will start to subside.'**
  String get milestone3Mind;

  /// No description provided for @milestone5Title.
  ///
  /// In en, this message translates to:
  /// **'Day 5: Gut Guardian'**
  String get milestone5Title;

  /// No description provided for @milestone5Body.
  ///
  /// In en, this message translates to:
  /// **'The \'bad\' bacteria in your gut that thrive on sugar are starting to die off. This makes room for beneficial bacteria to flourish, improving digestion and overall gut health.'**
  String get milestone5Body;

  /// No description provided for @milestone5Mind.
  ///
  /// In en, this message translates to:
  /// **'You\'re noticing a pattern and proving to yourself that you don\'t need sugar to get through the day.'**
  String get milestone5Mind;

  /// No description provided for @milestone7Title.
  ///
  /// In en, this message translates to:
  /// **'Day 7: The Taste Bud Reset'**
  String get milestone7Title;

  /// No description provided for @milestone7Body.
  ///
  /// In en, this message translates to:
  /// **'Your taste buds are no longer desensitized by overwhelming sweetness. An apple or a strawberry will start to taste incredibly sweet and flavorful.'**
  String get milestone7Body;

  /// No description provided for @milestone7Mind.
  ///
  /// In en, this message translates to:
  /// **'A major milestone! You\'ve completed a full week. The habit is beginning to form.'**
  String get milestone7Mind;

  /// No description provided for @milestone14Title.
  ///
  /// In en, this message translates to:
  /// **'Day 14: The Glow Up'**
  String get milestone14Title;

  /// No description provided for @milestone14Body.
  ///
  /// In en, this message translates to:
  /// **'Sugar damages collagen. By cutting it out, you\'re stopping this damage. Reduced inflammation can lead to clearer, calmer skin.'**
  String get milestone14Body;

  /// No description provided for @milestone14Mind.
  ///
  /// In en, this message translates to:
  /// **'Two weeks! Your commitment is solidifying. This is no longer a fluke; it\'s a lifestyle change.'**
  String get milestone14Mind;

  /// No description provided for @milestone21Title.
  ///
  /// In en, this message translates to:
  /// **'Day 21: The Habit Loop'**
  String get milestone21Title;

  /// No description provided for @milestone21Body.
  ///
  /// In en, this message translates to:
  /// **'Your brain has had enough time to start forming new neural pathways. Reaching for a healthy snack instead of a sugary one feels more natural.'**
  String get milestone21Body;

  /// No description provided for @milestone21Mind.
  ///
  /// In en, this message translates to:
  /// **'They say it takes 21 days to form a habit. You\'ve just laid the foundation for a permanent, positive change.'**
  String get milestone21Mind;

  /// No description provided for @milestone30Title.
  ///
  /// In en, this message translates to:
  /// **'Day 30: The Energy Upgrade'**
  String get milestone30Title;

  /// No description provided for @milestone30Body.
  ///
  /// In en, this message translates to:
  /// **'Your body is now efficient at using fat for fuel, leading to more stable energy without the afternoon crashes. Your triglyceride levels have likely dropped significantly.'**
  String get milestone30Body;

  /// No description provided for @milestone30Mind.
  ///
  /// In en, this message translates to:
  /// **'You\'ve conquered a whole month. Your self-efficacy is sky-high. You are in control.'**
  String get milestone30Mind;

  /// No description provided for @milestone40Title.
  ///
  /// In en, this message translates to:
  /// **'Day 40: The Dental Dividend'**
  String get milestone40Title;

  /// No description provided for @milestone40Body.
  ///
  /// In en, this message translates to:
  /// **'The harmful bacteria in your mouth that cause cavities thrive on sugar. By starving them, you\'re dramatically improving your oral health and reducing inflammation in your gums.'**
  String get milestone40Body;

  /// No description provided for @milestone40Mind.
  ///
  /// In en, this message translates to:
  /// **'Your mouth feels cleaner, and you\'re investing in a future with fewer dental bills. That\'s a reason to smile.'**
  String get milestone40Mind;

  /// No description provided for @milestone60Title.
  ///
  /// In en, this message translates to:
  /// **'Day 60: Deeper Sleep'**
  String get milestone60Title;

  /// No description provided for @milestone60Body.
  ///
  /// In en, this message translates to:
  /// **'Without blood sugar spikes and crashes disrupting your night, your body can achieve deeper, more restorative sleep cycles. This improves everything from memory to mood.'**
  String get milestone60Body;

  /// No description provided for @milestone60Mind.
  ///
  /// In en, this message translates to:
  /// **'Waking up feeling genuinely rested becomes the new normal, not the exception.'**
  String get milestone60Mind;

  /// No description provided for @milestone75Title.
  ///
  /// In en, this message translates to:
  /// **'Day 75: Autophagy Activated'**
  String get milestone75Title;

  /// No description provided for @milestone75Body.
  ///
  /// In en, this message translates to:
  /// **'With lower insulin levels, your body\'s cellular cleanup process, known as \'autophagy,\' can work more effectively. It\'s like a deep spring-cleaning for your cells, removing damaged parts.'**
  String get milestone75Body;

  /// No description provided for @milestone75Mind.
  ///
  /// In en, this message translates to:
  /// **'You\'re not just looking better, you are fundamentally healthier on a cellular level. This is deep healing.'**
  String get milestone75Mind;

  /// No description provided for @milestone90Title.
  ///
  /// In en, this message translates to:
  /// **'Day 90: Mental Sharpness'**
  String get milestone90Title;

  /// No description provided for @milestone90Body.
  ///
  /// In en, this message translates to:
  /// **'Reduced inflammation in the brain and stable energy supply leads to less \'brain fog,\' better focus, and improved memory recall.'**
  String get milestone90Body;

  /// No description provided for @milestone90Mind.
  ///
  /// In en, this message translates to:
  /// **'You feel sharper and more clear-headed. Complex tasks seem less daunting.'**
  String get milestone90Mind;

  /// No description provided for @milestone120Title.
  ///
  /// In en, this message translates to:
  /// **'4 Months: The Immune Boost'**
  String get milestone120Title;

  /// No description provided for @milestone120Body.
  ///
  /// In en, this message translates to:
  /// **'High sugar intake can impair the function of your white blood cells. After four months, your immune system is operating without this handicap, better equipped to fight off infections.'**
  String get milestone120Body;

  /// No description provided for @milestone120Mind.
  ///
  /// In en, this message translates to:
  /// **'You\'re building a more resilient body, one that\'s better prepared to defend itself.'**
  String get milestone120Mind;

  /// No description provided for @milestone150Title.
  ///
  /// In en, this message translates to:
  /// **'5 Months: The Stress Shield'**
  String get milestone150Title;

  /// No description provided for @milestone150Body.
  ///
  /// In en, this message translates to:
  /// **'The cortisol rollercoaster caused by blood sugar swings is a thing of the past. Your body\'s stress-response system is calmer and more regulated, improving your mood and resilience.'**
  String get milestone150Body;

  /// No description provided for @milestone150Mind.
  ///
  /// In en, this message translates to:
  /// **'You may find you\'re less reactive to daily stressors. You have more emotional bandwidth.'**
  String get milestone150Mind;

  /// No description provided for @milestone180Title.
  ///
  /// In en, this message translates to:
  /// **'6 Months: Healthy Heart'**
  String get milestone180Title;

  /// No description provided for @milestone180Body.
  ///
  /// In en, this message translates to:
  /// **'Significant improvements in cardiovascular risk factors, including blood pressure, cholesterol levels (lower LDL, higher HDL), and triglycerides.'**
  String get milestone180Body;

  /// No description provided for @milestone180Mind.
  ///
  /// In en, this message translates to:
  /// **'You\'ve actively and dramatically reduced your risk for future health problems. This is a huge win.'**
  String get milestone180Mind;

  /// No description provided for @milestone240Title.
  ///
  /// In en, this message translates to:
  /// **'8 Months: Slowing the Clock'**
  String get milestone240Title;

  /// No description provided for @milestone240Body.
  ///
  /// In en, this message translates to:
  /// **'You\'ve drastically reduced the formation of \'AGEs\' (Advanced Glycation End-products) in your body. These compounds stiffen tissues and accelerate aging, so you\'re protecting your skin, organs, and joints.'**
  String get milestone240Body;

  /// No description provided for @milestone240Mind.
  ///
  /// In en, this message translates to:
  /// **'This is a long-term investment in your future self. You\'re not just healthier now; you\'re setting the stage for more graceful aging.'**
  String get milestone240Mind;

  /// No description provided for @milestone300Title.
  ///
  /// In en, this message translates to:
  /// **'Day 300: The Milestone Master'**
  String get milestone300Title;

  /// No description provided for @milestone300Body.
  ///
  /// In en, this message translates to:
  /// **'This achievement isn\'t about a new biological process; it\'s about acknowledging your incredible consistency. 300 days is a monumental display of discipline and commitment.'**
  String get milestone300Body;

  /// No description provided for @milestone300Mind.
  ///
  /// In en, this message translates to:
  /// **'This is no longer a challenge; it\'s a core part of who you are. You are someone who prioritizes their health, and you\'ve proven it 300 times over.'**
  String get milestone300Mind;

  /// No description provided for @milestone365Title.
  ///
  /// In en, this message translates to:
  /// **'1 Year: A New Baseline'**
  String get milestone365Title;

  /// No description provided for @milestone365Body.
  ///
  /// In en, this message translates to:
  /// **'You\'ve rewired your metabolism and significantly lowered your risk for Type 2 diabetes and other chronic illnesses. Your body has established a new, healthier normal.'**
  String get milestone365Body;

  /// No description provided for @milestone365Mind.
  ///
  /// In en, this message translates to:
  /// **'This is no longer something you \'do\'; it\'s your identity. Celebrate this incredible achievement and the person you\'ve become.'**
  String get milestone365Mind;
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
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
