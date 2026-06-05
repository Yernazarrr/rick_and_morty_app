import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

/// Локальный редактируемый профиль пользователя для экрана настроек.
/// Не относится к API «Рик и Морти» — хранится только на устройстве.
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String name,
    required String nickname,
  }) = _UserProfile;

  /// Значение профиля по умолчанию.
  static const UserProfile initial =
      UserProfile(name: 'Oleg Belotserkovsky', nickname: 'Rick');
}
