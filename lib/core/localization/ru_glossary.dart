import 'package:flutter/widgets.dart';

/// Русский глоссарий для значений, которые приходят из Rick & Morty API на
/// английском языке (раса, типы и измерения локаций, названия локаций и
/// эпизодов). Набор данных API фиксированный, поэтому переводы заданы статически.
///
/// Если конкретное значение не найдено в словаре — возвращается исходная строка.
/// Это и есть «переводим, только если значение пришло из API»: незнакомые или
/// пользовательские значения остаются как есть, а не превращаются в заглушку.
class RuGlossary {
  const RuGlossary._();

  /// Приводит ключ к каноничному виду: убирает пробелы по краям и заменяет
  /// «фигурные» апострофы (U+2019/U+2018) на обычные, чтобы совпадение не
  /// зависело от того, какой именно символ прислал API.
  static String _norm(String s) =>
      s.trim().replaceAll('’', "'").replaceAll('‘', "'");

  static String _lookup(Map<String, String> map, String raw) =>
      map[_norm(raw)] ?? raw;

  /// Раса персонажа: «Human» → «Человек».
  static String species(String raw) => _lookup(_species, raw);

  /// Название локации: «Earth (C-137)» → «Земля (C-137)».
  static String locationName(String raw) => _lookup(_locations, raw);

  /// Тип локации: «Planet» → «Планета».
  static String locationType(String raw) => _lookup(_types, raw);

  /// Измерение локации: «Dimension C-137» → «Измерение C-137».
  static String dimension(String raw) => _lookup(_dimensions, raw);

  /// Название эпизода: «Pilot» → «Пилот».
  static String episode(String raw) => _lookup(_episodes, raw);

  static const Map<String, String> _species = {
    'Human': 'Человек',
    'Alien': 'Пришелец',
    'Humanoid': 'Гуманоид',
    'Animal': 'Животное',
    'Robot': 'Робот',
    'Mythological Creature': 'Мифическое существо',
    'Poopybutthole': 'Пупибаттхол',
    'Cronenberg': 'Кроненберг',
    'Disease': 'Болезнь',
    'unknown': 'Неизвестно',
  };

  static const Map<String, String> _types = {
    'Acid Plant': 'Кислотный завод',
    'Arcade': 'Аркада',
    'Artificially generated world': 'Искусственно созданный мир',
    'Asteroid': 'Астероид',
    'Base': 'База',
    'Box': 'Коробка',
    'Cluster': 'Скопление',
    'Consciousness': 'Сознание',
    'Convention': 'Конвент',
    'Country': 'Страна',
    'Customs': 'Таможня',
    'Daycare': 'Детский сад',
    'Death Star': 'Звезда Смерти',
    'Diegesis': 'Диегезис',
    'Dimension': 'Измерение',
    'Dream': 'Сон',
    'Dwarf planet (Celestial Dwarf)': 'Карликовая планета',
    'Elemental Rings': 'Стихийные кольца',
    'Fantasy town': 'Фэнтези-городок',
    'Game': 'Игра',
    'Hell': 'Ад',
    'Human': 'Человек',
    'Liquid': 'Жидкость',
    'Machine': 'Машина',
    'Memory': 'Воспоминание',
    'Menagerie': 'Зверинец',
    'Microverse': 'Микровселенная',
    'Miniverse': 'Минивселенная',
    'Mount': 'Гора',
    'Nightmare': 'Кошмар',
    'Non-Diegetic Alternative Reality': 'Недиегетическая альтернативная реальность',
    'Planet': 'Планета',
    'Police Department': 'Полицейский участок',
    'Quadrant': 'Квадрант',
    'Quasar': 'Квазар',
    'Reality': 'Реальность',
    'Resort': 'Курорт',
    'Spa': 'Спа',
    'Space': 'Космос',
    'Space station': 'Космическая станция',
    'Spacecraft': 'Космический корабль',
    'TV': 'Телевизор',
    'Teenyverse': 'Тинивселенная',
    'Woods': 'Лес',
    'unknown': 'Неизвестно',
  };

  static const Map<String, String> _dimensions = {
    'Chair Dimension': 'Измерение стульев',
    'Cromulon Dimension': 'Измерение Кромулонов',
    'Cronenberg Dimension': 'Измерение Кроненбергов',
    'Dimension 5-126': 'Измерение 5-126',
    'Dimension C-137': 'Измерение C-137',
    'Dimension C-35': 'Измерение C-35',
    'Dimension C-500A': 'Измерение C-500A',
    'Dimension D-99': 'Измерение D-99',
    'Dimension D716': 'Измерение D716',
    'Dimension D716-B': 'Измерение D716-B',
    'Dimension D716-C': 'Измерение D716-C',
    'Dimension J-22': 'Измерение J-22',
    'Dimension J19ζ7': 'Измерение J19ζ7',
    'Dimension K-22': 'Измерение K-22',
    'Dimension K-83': 'Измерение K-83',
    'Eric Stoltz Mask Dimension': 'Измерение маски Эрика Штольца',
    "Evil Rick's Target Dimension": 'Целевое измерение Злого Рика',
    'Fantasy Dimension': 'Фэнтези-измерение',
    'Fascist Dimension': 'Фашистское измерение',
    'Fascist Shrimp Dimension': 'Измерение фашистских креветок',
    'Fascist Teddy Bear Dimension': 'Измерение фашистских плюшевых мишек',
    'Giant Telepathic Spiders Dimension': 'Измерение гигантских телепатических пауков',
    'Magic Dimension': 'Магическое измерение',
    'Merged Dimension': 'Объединённое измерение',
    'Phone Dimension': 'Измерение телефонов',
    'Pizza Dimension': 'Измерение пиццы',
    'Post-Apocalyptic Dimension': 'Постапокалиптическое измерение',
    'Replacement Dimension': 'Запасное измерение',
    'Testicle Monster Dimension': 'Измерение монстров-яичек',
    'Tusk Dimension': 'Измерение бивней',
    'Unknown dimension': 'Неизвестное измерение',
    'Wasp Dimension': 'Измерение ос',
    'unknown': 'Неизвестно',
  };

  static const Map<String, String> _episodes = {
    'Pilot': 'Пилот',
    'Lawnmower Dog': 'Газонокосильный пёс',
    'Anatomy Park': 'Анатомический парк',
    'M. Night Shaym-Aliens!': 'М. Найт Шьямалан-Пришельцы!',
    'Meeseeks and Destroy': 'Мисикс и разрушение',
    'Rick Potion #9': 'Зелье Рика №9',
    'Raising Gazorpazorp': 'Воспитание Газорпазорпа',
    'Rixty Minutes': 'Рикстьдесят минут',
    'Something Ricked This Way Comes': 'Что-то Рикнутое грядёт',
    'Close Rick-counters of the Rick Kind': 'Близкие Рик-онтакты Риковской степени',
    'Ricksy Business': 'Риковечеринка',
    'A Rickle in Time': 'Рикл во времени',
    'Mortynight Run': 'Полуночный забег Морти',
    'Auto Erotic Assimilation': 'Автоэротическая ассимиляция',
    'Total Rickall': 'Вспомнить всё Риком',
    'Get Schwifty': 'Зашвифти',
    'The Ricks Must Be Crazy': 'Рики, должно быть, спятили',
    'Big Trouble in Little Sanchez': 'Большие проблемы в маленьком Санчесе',
    'Interdimensional Cable 2: Tempting Fate': 'Межпространственное ТВ 2: Искушая судьбу',
    "Look Who's Purging Now": 'Кто теперь на Судной ночи',
    'The Wedding Squanchers': 'Свадебные сквончеры',
    'The Rickshank Rickdemption': 'Рикбудительное Рикключение',
    'Rickmancing the Stone': 'Рикороман с камнем',
    'Pickle Rick': 'Огурчик Рик',
    'Vindicators 3: The Return of Worldender': 'Виндикаторы 3: Возвращение Концесвета',
    'The Whirly Dirly Conspiracy': 'Заговор Вертиго-Виражей',
    'Rest and Ricklaxation': 'Отдых и Риклаксация',
    'The Ricklantis Mixup': 'Путаница в Рикслантиде',
    "Morty's Mind Blowers": 'Взрыватели мозга Морти',
    "The ABC's of Beth": 'Азбука Бет',
    'The Rickchurian Mortydate': 'Морткандидат Рикчжурии',
    'Edge of Tomorty: Rick, Die, Rickpeat': 'Грань будуморти: Рик, умри, Рикори',
    'The Old Man and the Seat': 'Старик и кресло',
    "One Crew Over the Crewcoo's Morty": 'Пролетая над гнездом Морти',
    "Claw and Hoarder: Special Ricktim's Morty": 'Коготь и скряга: особый Рикжертвенный Морти',
    'Rattlestar Ricklactica': 'Гремучая звезда Рикактика',
    'Never Ricking Morty': 'Никогда не Рикующий Морти',
    'Promortyus': 'Промортей',
    'The Vat of Acid Episode': 'Эпизод с чаном кислоты',
    'Childrick of Mort': 'Дитярик Морта',
    'Star Mort: Rickturn of the Jerri': 'Звёздный Морт: Возвращение Джерри',
    'Mort Dinner Rick Andre': 'Мортужин с Риком Андре',
    'Mortyplicity': 'Мортипликация',
    'A Rickconvenient Mort': 'Рикнеудобный Морт',
    'Rickdependence Spray': 'День Рикнезависимости',
    'Amortycan Grickfitti': 'Амортиканское Граффрикти',
    "Rick & Morty's Thanksploitation Spectacular": 'Рик и Морти: День Благорикдарения',
    'Gotron Jerrysis Rickvangelion': 'Готрон Джеррисис Рикангелион',
    'Rickternal Friendshine of the Spotless Mort': 'Вечное сияние чистого Морта',
    'Forgetting Sarick Mortshall': 'В пролёте с Сариком Морталлом',
    'Rickmurai Jack': 'Риксамурай Джек',
  };

  static const Map<String, String> _locations = {
    'Earth (C-137)': 'Земля (C-137)',
    'Abadango': 'Абаданго',
    'Citadel of Ricks': 'Цитадель Рикков',
    "Worldender's lair": 'Логово Концесвета',
    'Anatomy Park': 'Анатомический парк',
    'Interdimensional Cable': 'Межпространственное ТВ',
    'Immortality Field Resort': 'Курорт «Поле бессмертия»',
    'Post-Apocalyptic Earth': 'Постапокалиптическая Земля',
    'Purge Planet': 'Планета Судной ночи',
    'Venzenulon 7': 'Вензенулон 7',
    'Bepis 9': 'Бепис 9',
    'Cronenberg Earth': 'Кроненберг-Земля',
    'Nuptia 4': 'Нупция 4',
    "Giant's Town": 'Город великанов',
    'Bird World': 'Птичий мир',
    'St. Gloopy Noops Hospital': 'Госпиталь Святого Глупи Нупса',
    'Earth (5-126)': 'Земля (5-126)',
    "Mr. Goldenfold's dream": 'Сон мистера Голденфолда',
    'Gromflom Prime': 'Громфлом Прайм',
    'Earth (Replacement Dimension)': 'Земля (Запасное измерение)',
    'Testicle Monster Dimension': 'Измерение монстров-яичек',
    'Signus 5 Expanse': 'Простор Сигнус 5',
    'Earth (C-500A)': 'Земля (C-500A)',
    "Rick's Battery Microverse": 'Микровселенная-батарейка Рика',
    'The Menagerie': 'Зверинец',
    'Earth (K-83)': 'Земля (K-83)',
    'Hideout Planet': 'Планета-укрытие',
    "Unity's Planet": 'Планета Юнити',
    'Dorian 5': 'Дориан 5',
    'Earth (Unknown dimension)': 'Земля (Неизвестное измерение)',
    'Earth (J19ζ7)': 'Земля (J19ζ7)',
    'Roy: A Life Well Lived': 'Рой: Хорошо прожитая жизнь',
    'Eric Stoltz Mask Earth': 'Земля маски Эрика Штольца',
    "Earth (Evil Rick's Target Dimension)": 'Земля (Целевое измерение Злого Рика)',
    'Planet Squanch': 'Планета Сквонч',
    'Glaagablaaga': 'Глаагаблаага',
    'Resort Planet': 'Планета-курорт',
    'Interdimensional Customs': 'Межпространственная таможня',
    'Galactic Federation Prison': 'Тюрьма Галактической Федерации',
    'Gazorpazorp': 'Газорпазорп',
    'Hamster in Butt World': 'Мир хомяка в заднице',
    'Earth (Giant Telepathic Spiders Dimension)': 'Земля (Измерение гигантских телепатических пауков)',
    'Alphabetrium': 'Алфавитриум',
    'Jerryboree': 'Джеррибори',
    'Krootabulon': 'Крутабулон',
    "Zigerion's Base": 'База Зигерионцев',
    'Pluto': 'Плутон',
    'Fantasy World': 'Мир фэнтези',
    "Zeep Xanflorp's Miniverse": 'Минивселенная Зипа Ксанфлорпа',
    "Kyle's Teenyverse": 'Тинивселенная Кайла',
    "Larva Alien's Planet": 'Планета личинок-пришельцев',
    'Earth (K-22)': 'Земля (K-22)',
    'Mr. Meeseeks Box': 'Коробка мистера Мисикса',
    "Vindicator's Base": 'База Виндикаторов',
    'Pawn Shop Planet': 'Планета-ломбард',
    'Mega Gargantuan Kingdom': 'Мега-гигантское королевство',
    'Gear World': 'Мир шестерёнок',
    'Earth (D-99)': 'Земля (D-99)',
    'Earth (D716)': 'Земля (D716)',
    'Earth (D716-B)': 'Земля (D716-B)',
    'Earth (D716-C)': 'Земля (D716-C)',
    'Earth (J-22)': 'Земля (J-22)',
    'Froopyland': 'Фрупиленд',
    'Detoxifier': 'Детоксификатор',
    'Trunk World': 'Мир хоботов',
    'Plopstar': 'Плопстар',
    'Blips and Chitz': '«Блипы и Читы»',
    'Girvonesk': 'Гирвонеск',
    'Earth (C-35)': 'Земля (C-35)',
    "Snuffles' Dream": 'Сон Снаффлса',
    'Earth (Pizza Dimension)': 'Земля (Измерение пиццы)',
    'Earth (Phone Dimension)': 'Земля (Измерение телефонов)',
    'Greasy Grandma World': 'Мир жирной бабули',
    'Earth (Chair Dimension)': 'Земля (Измерение стульев)',
    'Árboles Mentirosos': 'Лживые деревья',
    'Alien Day Spa': 'Инопланетный спа-салон',
    'Earth (Fascist Dimension)': 'Земля (Фашистское измерение)',
    'Snake Planet': 'Планета змей',
    'Forbodulon Prime': 'Форбодулон Прайм',
    'Earth (Fascist Shrimp Dimension)': 'Земля (Измерение фашистских креветок)',
    'Earth (Fascist Teddy Bear Dimension)': 'Земля (Измерение фашистских плюшевых мишек)',
    'Earth (Wasp Dimension)': 'Земля (Измерение ос)',
    'Monogatron Mothership': 'Корабль-носитель Моногатронов',
    'Gorgon Quadrant': 'Квадрант Горгоны',
    'Midland Quasar': 'Квазар Мидленд',
    'Mount Space Everest': 'Космический Эверест',
    'Globaflyn': 'Глобафлин',
    'Heist-Con': 'Хайст-Кон',
    'Heistotron Base': 'База Хайстотрона',
    'Mount Olympus': 'Гора Олимп',
    'Plitzville Montana': 'Плитсвилль, Монтана',
    'Earth (Tusk Dimension)': 'Земля (Измерение бивней)',
    'Gramuflack': 'Грамуфлак',
    'Draygon': 'Драйгон',
    'New Improved Galactic Federation Quarters': 'Новые улучшенные кварталы Галактической Федерации',
    'Story Train': 'Поезд историй',
    'Non-Diegetic Alternative Reality': 'Недиегетическая альтернативная реальность',
    'Tickets Please Guy Nightmare': 'Кошмар Контролёра',
    "Morty's Story": 'История Морти',
    "Ricks's Story": 'История Рикков',
    'Glorzo Asteroid': 'Астероид Глорзо',
    'Alien Acid Plant': 'Инопланетный кислотный завод',
    'Merged Universe': 'Объединённая вселенная',
    'Near-Duplicate Reality': 'Почти идентичная реальность',
    'NX-5 Planet Remover': 'Планетоуничтожитель NX-5',
    'Gaia': 'Гея',
    "Defiance's Ship": 'Корабль «Дефайанс»',
    "Defiance's Base": 'База «Дефайанс»',
    'The Ocean': 'Океан',
    'Narnia Dimension': 'Измерение Нарнии',
    'Elemental Rings': 'Стихийные кольца',
    'Morglutz': 'Морглутц',
    'Ferkus 9': 'Феркус 9',
    'Morty': 'Морти',
    'Space': 'Космос',
    'Hell': 'Ад',
    'Z. Q. P. D.': 'Z. Q. P. D.',
    'Space Tahoe': 'Космический Тахо',
    'France': 'Франция',
    "Birdperson's Consciousness": 'Сознание Бёрдпёрсона',
    "Rick's Consciousness": 'Сознание Рика',
    'Avian Planet': 'Птичья планета',
    'Normal Size Bug Dimension': 'Измерение жуков обычного размера',
    'Slartivart': 'Слартиварт',
    'Rick and Two Crows Planet': 'Планета Рика и двух ворон',
    "Rick's Memories": 'Воспоминания Рика',
  };
}

/// Удобный доступ к глоссарию прямо из [BuildContext]. Перевод применяется
/// только для русской локали; для английской возвращается исходное значение из
/// API (которое и так на английском).
extension ApiGlossaryX on BuildContext {
  bool get _isRussian =>
      Localizations.localeOf(this).languageCode == 'ru';

  String trSpecies(String raw) => _isRussian ? RuGlossary.species(raw) : raw;
  String trLocationName(String raw) =>
      _isRussian ? RuGlossary.locationName(raw) : raw;
  String trLocationType(String raw) =>
      _isRussian ? RuGlossary.locationType(raw) : raw;
  String trDimension(String raw) =>
      _isRussian ? RuGlossary.dimension(raw) : raw;
  String trEpisodeName(String raw) =>
      _isRussian ? RuGlossary.episode(raw) : raw;
}