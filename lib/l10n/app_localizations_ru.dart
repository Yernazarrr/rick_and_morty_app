// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Rick & Morty';

  @override
  String get navCharacters => 'Персонажи';

  @override
  String get navLocations => 'Локации';

  @override
  String get navEpisodes => 'Эпизоды';

  @override
  String get navSettings => 'Настройки';

  @override
  String get searchCharacterHint => 'Найти персонажа';

  @override
  String get searchLocationHint => 'Найти локацию';

  @override
  String get searchEpisodeHint => 'Найти эпизод';

  @override
  String totalCharacters(int count) {
    return 'Всего персонажей: $count';
  }

  @override
  String totalLocations(int count) {
    return 'Всего локаций: $count';
  }

  @override
  String get statusAlive => 'Живой';

  @override
  String get statusDead => 'Мёртвый';

  @override
  String get statusUnknown => 'Неизвестно';

  @override
  String get genderMale => 'Мужской';

  @override
  String get genderFemale => 'Женский';

  @override
  String get genderGenderless => 'Бесполый';

  @override
  String get genderUnknown => 'Неизвестно';

  @override
  String get fieldGender => 'Пол';

  @override
  String get fieldSpecies => 'Раса';

  @override
  String get fieldOrigin => 'Место рождения';

  @override
  String get fieldLocation => 'Местоположение';

  @override
  String get fieldType => 'Тип';

  @override
  String get fieldDimension => 'Измерение';

  @override
  String get sectionEpisodes => 'Эпизоды';

  @override
  String get sectionCharacters => 'Персонажи';

  @override
  String get sectionResidents => 'Персонажи';

  @override
  String get allEpisodes => 'Все эпизоды';

  @override
  String episodeNumber(int number) {
    return 'Серия $number';
  }

  @override
  String get premiere => 'Премьера';

  @override
  String seasonTab(int number) {
    return 'Сезон $number';
  }

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsEdit => 'Редактировать';

  @override
  String get settingsAppearance => 'Внешний вид';

  @override
  String get settingsDarkTheme => 'Тёмная тема';

  @override
  String get settingsThemeOn => 'Включена';

  @override
  String get settingsThemeOff => 'Выключена';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String get settingsVersion => 'Версия приложения';

  @override
  String get settingsAboutText => 'Приложение по вселенной «Рик и Морти»: персонажи, локации и эпизоды с возможностью поиска и фильтрации.';

  @override
  String get filterTitle => 'Фильтры';

  @override
  String get filterApply => 'Применить';

  @override
  String get filterReset => 'Сбросить';

  @override
  String get filterStatus => 'Статус';

  @override
  String get filterGender => 'Пол';

  @override
  String get filterSpecies => 'Раса';

  @override
  String get filterAll => 'Все';

  @override
  String get errorTitle => 'Что-то пошло не так';

  @override
  String get errorNoInternet => 'Нет подключения к интернету';

  @override
  String get errorServer => 'Ошибка сервера, попробуйте позже';

  @override
  String get errorNotFound => 'Ничего не найдено';

  @override
  String get retry => 'Повторить';

  @override
  String get emptyList => 'Список пуст';

  @override
  String characterSummary(String name, String species, String gender, String status, String origin, String location, int episodes) {
    return '$name — $species ($gender).\nТекущий статус: $status.\nМесто рождения: $origin.\nПоследняя известная локация: $location.\nКоличество эпизодов с участием персонажа: $episodes.';
  }

  @override
  String episodeSummary(int season, int number, String code, String airDate, int characters) {
    return 'Сезон $season, серия $number (код $code). Дата выхода: $airDate. Персонажей в эпизоде: $characters.';
  }

  @override
  String locationSummary(String name, String type, String dimension, int residents) {
    return '$name — тип: $type, измерение: $dimension. Количество известных жителей: $residents.';
  }
}
