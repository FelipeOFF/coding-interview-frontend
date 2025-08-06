// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendationReq {

 int get type; RecommendationCurrency get cryptoCurrencyId; RecommendationCurrency get fiatCurrencyId; double get amount; RecommendationCurrency get amountCurrencyId;
/// Create a copy of RecommendationReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationReqCopyWith<RecommendationReq> get copyWith => _$RecommendationReqCopyWithImpl<RecommendationReq>(this as RecommendationReq, _$identity);

  /// Serializes this RecommendationReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationReq&&(identical(other.type, type) || other.type == type)&&(identical(other.cryptoCurrencyId, cryptoCurrencyId) || other.cryptoCurrencyId == cryptoCurrencyId)&&(identical(other.fiatCurrencyId, fiatCurrencyId) || other.fiatCurrencyId == fiatCurrencyId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountCurrencyId, amountCurrencyId) || other.amountCurrencyId == amountCurrencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,cryptoCurrencyId,fiatCurrencyId,amount,amountCurrencyId);

@override
String toString() {
  return 'RecommendationReq(type: $type, cryptoCurrencyId: $cryptoCurrencyId, fiatCurrencyId: $fiatCurrencyId, amount: $amount, amountCurrencyId: $amountCurrencyId)';
}


}

/// @nodoc
abstract mixin class $RecommendationReqCopyWith<$Res>  {
  factory $RecommendationReqCopyWith(RecommendationReq value, $Res Function(RecommendationReq) _then) = _$RecommendationReqCopyWithImpl;
@useResult
$Res call({
 int type, RecommendationCurrency cryptoCurrencyId, RecommendationCurrency fiatCurrencyId, double amount, RecommendationCurrency amountCurrencyId
});




}
/// @nodoc
class _$RecommendationReqCopyWithImpl<$Res>
    implements $RecommendationReqCopyWith<$Res> {
  _$RecommendationReqCopyWithImpl(this._self, this._then);

  final RecommendationReq _self;
  final $Res Function(RecommendationReq) _then;

/// Create a copy of RecommendationReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? cryptoCurrencyId = null,Object? fiatCurrencyId = null,Object? amount = null,Object? amountCurrencyId = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,cryptoCurrencyId: null == cryptoCurrencyId ? _self.cryptoCurrencyId : cryptoCurrencyId // ignore: cast_nullable_to_non_nullable
as RecommendationCurrency,fiatCurrencyId: null == fiatCurrencyId ? _self.fiatCurrencyId : fiatCurrencyId // ignore: cast_nullable_to_non_nullable
as RecommendationCurrency,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountCurrencyId: null == amountCurrencyId ? _self.amountCurrencyId : amountCurrencyId // ignore: cast_nullable_to_non_nullable
as RecommendationCurrency,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendationReq].
extension RecommendationReqPatterns on RecommendationReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationReq value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationReq value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int type,  RecommendationCurrency cryptoCurrencyId,  RecommendationCurrency fiatCurrencyId,  double amount,  RecommendationCurrency amountCurrencyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationReq() when $default != null:
return $default(_that.type,_that.cryptoCurrencyId,_that.fiatCurrencyId,_that.amount,_that.amountCurrencyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int type,  RecommendationCurrency cryptoCurrencyId,  RecommendationCurrency fiatCurrencyId,  double amount,  RecommendationCurrency amountCurrencyId)  $default,) {final _that = this;
switch (_that) {
case _RecommendationReq():
return $default(_that.type,_that.cryptoCurrencyId,_that.fiatCurrencyId,_that.amount,_that.amountCurrencyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int type,  RecommendationCurrency cryptoCurrencyId,  RecommendationCurrency fiatCurrencyId,  double amount,  RecommendationCurrency amountCurrencyId)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationReq() when $default != null:
return $default(_that.type,_that.cryptoCurrencyId,_that.fiatCurrencyId,_that.amount,_that.amountCurrencyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationReq implements RecommendationReq {
  const _RecommendationReq({required this.type, required this.cryptoCurrencyId, required this.fiatCurrencyId, required this.amount, required this.amountCurrencyId});
  factory _RecommendationReq.fromJson(Map<String, dynamic> json) => _$RecommendationReqFromJson(json);

@override final  int type;
@override final  RecommendationCurrency cryptoCurrencyId;
@override final  RecommendationCurrency fiatCurrencyId;
@override final  double amount;
@override final  RecommendationCurrency amountCurrencyId;

/// Create a copy of RecommendationReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationReqCopyWith<_RecommendationReq> get copyWith => __$RecommendationReqCopyWithImpl<_RecommendationReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationReq&&(identical(other.type, type) || other.type == type)&&(identical(other.cryptoCurrencyId, cryptoCurrencyId) || other.cryptoCurrencyId == cryptoCurrencyId)&&(identical(other.fiatCurrencyId, fiatCurrencyId) || other.fiatCurrencyId == fiatCurrencyId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountCurrencyId, amountCurrencyId) || other.amountCurrencyId == amountCurrencyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,cryptoCurrencyId,fiatCurrencyId,amount,amountCurrencyId);

@override
String toString() {
  return 'RecommendationReq(type: $type, cryptoCurrencyId: $cryptoCurrencyId, fiatCurrencyId: $fiatCurrencyId, amount: $amount, amountCurrencyId: $amountCurrencyId)';
}


}

/// @nodoc
abstract mixin class _$RecommendationReqCopyWith<$Res> implements $RecommendationReqCopyWith<$Res> {
  factory _$RecommendationReqCopyWith(_RecommendationReq value, $Res Function(_RecommendationReq) _then) = __$RecommendationReqCopyWithImpl;
@override @useResult
$Res call({
 int type, RecommendationCurrency cryptoCurrencyId, RecommendationCurrency fiatCurrencyId, double amount, RecommendationCurrency amountCurrencyId
});




}
/// @nodoc
class __$RecommendationReqCopyWithImpl<$Res>
    implements _$RecommendationReqCopyWith<$Res> {
  __$RecommendationReqCopyWithImpl(this._self, this._then);

  final _RecommendationReq _self;
  final $Res Function(_RecommendationReq) _then;

/// Create a copy of RecommendationReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? cryptoCurrencyId = null,Object? fiatCurrencyId = null,Object? amount = null,Object? amountCurrencyId = null,}) {
  return _then(_RecommendationReq(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,cryptoCurrencyId: null == cryptoCurrencyId ? _self.cryptoCurrencyId : cryptoCurrencyId // ignore: cast_nullable_to_non_nullable
as RecommendationCurrency,fiatCurrencyId: null == fiatCurrencyId ? _self.fiatCurrencyId : fiatCurrencyId // ignore: cast_nullable_to_non_nullable
as RecommendationCurrency,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountCurrencyId: null == amountCurrencyId ? _self.amountCurrencyId : amountCurrencyId // ignore: cast_nullable_to_non_nullable
as RecommendationCurrency,
  ));
}


}

// dart format on
