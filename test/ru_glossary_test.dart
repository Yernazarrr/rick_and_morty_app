import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/core/localization/ru_glossary.dart';

void main() {
  group('RuGlossary.species', () {
    test('translates known species', () {
      expect(RuGlossary.species('Human'), 'Человек');
      expect(RuGlossary.species('Alien'), 'Пришелец');
      expect(RuGlossary.species('unknown'), 'Неизвестно');
    });

    test('returns the original for unknown values', () {
      expect(RuGlossary.species('Time Lord'), 'Time Lord');
    });
  });

  group('RuGlossary.locationName', () {
    test('translates names from the example', () {
      expect(RuGlossary.locationName('Earth (C-137)'), 'Земля (C-137)');
      expect(RuGlossary.locationName('Citadel of Ricks'), 'Цитадель Рикков');
    });

    test('normalizes curly apostrophes coming from the API', () {
      // The API serves these names with U+2019, not a straight apostrophe.
      expect(RuGlossary.locationName('Morty’s Story'), 'История Морти');
      expect(RuGlossary.locationName('Ricks’s Story'), 'История Рикков');
    });
  });

  group('RuGlossary.episode', () {
    test('translates known episode titles', () {
      expect(RuGlossary.episode('Pilot'), 'Пилот');
      expect(RuGlossary.episode('Pickle Rick'), 'Огурчик Рик');
    });
  });

  group('RuGlossary.dimension / locationType', () {
    test('translates known values and falls back otherwise', () {
      expect(RuGlossary.dimension('Dimension C-137'), 'Измерение C-137');
      expect(RuGlossary.locationType('Planet'), 'Планета');
      expect(RuGlossary.locationType('Made up type'), 'Made up type');
    });
  });
}