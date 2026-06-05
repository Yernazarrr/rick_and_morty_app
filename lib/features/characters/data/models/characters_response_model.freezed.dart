// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharactersResponseModel {

 PageInfoModel get info; List<CharacterModel> get results;
/// Create a copy of CharactersResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersResponseModelCopyWith<CharactersResponseModel> get copyWith => _$CharactersResponseModelCopyWithImpl<CharactersResponseModel>(this as CharactersResponseModel, _$identity);

  /// Serializes this CharactersResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CharactersResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class $CharactersResponseModelCopyWith<$Res>  {
  factory $CharactersResponseModelCopyWith(CharactersResponseModel value, $Res Function(CharactersResponseModel) _then) = _$CharactersResponseModelCopyWithImpl;
@useResult
$Res call({
 PageInfoModel info, List<CharacterModel> results
});


$PageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$CharactersResponseModelCopyWithImpl<$Res>
    implements $CharactersResponseModelCopyWith<$Res> {
  _$CharactersResponseModelCopyWithImpl(this._self, this._then);

  final CharactersResponseModel _self;
  final $Res Function(CharactersResponseModel) _then;

/// Create a copy of CharactersResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoModel,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<CharacterModel>,
  ));
}
/// Create a copy of CharactersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoModelCopyWith<$Res> get info {
  
  return $PageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharactersResponseModel].
extension CharactersResponseModelPatterns on CharactersResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharactersResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharactersResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharactersResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CharactersResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharactersResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharactersResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageInfoModel info,  List<CharacterModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageInfoModel info,  List<CharacterModel> results)  $default,) {final _that = this;
switch (_that) {
case _CharactersResponseModel():
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageInfoModel info,  List<CharacterModel> results)?  $default,) {final _that = this;
switch (_that) {
case _CharactersResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharactersResponseModel implements CharactersResponseModel {
  const _CharactersResponseModel({required this.info, required final  List<CharacterModel> results}): _results = results;
  factory _CharactersResponseModel.fromJson(Map<String, dynamic> json) => _$CharactersResponseModelFromJson(json);

@override final  PageInfoModel info;
 final  List<CharacterModel> _results;
@override List<CharacterModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of CharactersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersResponseModelCopyWith<_CharactersResponseModel> get copyWith => __$CharactersResponseModelCopyWithImpl<_CharactersResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharactersResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'CharactersResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CharactersResponseModelCopyWith<$Res> implements $CharactersResponseModelCopyWith<$Res> {
  factory _$CharactersResponseModelCopyWith(_CharactersResponseModel value, $Res Function(_CharactersResponseModel) _then) = __$CharactersResponseModelCopyWithImpl;
@override @useResult
$Res call({
 PageInfoModel info, List<CharacterModel> results
});


@override $PageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$CharactersResponseModelCopyWithImpl<$Res>
    implements _$CharactersResponseModelCopyWith<$Res> {
  __$CharactersResponseModelCopyWithImpl(this._self, this._then);

  final _CharactersResponseModel _self;
  final $Res Function(_CharactersResponseModel) _then;

/// Create a copy of CharactersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_CharactersResponseModel(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoModel,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<CharacterModel>,
  ));
}

/// Create a copy of CharactersResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoModelCopyWith<$Res> get info {
  
  return $PageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
