// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationFilter {

 String? get name; String? get type; String? get dimension; int get page;
/// Create a copy of LocationFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationFilterCopyWith<LocationFilter> get copyWith => _$LocationFilterCopyWithImpl<LocationFilter>(this as LocationFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.dimension, dimension) || other.dimension == dimension)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,dimension,page);

@override
String toString() {
  return 'LocationFilter(name: $name, type: $type, dimension: $dimension, page: $page)';
}


}

/// @nodoc
abstract mixin class $LocationFilterCopyWith<$Res>  {
  factory $LocationFilterCopyWith(LocationFilter value, $Res Function(LocationFilter) _then) = _$LocationFilterCopyWithImpl;
@useResult
$Res call({
 String? name, String? type, String? dimension, int page
});




}
/// @nodoc
class _$LocationFilterCopyWithImpl<$Res>
    implements $LocationFilterCopyWith<$Res> {
  _$LocationFilterCopyWithImpl(this._self, this._then);

  final LocationFilter _self;
  final $Res Function(LocationFilter) _then;

/// Create a copy of LocationFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? type = freezed,Object? dimension = freezed,Object? page = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,dimension: freezed == dimension ? _self.dimension : dimension // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationFilter].
extension LocationFilterPatterns on LocationFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationFilter value)  $default,){
final _that = this;
switch (_that) {
case _LocationFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationFilter value)?  $default,){
final _that = this;
switch (_that) {
case _LocationFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? type,  String? dimension,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationFilter() when $default != null:
return $default(_that.name,_that.type,_that.dimension,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? type,  String? dimension,  int page)  $default,) {final _that = this;
switch (_that) {
case _LocationFilter():
return $default(_that.name,_that.type,_that.dimension,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? type,  String? dimension,  int page)?  $default,) {final _that = this;
switch (_that) {
case _LocationFilter() when $default != null:
return $default(_that.name,_that.type,_that.dimension,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _LocationFilter extends LocationFilter {
  const _LocationFilter({this.name, this.type, this.dimension, this.page = 1}): super._();
  

@override final  String? name;
@override final  String? type;
@override final  String? dimension;
@override@JsonKey() final  int page;

/// Create a copy of LocationFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationFilterCopyWith<_LocationFilter> get copyWith => __$LocationFilterCopyWithImpl<_LocationFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.dimension, dimension) || other.dimension == dimension)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,type,dimension,page);

@override
String toString() {
  return 'LocationFilter(name: $name, type: $type, dimension: $dimension, page: $page)';
}


}

/// @nodoc
abstract mixin class _$LocationFilterCopyWith<$Res> implements $LocationFilterCopyWith<$Res> {
  factory _$LocationFilterCopyWith(_LocationFilter value, $Res Function(_LocationFilter) _then) = __$LocationFilterCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? type, String? dimension, int page
});




}
/// @nodoc
class __$LocationFilterCopyWithImpl<$Res>
    implements _$LocationFilterCopyWith<$Res> {
  __$LocationFilterCopyWithImpl(this._self, this._then);

  final _LocationFilter _self;
  final $Res Function(_LocationFilter) _then;

/// Create a copy of LocationFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? type = freezed,Object? dimension = freezed,Object? page = null,}) {
  return _then(_LocationFilter(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,dimension: freezed == dimension ? _self.dimension : dimension // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
