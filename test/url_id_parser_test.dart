import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/core/utils/url_id_parser.dart';

void main() {
  group('idFromUrl', () {
    test('extracts trailing id', () {
      expect(idFromUrl('https://rickandmortyapi.com/api/episode/28'), 28);
      expect(idFromUrl('https://rickandmortyapi.com/api/character/1/'), 1);
    });

    test('returns null for malformed url', () {
      expect(idFromUrl('https://rickandmortyapi.com/api/episode/'), isNull);
      expect(idFromUrl(''), isNull);
    });
  });

  test('idsFromUrls maps and filters', () {
    final ids = idsFromUrls([
      'https://rickandmortyapi.com/api/character/1',
      'https://rickandmortyapi.com/api/character/2',
      'bad',
    ]);
    expect(ids, [1, 2]);
  });
}
