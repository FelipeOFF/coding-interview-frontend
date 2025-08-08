// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsCriptoCurrenciesGen {
  const $AssetsCriptoCurrenciesGen();

  /// File path: assets/cripto_currencies/TATUM-TRON-USDT.png
  AssetGenImage get tatumTronUsdt =>
      const AssetGenImage('assets/cripto_currencies/TATUM-TRON-USDT.png');

  /// List of all assets
  List<AssetGenImage> get values => [tatumTronUsdt];
}

class $AssetsFiatCurrenciesGen {
  const $AssetsFiatCurrenciesGen();

  /// File path: assets/fiat_currencies/BRL.png
  AssetGenImage get brl =>
      const AssetGenImage('assets/fiat_currencies/BRL.png');

  /// File path: assets/fiat_currencies/COP.png
  AssetGenImage get cop =>
      const AssetGenImage('assets/fiat_currencies/COP.png');

  /// File path: assets/fiat_currencies/PEN.png
  AssetGenImage get pen =>
      const AssetGenImage('assets/fiat_currencies/PEN.png');

  /// File path: assets/fiat_currencies/VES.png
  AssetGenImage get ves =>
      const AssetGenImage('assets/fiat_currencies/VES.png');

  /// List of all assets
  List<AssetGenImage> get values => [brl, cop, pen, ves];
}

class Assets {
  const Assets._();

  static const $AssetsCriptoCurrenciesGen criptoCurrencies =
      $AssetsCriptoCurrenciesGen();
  static const AssetGenImage elDoradoLogo = AssetGenImage(
    'assets/el_dorado_logo.png',
  );
  static const $AssetsFiatCurrenciesGen fiatCurrencies =
      $AssetsFiatCurrenciesGen();
  static const AssetGenImage screen1 = AssetGenImage('assets/screen_1.jpg');
  static const AssetGenImage sheet1 = AssetGenImage('assets/sheet_1.jpg');
  static const AssetGenImage sheet2 = AssetGenImage('assets/sheet_2.jpg');

  /// List of all assets
  static List<AssetGenImage> get values => [
    elDoradoLogo,
    screen1,
    sheet1,
    sheet2,
  ];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
