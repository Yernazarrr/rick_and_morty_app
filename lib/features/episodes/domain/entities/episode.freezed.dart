// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Episode {

 int get id; String get name; String get airDate;/// Сырой код эпизода, например "S01E10".
 String get code;/// Разобранный номер сезона (начиная с 1).
 int get season;/// Разобранный номер эпизода внутри сезона (начиная с 1).
 int get numberInSeason; List<int> get characterIds; DateTime? get created;
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeCopyWith<Episode> get copyWith => _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Episode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.code, code) || other.code == code)&&(identical(other.season, season) || other.season == season)&&(identical(other.numberInSeason, numberInSeason) || other.numberInSeason == numberInSeason)&&const DeepCollectionEquality().equals(other.characterIds, characterIds)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,airDate,code,season,numberInSeason,const DeepCollectionEquality().hash(characterIds),created);

@override
String toString() {
  return 'Episode(id: $id, name: $name, airDate: $airDate, code: $code, season: $season, numberInSeason: $numberInSeason, characterIds: $characterIds, created: $created)';
}


}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res>  {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) = _$EpisodeCopyWithImpl;
@useResult
$Res call({
 int id, String name, String airDate, String code, int season, int numberInSeason, List<int> characterIds, DateTime? created
});




}
/// @nodoc
class _$EpisodeCopyWithImpl<$Res>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? airDate = null,Object? code = null,Object? season = null,Object? numberInSeason = null,Object? characterIds = null,Object? created = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,airDate: null == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,numberInSeason: null == numberInSeason ? _self.numberInSeason : numberInSeason // ignore: cast_nullable_to_non_nullable
as int,characterIds: null == characterIds ? _self.characterIds : characterIds // ignore: cast_nullable_to_non_nullable
as List<int>,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Episode].
extension EpisodePatterns on Episode {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Episode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Episode value)  $default,){
final _that = this;
switch (_that) {
case _Episode():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Episode value)?  $default,){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String airDate,  String code,  int season,  int numberInSeason,  List<int> characterIds,  DateTime? created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.id,_that.name,_that.airDate,_that.code,_that.season,_that.numberInSeason,_that.characterIds,_that.created);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String airDate,  String code,  int season,  int numberInSeason,  List<int> characterIds,  DateTime? created)  $default,) {final _that = this;
switch (_that) {
case _Episode():
return $default(_that.id,_that.name,_that.airDate,_that.code,_that.season,_that.numberInSeason,_that.characterIds,_that.created);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String airDate,  String code,  int season,  int numberInSeason,  List<int> characterIds,  DateTime? created)?  $default,) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.id,_that.name,_that.airDate,_that.code,_that.season,_that.numberInSeason,_that.characterIds,_that.created);case _:
  return null;

}
}

}

/// @nodoc


class _Episode implements Episode {
  const _Episode({required this.id, required this.name, required this.airDate, required this.code, required this.season, required this.numberInSeason, required final  List<int> characterIds, required this.created}): _characterIds = characterIds;
  

@override final  int id;
@override final  String name;
@override final  String airDate;
/// Сырой код эпизода, например "S01E10".
@override final  String code;
/// Разобранный номер сезона (начиная с 1).
@override final  int season;
/// Разобранный номер эпизода внутри сезона (начиная с 1).
@override final  int numberInSeason;
 final  List<int> _characterIds;
@override List<int> get characterIds {
  if (_characterIds is EqualUnmodifiableListView) return _characterIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characterIds);
}

@override final  DateTime? created;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeCopyWith<_Episode> get copyWith => __$EpisodeCopyWithImpl<_Episode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Episode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.airDate, airDate) || other.airDate == airDate)&&(identical(other.code, code) || other.code == code)&&(identical(other.season, season) || other.season == season)&&(identical(other.numberInSeason, numberInSeason) || other.numberInSeason == numberInSeason)&&const DeepCollectionEquality().equals(other._characterIds, _characterIds)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,airDate,code,season,numberInSeason,const DeepCollectionEquality().hash(_characterIds),created);

@override
String toString() {
  return 'Episode(id: $id, name: $name, airDate: $airDate, code: $code, season: $season, numberInSeason: $numberInSeason, characterIds: $characterIds, created: $created)';
}


}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) = __$EpisodeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String airDate, String code, int season, int numberInSeason, List<int> characterIds, DateTime? created
});




}
/// @nodoc
class __$EpisodeCopyWithImpl<$Res>
    implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? airDate = null,Object? code = null,Object? season = null,Object? numberInSeason = null,Object? characterIds = null,Object? created = freezed,}) {
  return _then(_Episode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,airDate: null == airDate ? _self.airDate : airDate // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,numberInSeason: null == numberInSeason ? _self.numberInSeason : numberInSeason // ignore: cast_nullable_to_non_nullable
as int,characterIds: null == characterIds ? _self._characterIds : characterIds // ignore: cast_nullable_to_non_nullable
as List<int>,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
