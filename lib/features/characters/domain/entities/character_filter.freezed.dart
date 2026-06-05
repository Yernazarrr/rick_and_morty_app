// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterFilter {

 String? get name; CharacterStatus? get status; String? get species; CharacterGender? get gender; String? get type; int get page;
/// Create a copy of CharacterFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterFilterCopyWith<CharacterFilter> get copyWith => _$CharacterFilterCopyWithImpl<CharacterFilter>(this as CharacterFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.type, type) || other.type == type)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,status,species,gender,type,page);

@override
String toString() {
  return 'CharacterFilter(name: $name, status: $status, species: $species, gender: $gender, type: $type, page: $page)';
}


}

/// @nodoc
abstract mixin class $CharacterFilterCopyWith<$Res>  {
  factory $CharacterFilterCopyWith(CharacterFilter value, $Res Function(CharacterFilter) _then) = _$CharacterFilterCopyWithImpl;
@useResult
$Res call({
 String? name, CharacterStatus? status, String? species, CharacterGender? gender, String? type, int page
});




}
/// @nodoc
class _$CharacterFilterCopyWithImpl<$Res>
    implements $CharacterFilterCopyWith<$Res> {
  _$CharacterFilterCopyWithImpl(this._self, this._then);

  final CharacterFilter _self;
  final $Res Function(CharacterFilter) _then;

/// Create a copy of CharacterFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? gender = freezed,Object? type = freezed,Object? page = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterFilter].
extension CharacterFilterPatterns on CharacterFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterFilter value)  $default,){
final _that = this;
switch (_that) {
case _CharacterFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterFilter value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  CharacterStatus? status,  String? species,  CharacterGender? gender,  String? type,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterFilter() when $default != null:
return $default(_that.name,_that.status,_that.species,_that.gender,_that.type,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  CharacterStatus? status,  String? species,  CharacterGender? gender,  String? type,  int page)  $default,) {final _that = this;
switch (_that) {
case _CharacterFilter():
return $default(_that.name,_that.status,_that.species,_that.gender,_that.type,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  CharacterStatus? status,  String? species,  CharacterGender? gender,  String? type,  int page)?  $default,) {final _that = this;
switch (_that) {
case _CharacterFilter() when $default != null:
return $default(_that.name,_that.status,_that.species,_that.gender,_that.type,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterFilter extends CharacterFilter {
  const _CharacterFilter({this.name, this.status, this.species, this.gender, this.type, this.page = 1}): super._();
  

@override final  String? name;
@override final  CharacterStatus? status;
@override final  String? species;
@override final  CharacterGender? gender;
@override final  String? type;
@override@JsonKey() final  int page;

/// Create a copy of CharacterFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterFilterCopyWith<_CharacterFilter> get copyWith => __$CharacterFilterCopyWithImpl<_CharacterFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.type, type) || other.type == type)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,status,species,gender,type,page);

@override
String toString() {
  return 'CharacterFilter(name: $name, status: $status, species: $species, gender: $gender, type: $type, page: $page)';
}


}

/// @nodoc
abstract mixin class _$CharacterFilterCopyWith<$Res> implements $CharacterFilterCopyWith<$Res> {
  factory _$CharacterFilterCopyWith(_CharacterFilter value, $Res Function(_CharacterFilter) _then) = __$CharacterFilterCopyWithImpl;
@override @useResult
$Res call({
 String? name, CharacterStatus? status, String? species, CharacterGender? gender, String? type, int page
});




}
/// @nodoc
class __$CharacterFilterCopyWithImpl<$Res>
    implements _$CharacterFilterCopyWith<$Res> {
  __$CharacterFilterCopyWithImpl(this._self, this._then);

  final _CharacterFilter _self;
  final $Res Function(_CharacterFilter) _then;

/// Create a copy of CharacterFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? status = freezed,Object? species = freezed,Object? gender = freezed,Object? type = freezed,Object? page = null,}) {
  return _then(_CharacterFilter(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
