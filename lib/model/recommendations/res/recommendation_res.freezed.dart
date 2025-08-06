// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendationRes {

 RecommendationResData? get data;
/// Create a copy of RecommendationRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationResCopyWith<RecommendationRes> get copyWith => _$RecommendationResCopyWithImpl<RecommendationRes>(this as RecommendationRes, _$identity);

  /// Serializes this RecommendationRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationRes&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'RecommendationRes(data: $data)';
}


}

/// @nodoc
abstract mixin class $RecommendationResCopyWith<$Res>  {
  factory $RecommendationResCopyWith(RecommendationRes value, $Res Function(RecommendationRes) _then) = _$RecommendationResCopyWithImpl;
@useResult
$Res call({
 RecommendationResData? data
});


$RecommendationResDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$RecommendationResCopyWithImpl<$Res>
    implements $RecommendationResCopyWith<$Res> {
  _$RecommendationResCopyWithImpl(this._self, this._then);

  final RecommendationRes _self;
  final $Res Function(RecommendationRes) _then;

/// Create a copy of RecommendationRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecommendationResData?,
  ));
}
/// Create a copy of RecommendationRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationResDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RecommendationResDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendationRes].
extension RecommendationResPatterns on RecommendationRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationRes value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationRes value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecommendationResData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationRes() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecommendationResData? data)  $default,) {final _that = this;
switch (_that) {
case _RecommendationRes():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecommendationResData? data)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationRes() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationRes implements RecommendationRes {
  const _RecommendationRes({this.data});
  factory _RecommendationRes.fromJson(Map<String, dynamic> json) => _$RecommendationResFromJson(json);

@override final  RecommendationResData? data;

/// Create a copy of RecommendationRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationResCopyWith<_RecommendationRes> get copyWith => __$RecommendationResCopyWithImpl<_RecommendationRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationRes&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'RecommendationRes(data: $data)';
}


}

/// @nodoc
abstract mixin class _$RecommendationResCopyWith<$Res> implements $RecommendationResCopyWith<$Res> {
  factory _$RecommendationResCopyWith(_RecommendationRes value, $Res Function(_RecommendationRes) _then) = __$RecommendationResCopyWithImpl;
@override @useResult
$Res call({
 RecommendationResData? data
});


@override $RecommendationResDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$RecommendationResCopyWithImpl<$Res>
    implements _$RecommendationResCopyWith<$Res> {
  __$RecommendationResCopyWithImpl(this._self, this._then);

  final _RecommendationRes _self;
  final $Res Function(_RecommendationRes) _then;

/// Create a copy of RecommendationRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_RecommendationRes(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecommendationResData?,
  ));
}

/// Create a copy of RecommendationRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationResDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RecommendationResDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RecommendationResData {

 RecommendationResDataByPrice? get byPrice;
/// Create a copy of RecommendationResData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationResDataCopyWith<RecommendationResData> get copyWith => _$RecommendationResDataCopyWithImpl<RecommendationResData>(this as RecommendationResData, _$identity);

  /// Serializes this RecommendationResData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationResData&&(identical(other.byPrice, byPrice) || other.byPrice == byPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,byPrice);

@override
String toString() {
  return 'RecommendationResData(byPrice: $byPrice)';
}


}

/// @nodoc
abstract mixin class $RecommendationResDataCopyWith<$Res>  {
  factory $RecommendationResDataCopyWith(RecommendationResData value, $Res Function(RecommendationResData) _then) = _$RecommendationResDataCopyWithImpl;
@useResult
$Res call({
 RecommendationResDataByPrice? byPrice
});


$RecommendationResDataByPriceCopyWith<$Res>? get byPrice;

}
/// @nodoc
class _$RecommendationResDataCopyWithImpl<$Res>
    implements $RecommendationResDataCopyWith<$Res> {
  _$RecommendationResDataCopyWithImpl(this._self, this._then);

  final RecommendationResData _self;
  final $Res Function(RecommendationResData) _then;

/// Create a copy of RecommendationResData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? byPrice = freezed,}) {
  return _then(_self.copyWith(
byPrice: freezed == byPrice ? _self.byPrice : byPrice // ignore: cast_nullable_to_non_nullable
as RecommendationResDataByPrice?,
  ));
}
/// Create a copy of RecommendationResData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationResDataByPriceCopyWith<$Res>? get byPrice {
    if (_self.byPrice == null) {
    return null;
  }

  return $RecommendationResDataByPriceCopyWith<$Res>(_self.byPrice!, (value) {
    return _then(_self.copyWith(byPrice: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendationResData].
extension RecommendationResDataPatterns on RecommendationResData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationResData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationResData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationResData value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationResData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationResData value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationResData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecommendationResDataByPrice? byPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationResData() when $default != null:
return $default(_that.byPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecommendationResDataByPrice? byPrice)  $default,) {final _that = this;
switch (_that) {
case _RecommendationResData():
return $default(_that.byPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecommendationResDataByPrice? byPrice)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationResData() when $default != null:
return $default(_that.byPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationResData implements RecommendationResData {
  const _RecommendationResData({this.byPrice});
  factory _RecommendationResData.fromJson(Map<String, dynamic> json) => _$RecommendationResDataFromJson(json);

@override final  RecommendationResDataByPrice? byPrice;

/// Create a copy of RecommendationResData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationResDataCopyWith<_RecommendationResData> get copyWith => __$RecommendationResDataCopyWithImpl<_RecommendationResData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationResDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationResData&&(identical(other.byPrice, byPrice) || other.byPrice == byPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,byPrice);

@override
String toString() {
  return 'RecommendationResData(byPrice: $byPrice)';
}


}

/// @nodoc
abstract mixin class _$RecommendationResDataCopyWith<$Res> implements $RecommendationResDataCopyWith<$Res> {
  factory _$RecommendationResDataCopyWith(_RecommendationResData value, $Res Function(_RecommendationResData) _then) = __$RecommendationResDataCopyWithImpl;
@override @useResult
$Res call({
 RecommendationResDataByPrice? byPrice
});


@override $RecommendationResDataByPriceCopyWith<$Res>? get byPrice;

}
/// @nodoc
class __$RecommendationResDataCopyWithImpl<$Res>
    implements _$RecommendationResDataCopyWith<$Res> {
  __$RecommendationResDataCopyWithImpl(this._self, this._then);

  final _RecommendationResData _self;
  final $Res Function(_RecommendationResData) _then;

/// Create a copy of RecommendationResData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? byPrice = freezed,}) {
  return _then(_RecommendationResData(
byPrice: freezed == byPrice ? _self.byPrice : byPrice // ignore: cast_nullable_to_non_nullable
as RecommendationResDataByPrice?,
  ));
}

/// Create a copy of RecommendationResData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendationResDataByPriceCopyWith<$Res>? get byPrice {
    if (_self.byPrice == null) {
    return null;
  }

  return $RecommendationResDataByPriceCopyWith<$Res>(_self.byPrice!, (value) {
    return _then(_self.copyWith(byPrice: value));
  });
}
}


/// @nodoc
mixin _$RecommendationResDataByPrice {

 String? get fiatToCryptoExchangeRate;
/// Create a copy of RecommendationResDataByPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationResDataByPriceCopyWith<RecommendationResDataByPrice> get copyWith => _$RecommendationResDataByPriceCopyWithImpl<RecommendationResDataByPrice>(this as RecommendationResDataByPrice, _$identity);

  /// Serializes this RecommendationResDataByPrice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationResDataByPrice&&(identical(other.fiatToCryptoExchangeRate, fiatToCryptoExchangeRate) || other.fiatToCryptoExchangeRate == fiatToCryptoExchangeRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiatToCryptoExchangeRate);

@override
String toString() {
  return 'RecommendationResDataByPrice(fiatToCryptoExchangeRate: $fiatToCryptoExchangeRate)';
}


}

/// @nodoc
abstract mixin class $RecommendationResDataByPriceCopyWith<$Res>  {
  factory $RecommendationResDataByPriceCopyWith(RecommendationResDataByPrice value, $Res Function(RecommendationResDataByPrice) _then) = _$RecommendationResDataByPriceCopyWithImpl;
@useResult
$Res call({
 String? fiatToCryptoExchangeRate
});




}
/// @nodoc
class _$RecommendationResDataByPriceCopyWithImpl<$Res>
    implements $RecommendationResDataByPriceCopyWith<$Res> {
  _$RecommendationResDataByPriceCopyWithImpl(this._self, this._then);

  final RecommendationResDataByPrice _self;
  final $Res Function(RecommendationResDataByPrice) _then;

/// Create a copy of RecommendationResDataByPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fiatToCryptoExchangeRate = freezed,}) {
  return _then(_self.copyWith(
fiatToCryptoExchangeRate: freezed == fiatToCryptoExchangeRate ? _self.fiatToCryptoExchangeRate : fiatToCryptoExchangeRate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendationResDataByPrice].
extension RecommendationResDataByPricePatterns on RecommendationResDataByPrice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationResDataByPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationResDataByPrice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationResDataByPrice value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationResDataByPrice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationResDataByPrice value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationResDataByPrice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fiatToCryptoExchangeRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationResDataByPrice() when $default != null:
return $default(_that.fiatToCryptoExchangeRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fiatToCryptoExchangeRate)  $default,) {final _that = this;
switch (_that) {
case _RecommendationResDataByPrice():
return $default(_that.fiatToCryptoExchangeRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fiatToCryptoExchangeRate)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationResDataByPrice() when $default != null:
return $default(_that.fiatToCryptoExchangeRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationResDataByPrice implements RecommendationResDataByPrice {
  const _RecommendationResDataByPrice({this.fiatToCryptoExchangeRate});
  factory _RecommendationResDataByPrice.fromJson(Map<String, dynamic> json) => _$RecommendationResDataByPriceFromJson(json);

@override final  String? fiatToCryptoExchangeRate;

/// Create a copy of RecommendationResDataByPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationResDataByPriceCopyWith<_RecommendationResDataByPrice> get copyWith => __$RecommendationResDataByPriceCopyWithImpl<_RecommendationResDataByPrice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationResDataByPriceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationResDataByPrice&&(identical(other.fiatToCryptoExchangeRate, fiatToCryptoExchangeRate) || other.fiatToCryptoExchangeRate == fiatToCryptoExchangeRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiatToCryptoExchangeRate);

@override
String toString() {
  return 'RecommendationResDataByPrice(fiatToCryptoExchangeRate: $fiatToCryptoExchangeRate)';
}


}

/// @nodoc
abstract mixin class _$RecommendationResDataByPriceCopyWith<$Res> implements $RecommendationResDataByPriceCopyWith<$Res> {
  factory _$RecommendationResDataByPriceCopyWith(_RecommendationResDataByPrice value, $Res Function(_RecommendationResDataByPrice) _then) = __$RecommendationResDataByPriceCopyWithImpl;
@override @useResult
$Res call({
 String? fiatToCryptoExchangeRate
});




}
/// @nodoc
class __$RecommendationResDataByPriceCopyWithImpl<$Res>
    implements _$RecommendationResDataByPriceCopyWith<$Res> {
  __$RecommendationResDataByPriceCopyWithImpl(this._self, this._then);

  final _RecommendationResDataByPrice _self;
  final $Res Function(_RecommendationResDataByPrice) _then;

/// Create a copy of RecommendationResDataByPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fiatToCryptoExchangeRate = freezed,}) {
  return _then(_RecommendationResDataByPrice(
fiatToCryptoExchangeRate: freezed == fiatToCryptoExchangeRate ? _self.fiatToCryptoExchangeRate : fiatToCryptoExchangeRate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
