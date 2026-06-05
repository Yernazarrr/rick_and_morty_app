part of 'characters_list_bloc.dart';

sealed class CharactersListEvent extends Equatable {
  const CharactersListEvent();
  @override
  List<Object?> get props => [];
}

/// Первоначальная загрузка (первая страница).
class CharactersStarted extends CharactersListEvent {
  const CharactersStarted();
}

/// Изменился поисковый запрос (с debounce).
class CharactersSearchChanged extends CharactersListEvent {
  const CharactersSearchChanged(this.query);
  final String query;
  @override
  List<Object?> get props => [query];
}

/// Фильтры, применённые из нижнего листа.
class CharactersFilterApplied extends CharactersListEvent {
  const CharactersFilterApplied({this.status, this.gender, this.species});
  final CharacterStatus? status;
  final CharacterGender? gender;
  final String? species;
  @override
  List<Object?> get props => [status, gender, species];
}

class CharactersFilterReset extends CharactersListEvent {
  const CharactersFilterReset();
}

/// Обновление жестом «потянуть вниз».
class CharactersRefreshed extends CharactersListEvent {
  const CharactersRefreshed();
}

/// Достигнут конец списка — загрузить следующую страницу.
class CharactersNextPageRequested extends CharactersListEvent {
  const CharactersNextPageRequested();
}

/// Переключение между раскладкой списком и сеткой.
class CharactersViewModeToggled extends CharactersListEvent {
  const CharactersViewModeToggled();
}
