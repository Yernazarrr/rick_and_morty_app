import '../../app/api/api.dart';

class CharacterFilters {
  final String? name;
  final CharacterStatus? status;
  final CharacterSpecies? species;
  final String? type;
  final CharacterGender? gender;

  const CharacterFilters({
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });

  bool get isEmpty =>
      name == null &&
      status == null &&
      species == null &&
      type == null &&
      gender == null;
}
