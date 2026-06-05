// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locations_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationsResponseModel {

 PageInfoModel get info; List<LocationModel> get results;
/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationsResponseModelCopyWith<LocationsResponseModel> get copyWith => _$LocationsResponseModelCopyWithImpl<LocationsResponseModel>(this as LocationsResponseModel, _$identity);

  /// Serializes this LocationsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationsResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'LocationsResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class $LocationsResponseModelCopyWith<$Res>  {
  factory $LocationsResponseModelCopyWith(LocationsResponseModel value, $Res Function(LocationsResponseModel) _then) = _$LocationsResponseModelCopyWithImpl;
@useResult
$Res call({
 PageInfoModel info, List<LocationModel> results
});


$PageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$LocationsResponseModelCopyWithImpl<$Res>
    implements $LocationsResponseModelCopyWith<$Res> {
  _$LocationsResponseModelCopyWithImpl(this._self, this._then);

  final LocationsResponseModel _self;
  final $Res Function(LocationsResponseModel) _then;

/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoModel,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,
  ));
}
/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoModelCopyWith<$Res> get info {
  
  return $PageInfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationsResponseModel].
extension LocationsResponseModelPatterns on LocationsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageInfoModel info,  List<LocationModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageInfoModel info,  List<LocationModel> results)  $default,) {final _that = this;
switch (_that) {
case _LocationsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageInfoModel info,  List<LocationModel> results)?  $default,) {final _that = this;
switch (_that) {
case _LocationsResponseModel() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationsResponseModel implements LocationsResponseModel {
  const _LocationsResponseModel({required this.info, required final  List<LocationModel> results}): _results = results;
  factory _LocationsResponseModel.fromJson(Map<String, dynamic> json) => _$LocationsResponseModelFromJson(json);

@override final  PageInfoModel info;
 final  List<LocationModel> _results;
@override List<LocationModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationsResponseModelCopyWith<_LocationsResponseModel> get copyWith => __$LocationsResponseModelCopyWithImpl<_LocationsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationsResponseModel&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'LocationsResponseModel(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$LocationsResponseModelCopyWith<$Res> implements $LocationsResponseModelCopyWith<$Res> {
  factory _$LocationsResponseModelCopyWith(_LocationsResponseModel value, $Res Function(_LocationsResponseModel) _then) = __$LocationsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 PageInfoModel info, List<LocationModel> results
});


@override $PageInfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$LocationsResponseModelCopyWithImpl<$Res>
    implements _$LocationsResponseModelCopyWith<$Res> {
  __$LocationsResponseModelCopyWithImpl(this._self, this._then);

  final _LocationsResponseModel _self;
  final $Res Function(_LocationsResponseModel) _then;

/// Create a copy of LocationsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_LocationsResponseModel(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoModel,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<LocationModel>,
  ));
}

/// Create a copy of LocationsResponseModel
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
