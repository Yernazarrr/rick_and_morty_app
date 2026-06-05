// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Character {

 int get id; String get name; CharacterStatus get status; String get species; String get type; CharacterGender get gender; String get image; CharacterRef get origin; CharacterRef get location; List<int> get episodeIds; DateTime? get created;
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterCopyWith<Character> get copyWith => _$CharacterCopyWithImpl<Character>(this as Character, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.episodeIds, episodeIds)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,image,origin,location,const DeepCollectionEquality().hash(episodeIds),created);

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image, origin: $origin, location: $location, episodeIds: $episodeIds, created: $created)';
}


}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res>  {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) = _$CharacterCopyWithImpl;
@useResult
$Res call({
 int id, String name, CharacterStatus status, String species, String type, CharacterGender gender, String image, CharacterRef origin, CharacterRef location, List<int> episodeIds, DateTime? created
});


$CharacterRefCopyWith<$Res> get origin;$CharacterRefCopyWith<$Res> get location;

}
/// @nodoc
class _$CharacterCopyWithImpl<$Res>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? type = null,Object? gender = null,Object? image = null,Object? origin = null,Object? location = null,Object? episodeIds = null,Object? created = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterRef,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterRef,episodeIds: null == episodeIds ? _self.episodeIds : episodeIds // ignore: cast_nullable_to_non_nullable
as List<int>,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterRefCopyWith<$Res> get origin {
  
  return $CharacterRefCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterRefCopyWith<$Res> get location {
  
  return $CharacterRefCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Character].
extension CharacterPatterns on Character {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Character value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Character value)  $default,){
final _that = this;
switch (_that) {
case _Character():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Character value)?  $default,){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  CharacterStatus status,  String species,  String type,  CharacterGender gender,  String image,  CharacterRef origin,  CharacterRef location,  List<int> episodeIds,  DateTime? created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.image,_that.origin,_that.location,_that.episodeIds,_that.created);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  CharacterStatus status,  String species,  String type,  CharacterGender gender,  String image,  CharacterRef origin,  CharacterRef location,  List<int> episodeIds,  DateTime? created)  $default,) {final _that = this;
switch (_that) {
case _Character():
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.image,_that.origin,_that.location,_that.episodeIds,_that.created);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  CharacterStatus status,  String species,  String type,  CharacterGender gender,  String image,  CharacterRef origin,  CharacterRef location,  List<int> episodeIds,  DateTime? created)?  $default,) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.image,_that.origin,_that.location,_that.episodeIds,_that.created);case _:
  return null;

}
}

}

/// @nodoc


class _Character implements Character {
  const _Character({required this.id, required this.name, required this.status, required this.species, required this.type, required this.gender, required this.image, required this.origin, required this.location, required final  List<int> episodeIds, required this.created}): _episodeIds = episodeIds;
  

@override final  int id;
@override final  String name;
@override final  CharacterStatus status;
@override final  String species;
@override final  String type;
@override final  CharacterGender gender;
@override final  String image;
@override final  CharacterRef origin;
@override final  CharacterRef location;
 final  List<int> _episodeIds;
@override List<int> get episodeIds {
  if (_episodeIds is EqualUnmodifiableListView) return _episodeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodeIds);
}

@override final  DateTime? created;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterCopyWith<_Character> get copyWith => __$CharacterCopyWithImpl<_Character>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._episodeIds, _episodeIds)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,image,origin,location,const DeepCollectionEquality().hash(_episodeIds),created);

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image, origin: $origin, location: $location, episodeIds: $episodeIds, created: $created)';
}


}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(_Character value, $Res Function(_Character) _then) = __$CharacterCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, CharacterStatus status, String species, String type, CharacterGender gender, String image, CharacterRef origin, CharacterRef location, List<int> episodeIds, DateTime? created
});


@override $CharacterRefCopyWith<$Res> get origin;@override $CharacterRefCopyWith<$Res> get location;

}
/// @nodoc
class __$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? type = null,Object? gender = null,Object? image = null,Object? origin = null,Object? location = null,Object? episodeIds = null,Object? created = freezed,}) {
  return _then(_Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as CharacterGender,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterRef,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterRef,episodeIds: null == episodeIds ? _self._episodeIds : episodeIds // ignore: cast_nullable_to_non_nullable
as List<int>,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterRefCopyWith<$Res> get origin {
  
  return $CharacterRefCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterRefCopyWith<$Res> get location {
  
  return $CharacterRefCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

/// @nodoc
mixin _$CharacterRef {

 String get name; int? get locationId;
/// Create a copy of CharacterRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterRefCopyWith<CharacterRef> get copyWith => _$CharacterRefCopyWithImpl<CharacterRef>(this as CharacterRef, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterRef&&(identical(other.name, name) || other.name == name)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}


@override
int get hashCode => Object.hash(runtimeType,name,locationId);

@override
String toString() {
  return 'CharacterRef(name: $name, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class $CharacterRefCopyWith<$Res>  {
  factory $CharacterRefCopyWith(CharacterRef value, $Res Function(CharacterRef) _then) = _$CharacterRefCopyWithImpl;
@useResult
$Res call({
 String name, int? locationId
});




}
/// @nodoc
class _$CharacterRefCopyWithImpl<$Res>
    implements $CharacterRefCopyWith<$Res> {
  _$CharacterRefCopyWithImpl(this._self, this._then);

  final CharacterRef _self;
  final $Res Function(CharacterRef) _then;

/// Create a copy of CharacterRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? locationId = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterRef].
extension CharacterRefPatterns on CharacterRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterRef value)  $default,){
final _that = this;
switch (_that) {
case _CharacterRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterRef value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int? locationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterRef() when $default != null:
return $default(_that.name,_that.locationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int? locationId)  $default,) {final _that = this;
switch (_that) {
case _CharacterRef():
return $default(_that.name,_that.locationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int? locationId)?  $default,) {final _that = this;
switch (_that) {
case _CharacterRef() when $default != null:
return $default(_that.name,_that.locationId);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterRef extends CharacterRef {
  const _CharacterRef({required this.name, this.locationId}): super._();
  

@override final  String name;
@override final  int? locationId;

/// Create a copy of CharacterRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterRefCopyWith<_CharacterRef> get copyWith => __$CharacterRefCopyWithImpl<_CharacterRef>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterRef&&(identical(other.name, name) || other.name == name)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}


@override
int get hashCode => Object.hash(runtimeType,name,locationId);

@override
String toString() {
  return 'CharacterRef(name: $name, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class _$CharacterRefCopyWith<$Res> implements $CharacterRefCopyWith<$Res> {
  factory _$CharacterRefCopyWith(_CharacterRef value, $Res Function(_CharacterRef) _then) = __$CharacterRefCopyWithImpl;
@override @useResult
$Res call({
 String name, int? locationId
});




}
/// @nodoc
class __$CharacterRefCopyWithImpl<$Res>
    implements _$CharacterRefCopyWith<$Res> {
  __$CharacterRefCopyWithImpl(this._self, this._then);

  final _CharacterRef _self;
  final $Res Function(_CharacterRef) _then;

/// Create a copy of CharacterRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? locationId = freezed,}) {
  return _then(_CharacterRef(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
