// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Rick & Morty';

  @override
  String get navCharacters => 'Characters';

  @override
  String get navLocations => 'Locations';

  @override
  String get navEpisodes => 'Episodes';

  @override
  String get navSettings => 'Settings';

  @override
  String get searchCharacterHint => 'Find a character';

  @override
  String get searchLocationHint => 'Find a location';

  @override
  String get searchEpisodeHint => 'Find an episode';

  @override
  String totalCharacters(int count) {
    return 'Total characters: $count';
  }

  @override
  String totalLocations(int count) {
    return 'Total locations: $count';
  }

  @override
  String get statusAlive => 'Alive';

  @override
  String get statusDead => 'Dead';

  @override
  String get statusUnknown => 'Unknown';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderGenderless => 'Genderless';

  @override
  String get genderUnknown => 'Unknown';

  @override
  String get fieldGender => 'Gender';

  @override
  String get fieldSpecies => 'Species';

  @override
  String get fieldOrigin => 'Origin';

  @override
  String get fieldLocation => 'Location';

  @override
  String get fieldType => 'Type';

  @override
  String get fieldDimension => 'Dimension';

  @override
  String get sectionEpisodes => 'Episodes';

  @override
  String get sectionCharacters => 'Characters';

  @override
  String get sectionResidents => 'Residents';

  @override
  String get allEpisodes => 'All episodes';

  @override
  String episodeNumber(int number) {
    return 'Episode $number';
  }

  @override
  String get premiere => 'Premiere';

  @override
  String seasonTab(int number) {
    return 'Season $number';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsEdit => 'Edit';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsDarkTheme => 'Dark theme';

  @override
  String get settingsThemeOn => 'Enabled';

  @override
  String get settingsThemeOff => 'Disabled';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsVersion => 'App version';

  @override
  String get settingsAboutText => 'An app for the Rick and Morty universe: characters, locations and episodes with search and filtering.';

  @override
  String get filterTitle => 'Filters';

  @override
  String get filterApply => 'Apply';

  @override
  String get filterReset => 'Reset';

  @override
  String get filterStatus => 'Status';

  @override
  String get filterGender => 'Gender';

  @override
  String get filterSpecies => 'Species';

  @override
  String get filterAll => 'All';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorNoInternet => 'No internet connection';

  @override
  String get errorServer => 'Server error, try again later';

  @override
  String get errorNotFound => 'Nothing found';

  @override
  String get retry => 'Retry';

  @override
  String get emptyList => 'The list is empty';

  @override
  String characterSummary(String name, String species, String gender, String status, String origin, String location, int episodes) {
    return '$name is a $species ($gender).\nCurrent status: $status.\nOrigin: $origin.\nLast known location: $location.\nNumber of episodes featuring this character: $episodes.';
  }

  @override
  String episodeSummary(int season, int number, String code, String airDate, int characters) {
    return 'Season $season, episode $number (code $code). Air date: $airDate. Characters in this episode: $characters.';
  }

  @override
  String locationSummary(String name, String type, String dimension, int residents) {
    return '$name — type: $type, dimension: $dimension. Number of known residents: $residents.';
  }
}
