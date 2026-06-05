import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/character_enums.dart';

/// Сопоставляет доменные enum'ы с локализованными подписями и цветами темы.
extension CharacterStatusX on CharacterStatus {
  String label(AppLocalizations l10n) => switch (this) {
    CharacterStatus.alive => l10n.statusAlive,
    CharacterStatus.dead => l10n.statusDead,
    CharacterStatus.unknown => l10n.statusUnknown,
  };

  Color color(AppStatusColors colors) => switch (this) {
    CharacterStatus.alive => colors.alive,
    CharacterStatus.dead => colors.dead,
    CharacterStatus.unknown => colors.unknown,
  };
}

extension CharacterGenderX on CharacterGender {
  String label(AppLocalizations l10n) => switch (this) {
    CharacterGender.male => l10n.genderMale,
    CharacterGender.female => l10n.genderFemale,
    CharacterGender.genderless => l10n.genderGenderless,
    CharacterGender.unknown => l10n.genderUnknown,
  };
}

/// Удобный доступ к обоим помощникам прямо из BuildContext.
extension CharacterDisplayContextX on BuildContext {
  String statusLabel(CharacterStatus s) => s.label(l10n);
  Color statusColor(CharacterStatus s) => s.color(statusColors);
  String genderLabel(CharacterGender g) => g.label(l10n);
}
