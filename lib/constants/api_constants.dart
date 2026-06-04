/// Эндпойнты и конфигурация для REST API Рика и Морти.
/// Документация: https://rickandmortyapi.com/documentation
abstract final class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'https://rickandmortyapi.com/api';

  static const String characters = '/character';
  static const String locations = '/location';
  static const String episodes = '/episode';

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 20);
}
