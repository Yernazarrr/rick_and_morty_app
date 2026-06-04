# Rick & Morty

Flutter-приложение по вселенной «Рик и Морти»: персонажи, локации и эпизоды с
поиском и фильтрацией. Построено на **Clean Architecture** с разделением на
`data` / `domain` / `presentation` по фичам.

API: <https://rickandmortyapi.com/api> (только GET-запросы, ответы в JSON).

## Стек

| Слой | Пакеты |
|------|--------|
| Навигация | `go_router`, `go_router_builder` (типизированные маршруты) |
| State | `flutter_bloc` (фичи), `provider` (тема, локаль, профиль) |
| DI | `get_it`, `injectable` |
| Сеть | `dio`, `retrofit`, `internet_connection_checker_plus`, `pretty_dio_logger` |
| Локализация | `intl` + `flutter_localizations` (RU / EN, ARB) |
| Функциональщина | `dartz` (Either), `equatable` |
| UI | `cached_network_image`, `shimmer` |
| Хранилище | `shared_preferences` |

## Архитектура

```
lib/
├── core/                     # переиспользуемая инфраструктура
│   ├── bloc/                 # event-трансформеры (debounce/throttle)
│   ├── constants/            # эндпоинты API, ключи prefs
│   ├── di/                   # инициализация get_it/injectable
│   ├── error/                # Exceptions (data) → Failures (domain)
│   ├── network/              # Dio, retrofit-интерсепторы, NetworkInfo
│   ├── router/               # go_router + типизированные маршруты
│   ├── theme/                # светлая/тёмная темы, контроллер настроек
│   ├── usecase/              # базовый UseCase, Paginated<T>
│   ├── utils/                # extensions, парсер id из url
│   └── widgets/              # общие виджеты (поиск, ошибки, секции…)
└── features/
    ├── characters/           # список (список/сетка), поиск, фильтр, деталь
    ├── locations/            # список, деталь с резидентами
    ├── episodes/             # вкладки по сезонам, деталь с персонажами
    └── settings/             # профиль, переключатель тёмной темы
        ├── data/
        ├── domain/ (entities, repositories, usecases)
        └── presentation/ (bloc, pages, widgets)
```

Поток данных: `Page → Bloc/Cubit → UseCase → Repository (domain)` →
`RepositoryImpl → RemoteDataSource → retrofit ApiService → Dio (data)`.
Ошибки превращаются в `Failure` и возвращаются через `Either<Failure, T>`.

### State-менеджмент
- **BLoC** — списки и детали (поиск с debounce, пагинация с throttle, фильтры).
- **Cubit** — экраны деталей и список эпизодов.
- **provider** — глобальные настройки (`AppSettingsController` — тема/локаль) и
  локальный профиль (`ProfileController`).

## Генерация кода

В проекте используется кодогенерация (`injectable`, `retrofit`,
`json_serializable`, `go_router_builder`, `gen-l10n`). Файлы `*.g.dart`,
`*.config.dart` и `app_localizations.dart` **не** закоммичены — их нужно
сгенерировать:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

`flutter gen-l10n` запускается автоматически при сборке (`generate: true` в
`pubspec.yaml`), либо вручную:

```bash
flutter gen-l10n
```

## Запуск

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Тесты

```bash
flutter test
```

## Замечания по данным

Открытый Rick and Morty API **не отдаёт текстовых описаний** персонажей,
локаций и эпизодов, а также изображений локаций/эпизодов. На макетах эти блоки
присутствуют, поэтому:
- описания показываются как локализованный плейсхолдер
  (`descriptionPlaceholder` в ARB);
- баннеры локаций и эпизодов рендерятся как декоративные градиенты (без
  выдуманного контента).
Профиль на экране настроек — локальный, хранится в `shared_preferences`.
