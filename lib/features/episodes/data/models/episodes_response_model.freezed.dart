// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episodes_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodesResponseModel {

 PageInfoModel get info; List<EpisodeModel> get results;
/// Create a copy of EpisodesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodesResponseModelCopyWith<EpisodesResponseModel> get copyWith => _$EpisodesResponseModelCopyWithImpl<EpisodesResponseModel>(this as EpisodesResponseModel, _$identity);

  /// Serializes this EpisodesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodesResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'EpisodesResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class $EpisodesResponseModelCopyWith<$Res>  {
  factory $EpisodesResponseModelCopyWith(EpisodesResponseModel value, $Res Function(EpisodesResponseModel) _then) = _$EpisodesResponseModelCopyWithImpl;
@useResult
$Res call({
 PageInfoModel info, List<EpisodeModel> results
});


$PageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$EpisodesResponseModelCopyWithImpl<$Res>
    implements $EpisodesResponseModelCopyWith<$Res> {
  _$EpisodesResponseModelCopyWithImpl(this._self, this._then);

  final EpisodesResponseModel _self;
  final $Res Function(EpisodesResponseModel) _then;

/// Create a copy of EpisodesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoModel,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<EpisodeModel>,
  ));
}
/// Create a copy of EpisodesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoModelCopyWith<$Res> get info {
  
  return $PageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [EpisodesResponseModel].
extension EpisodesResponseModelPatterns on EpisodesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _EpisodesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageInfoModel info,  List<EpisodeModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodesResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageInfoModel info,  List<EpisodeModel> results)  $default,) {final _that = this;
switch (_that) {
case _EpisodesResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageInfoModel info,  List<EpisodeModel> results)?  $default,) {final _that = this;
switch (_that) {
case _EpisodesResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodesResponseModel implements EpisodesResponseModel {
  const _EpisodesResponseModel({required this.info, required final  List<EpisodeModel> results}): _results = results;
  factory _EpisodesResponseModel.fromJson(Map<String, dynamic> json) => _$EpisodesResponseModelFromJson(json);

@override final  PageInfoModel info;
 final  List<EpisodeModel> _results;
@override List<EpisodeModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of EpisodesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodesResponseModelCopyWith<_EpisodesResponseModel> get copyWith => __$EpisodesResponseModelCopyWithImpl<_EpisodesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodesResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'EpisodesResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$EpisodesResponseModelCopyWith<$Res> implements $EpisodesResponseModelCopyWith<$Res> {
  factory _$EpisodesResponseModelCopyWith(_EpisodesResponseModel value, $Res Function(_EpisodesResponseModel) _then) = __$EpisodesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 PageInfoModel info, List<EpisodeModel> results
});


@override $PageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$EpisodesResponseModelCopyWithImpl<$Res>
    implements _$EpisodesResponseModelCopyWith<$Res> {
  __$EpisodesResponseModelCopyWithImpl(this._self, this._then);

  final _EpisodesResponseModel _self;
  final $Res Function(_EpisodesResponseModel) _then;

/// Create a copy of EpisodesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_EpisodesResponseModel(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoModel,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<EpisodeModel>,
  ));
}

/// Create a copy of EpisodesResponseModel
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
