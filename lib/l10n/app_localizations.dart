import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rick & Morty'**
  String get appName;

  /// No description provided for @navCharacters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get navCharacters;

  /// No description provided for @navLocations.
  ///
  /// In en, this message translates to:
  /// **'Locations'**
  String get navLocations;

  /// No description provided for @navEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get navEpisodes;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @searchCharacterHint.
  ///
  /// In en, this message translates to:
  /// **'Find a character'**
  String get searchCharacterHint;

  /// No description provided for @searchLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Find a location'**
  String get searchLocationHint;

  /// No description provided for @searchEpisodeHint.
  ///
  /// In en, this message translates to:
  /// **'Find an episode'**
  String get searchEpisodeHint;

  /// No description provided for @totalCharacters.
  ///
  /// In en, this message translates to:
  /// **'Total characters: {count}'**
  String totalCharacters(int count);

  /// No description provided for @totalLocations.
  ///
  /// In en, this message translates to:
  /// **'Total locations: {count}'**
  String totalLocations(int count);

  /// No description provided for @statusAlive.
  ///
  /// In en, this message translates to:
  /// **'Alive'**
  String get statusAlive;

  /// No description provided for @statusDead.
  ///
  /// In en, this message translates to:
  /// **'Dead'**
  String get statusDead;

  /// No description provided for @statusUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get statusUnknown;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderGenderless.
  ///
  /// In en, this message translates to:
  /// **'Genderless'**
  String get genderGenderless;

  /// No description provided for @genderUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get genderUnknown;

  /// No description provided for @fieldGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get fieldGender;

  /// No description provided for @fieldSpecies.
  ///
  /// In en, this message translates to:
  /// **'Species'**
  String get fieldSpecies;

  /// No description provided for @fieldOrigin.
  ///
  /// In en, this message translates to:
  /// **'Origin'**
  String get fieldOrigin;

  /// No description provided for @fieldLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get fieldLocation;

  /// No description provided for @fieldType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get fieldType;

  /// No description provided for @fieldDimension.
  ///
  /// In en, this message translates to:
  /// **'Dimension'**
  String get fieldDimension;

  /// No description provided for @sectionEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get sectionEpisodes;

  /// No description provided for @sectionCharacters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get sectionCharacters;

  /// No description provided for @sectionResidents.
  ///
  /// In en, this message translates to:
  /// **'Residents'**
  String get sectionResidents;

  /// No description provided for @allEpisodes.
  ///
  /// In en, this message translates to:
  /// **'All episodes'**
  String get allEpisodes;

  /// No description provided for @episodeNumber.
  ///
  /// In en, this message translates to:
  /// **'Episode {number}'**
  String episodeNumber(int number);

  /// No description provided for @premiere.
  ///
  /// In en, this message translates to:
  /// **'Premiere'**
  String get premiere;

  /// No description provided for @seasonTab.
  ///
  /// In en, this message translates to:
  /// **'Season {number}'**
  String seasonTab(int number);

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get settingsEdit;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsDarkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get settingsDarkTheme;

  /// No description provided for @settingsThemeOn.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get settingsThemeOn;

  /// No description provided for @settingsThemeOff.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get settingsThemeOff;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get languageRussian;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get settingsVersion;

  /// No description provided for @settingsAboutText.
  ///
  /// In en, this message translates to:
  /// **'An app for the Rick and Morty universe: characters, locations and episodes with search and filtering.'**
  String get settingsAboutText;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filterTitle;

  /// No description provided for @filterApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get filterApply;

  /// No description provided for @filterReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get filterReset;

  /// No description provided for @filterStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get filterStatus;

  /// No description provided for @filterGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get filterGender;

  /// No description provided for @filterSpecies.
  ///
  /// In en, this message translates to:
  /// **'Species'**
  String get filterSpecies;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorTitle;

  /// No description provided for @errorNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorNoInternet;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error, try again later'**
  String get errorServer;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found'**
  String get errorNotFound;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @emptyList.
  ///
  /// In en, this message translates to:
  /// **'The list is empty'**
  String get emptyList;

  /// No description provided for @characterSummary.
  ///
  /// In en, this message translates to:
  /// **'{name} is a {species} ({gender}).\nCurrent status: {status}.\nOrigin: {origin}.\nLast known location: {location}.\nNumber of episodes featuring this character: {episodes}.'**
  String characterSummary(String name, String species, String gender, String status, String origin, String location, int episodes);

  /// No description provided for @episodeSummary.
  ///
  /// In en, this message translates to:
  /// **'Season {season}, episode {number} (code {code}). Air date: {airDate}. Characters in this episode: {characters}.'**
  String episodeSummary(int season, int number, String code, String airDate, int characters);

  /// No description provided for @locationSummary.
  ///
  /// In en, this message translates to:
  /// **'{name} — type: {type}, dimension: {dimension}. Number of known residents: {residents}.'**
  String locationSummary(String name, String type, String dimension, int residents);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
