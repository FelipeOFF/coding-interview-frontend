// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendationModel {

 String get totalTax; String get totalAmount; DateTime get estToFinish;
/// Create a copy of RecommendationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationModelCopyWith<RecommendationModel> get copyWith => _$RecommendationModelCopyWithImpl<RecommendationModel>(this as RecommendationModel, _$identity);

  /// Serializes this RecommendationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationModel&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.estToFinish, estToFinish) || other.estToFinish == estToFinish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTax,totalAmount,estToFinish);

@override
String toString() {
  return 'RecommendationModel(totalTax: $totalTax, totalAmount: $totalAmount, estToFinish: $estToFinish)';
}


}

/// @nodoc
abstract mixin class $RecommendationModelCopyWith<$Res>  {
  factory $RecommendationModelCopyWith(RecommendationModel value, $Res Function(RecommendationModel) _then) = _$RecommendationModelCopyWithImpl;
@useResult
$Res call({
 String totalTax, String totalAmount, DateTime estToFinish
});




}
/// @nodoc
class _$RecommendationModelCopyWithImpl<$Res>
    implements $RecommendationModelCopyWith<$Res> {
  _$RecommendationModelCopyWithImpl(this._self, this._then);

  final RecommendationModel _self;
  final $Res Function(RecommendationModel) _then;

/// Create a copy of RecommendationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalTax = null,Object? totalAmount = null,Object? estToFinish = null,}) {
  return _then(_self.copyWith(
totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,estToFinish: null == estToFinish ? _self.estToFinish : estToFinish // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendationModel].
extension RecommendationModelPatterns on RecommendationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationModel value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String totalTax,  String totalAmount,  DateTime estToFinish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationModel() when $default != null:
return $default(_that.totalTax,_that.totalAmount,_that.estToFinish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String totalTax,  String totalAmount,  DateTime estToFinish)  $default,) {final _that = this;
switch (_that) {
case _RecommendationModel():
return $default(_that.totalTax,_that.totalAmount,_that.estToFinish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String totalTax,  String totalAmount,  DateTime estToFinish)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationModel() when $default != null:
return $default(_that.totalTax,_that.totalAmount,_that.estToFinish);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationModel implements RecommendationModel {
  const _RecommendationModel({required this.totalTax, required this.totalAmount, required this.estToFinish});
  factory _RecommendationModel.fromJson(Map<String, dynamic> json) => _$RecommendationModelFromJson(json);

@override final  String totalTax;
@override final  String totalAmount;
@override final  DateTime estToFinish;

/// Create a copy of RecommendationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationModelCopyWith<_RecommendationModel> get copyWith => __$RecommendationModelCopyWithImpl<_RecommendationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationModel&&(identical(other.totalTax, totalTax) || other.totalTax == totalTax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.estToFinish, estToFinish) || other.estToFinish == estToFinish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTax,totalAmount,estToFinish);

@override
String toString() {
  return 'RecommendationModel(totalTax: $totalTax, totalAmount: $totalAmount, estToFinish: $estToFinish)';
}


}

/// @nodoc
abstract mixin class _$RecommendationModelCopyWith<$Res> implements $RecommendationModelCopyWith<$Res> {
  factory _$RecommendationModelCopyWith(_RecommendationModel value, $Res Function(_RecommendationModel) _then) = __$RecommendationModelCopyWithImpl;
@override @useResult
$Res call({
 String totalTax, String totalAmount, DateTime estToFinish
});




}
/// @nodoc
class __$RecommendationModelCopyWithImpl<$Res>
    implements _$RecommendationModelCopyWith<$Res> {
  __$RecommendationModelCopyWithImpl(this._self, this._then);

  final _RecommendationModel _self;
  final $Res Function(_RecommendationModel) _then;

/// Create a copy of RecommendationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalTax = null,Object? totalAmount = null,Object? estToFinish = null,}) {
  return _then(_RecommendationModel(
totalTax: null == totalTax ? _self.totalTax : totalTax // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,estToFinish: null == estToFinish ? _self.estToFinish : estToFinish // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
