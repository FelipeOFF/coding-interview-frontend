// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppS {
  AppS();

  static AppS? _current;

  static AppS get current {
    assert(
      _current != null,
      'No instance of AppS was loaded. Try to initialize the AppS delegate before accessing AppS.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppS();
      AppS._current = instance;

      return instance;
    });
  }

  static AppS of(BuildContext context) {
    final instance = AppS.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppS present in the widget tree. Did you add AppS.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppS? maybeOf(BuildContext context) {
    return Localizations.of<AppS>(context, AppS);
  }

  /// `Ops...`
  String get ops {
    return Intl.message('Ops...', name: 'ops', desc: '', args: []);
  }

  /// `Something wrong happened, please try again later`
  String get somethingWrongHappenedPleaseTryAgainLater {
    return Intl.message(
      'Something wrong happened, please try again later',
      name: 'somethingWrongHappenedPleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get nothing {
    return Intl.message('-', name: 'nothing', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `HAVE`
  String get have {
    return Intl.message('HAVE', name: 'have', desc: '', args: []);
  }

  /// `WANT`
  String get want {
    return Intl.message('WANT', name: 'want', desc: '', args: []);
  }

  /// `Enter your amount`
  String get enterYourAmount {
    return Intl.message(
      'Enter your amount',
      name: 'enterYourAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid amount`
  String get pleaseEnterAmount {
    return Intl.message(
      'Please enter a valid amount',
      name: 'pleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Estimate Tax`
  String get estimateTax {
    return Intl.message(
      'Estimate Tax',
      name: 'estimateTax',
      desc: '',
      args: [],
    );
  }

  /// `You will receive`
  String get youWillReceive {
    return Intl.message(
      'You will receive',
      name: 'youWillReceive',
      desc: '',
      args: [],
    );
  }

  /// `Estimate Time`
  String get estimateTime {
    return Intl.message(
      'Estimate Time',
      name: 'estimateTime',
      desc: '',
      args: [],
    );
  }

  /// `≈ {x} {s}`
  String approximatelyEqual(String x, String s) {
    return Intl.message(
      '≈ $x $s',
      name: 'approximatelyEqual',
      desc: 'This is an example of approximately equal',
      args: [x, s],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Bolívares (Bs)`
  String get bolvaresBs {
    return Intl.message(
      'Bolívares (Bs)',
      name: 'bolvaresBs',
      desc: '',
      args: [],
    );
  }

  /// `Tether (USDT)`
  String get tetherUsdt {
    return Intl.message(
      'Tether (USDT)',
      name: 'tetherUsdt',
      desc: '',
      args: [],
    );
  }

  /// `USD Coin (USDC)`
  String get usdCoinUsdc {
    return Intl.message(
      'USD Coin (USDC)',
      name: 'usdCoinUsdc',
      desc: '',
      args: [],
    );
  }

  /// `Sol Peruano (S/)`
  String get solPeruanoS {
    return Intl.message(
      'Sol Peruano (S/)',
      name: 'solPeruanoS',
      desc: '',
      args: [],
    );
  }

  /// `'Peso Colombiano (COL$)`
  String get pesoColombianoCol {
    return Intl.message(
      '\'Peso Colombiano (COL\$)',
      name: 'pesoColombianoCol',
      desc: '',
      args: [],
    );
  }

  /// `'Real Brasileiro (R$)`
  String get realBrasileiroR {
    return Intl.message(
      '\'Real Brasileiro (R\$)',
      name: 'realBrasileiroR',
      desc: '',
      args: [],
    );
  }

  /// `FIAT`
  String get fiat {
    return Intl.message('FIAT', name: 'fiat', desc: '', args: []);
  }

  /// `Cripto`
  String get cripto {
    return Intl.message('Cripto', name: 'cripto', desc: '', args: []);
  }

  /// `USDT`
  String get usdt {
    return Intl.message('USDT', name: 'usdt', desc: '', args: []);
  }

  /// `USDC`
  String get usdc {
    return Intl.message('USDC', name: 'usdc', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppS> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppS> load(Locale locale) => AppS.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
