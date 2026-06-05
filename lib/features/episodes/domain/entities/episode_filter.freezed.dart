// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EpisodeFilter {

 String? get name;/// Фильтр по коду эпизода, например "S01".
 String? get episode; int get page;
/// Create a copy of EpisodeFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeFilterCopyWith<EpisodeFilter> get copyWith => _$EpisodeFilterCopyWithImpl<EpisodeFilter>(this as EpisodeFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,episode,page);

@override
String toString() {
  return 'EpisodeFilter(name: $name, episode: $episode, page: $page)';
}


}

/// @nodoc
abstract mixin class $EpisodeFilterCopyWith<$Res>  {
  factory $EpisodeFilterCopyWith(EpisodeFilter value, $Res Function(EpisodeFilter) _then) = _$EpisodeFilterCopyWithImpl;
@useResult
$Res call({
 String? name, String? episode, int page
});




}
/// @nodoc
class _$EpisodeFilterCopyWithImpl<$Res>
    implements $EpisodeFilterCopyWith<$Res> {
  _$EpisodeFilterCopyWithImpl(this._self, this._then);

  final EpisodeFilter _self;
  final $Res Function(EpisodeFilter) _then;

/// Create a copy of EpisodeFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? episode = freezed,Object? page = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeFilter].
extension EpisodeFilterPatterns on EpisodeFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeFilter value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeFilter value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? episode,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeFilter() when $default != null:
return $default(_that.name,_that.episode,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? episode,  int page)  $default,) {final _that = this;
switch (_that) {
case _EpisodeFilter():
return $default(_that.name,_that.episode,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? episode,  int page)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeFilter() when $default != null:
return $default(_that.name,_that.episode,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _EpisodeFilter extends EpisodeFilter {
  const _EpisodeFilter({this.name, this.episode, this.page = 1}): super._();
  

@override final  String? name;
/// Фильтр по коду эпизода, например "S01".
@override final  String? episode;
@override@JsonKey() final  int page;

/// Create a copy of EpisodeFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeFilterCopyWith<_EpisodeFilter> get copyWith => __$EpisodeFilterCopyWithImpl<_EpisodeFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeFilter&&(identical(other.name, name) || other.name == name)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,name,episode,page);

@override
String toString() {
  return 'EpisodeFilter(name: $name, episode: $episode, page: $page)';
}


}

/// @nodoc
abstract mixin class _$EpisodeFilterCopyWith<$Res> implements $EpisodeFilterCopyWith<$Res> {
  factory _$EpisodeFilterCopyWith(_EpisodeFilter value, $Res Function(_EpisodeFilter) _then) = __$EpisodeFilterCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? episode, int page
});




}
/// @nodoc
class __$EpisodeFilterCopyWithImpl<$Res>
    implements _$EpisodeFilterCopyWith<$Res> {
  __$EpisodeFilterCopyWithImpl(this._self, this._then);

  final _EpisodeFilter _self;
  final $Res Function(_EpisodeFilter) _then;

/// Create a copy of EpisodeFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? episode = freezed,Object? page = null,}) {
  return _then(_EpisodeFilter(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,episode: freezed == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
