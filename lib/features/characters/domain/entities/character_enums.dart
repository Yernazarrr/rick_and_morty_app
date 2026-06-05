/// Жизненный статус персонажа.
enum CharacterStatus {
  alive,
  dead,
  unknown;

  static CharacterStatus fromApi(String? raw) =>
      switch (raw?.toLowerCase()) {
        'alive' => CharacterStatus.alive,
        'dead' => CharacterStatus.dead,
        _ => CharacterStatus.unknown,
      };

  String get apiValue => switch (this) {
        CharacterStatus.alive => 'alive',
        CharacterStatus.dead => 'dead',
        CharacterStatus.unknown => 'unknown',
      };
}

/// Пол персонажа.
enum CharacterGender {
  female,
  male,
  genderless,
  unknown;

  static CharacterGender fromApi(String? raw) =>
      switch (raw?.toLowerCase()) {
        'female' => CharacterGender.female,
        'male' => CharacterGender.male,
        'genderless' => CharacterGender.genderless,
        _ => CharacterGender.unknown,
      };

  String get apiValue => switch (this) {
        CharacterGender.female => 'female',
        CharacterGender.male => 'male',
        CharacterGender.genderless => 'genderless',
        CharacterGender.unknown => 'unknown',
      };
}
