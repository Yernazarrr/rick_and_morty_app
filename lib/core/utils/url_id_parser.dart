/// Извлекает завершающий числовой id из URL ресурса «Рик и Морти».
/// Пример: `https://rickandmortyapi.com/api/episode/28` -> 28.
int? idFromUrl(String url) {
  final match = RegExp(r'/(\d+)/?$').firstMatch(url.trim());
  if (match == null) return null;
  return int.tryParse(match.group(1)!);
}

List<int> idsFromUrls(Iterable<String> urls) =>
    urls.map(idFromUrl).whereType<int>().toList();
