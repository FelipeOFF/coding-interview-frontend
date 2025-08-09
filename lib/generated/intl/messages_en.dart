// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(x, s) => "≈ ${x} ${s}";

  static String m1(x) => "≈ ${x}";

  static String m2(x) =>
      "${Intl.plural(x, one: '${x} Day', other: '${x} Days')}";

  static String m3(x) =>
      "${Intl.plural(x, one: '${x} Hour', other: '${x} Hours')}";

  static String m4(x) =>
      "${Intl.plural(x, one: '${x} Min', other: '${x} Min')}";

  static String m5(x) =>
      "${Intl.plural(x, one: '${x} Sec', other: '${x} Sec')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "approximatelyEqual": m0,
    "approximatelyEqualUniqValue": m1,
    "bolvaresBs": MessageLookupByLibrary.simpleMessage("Bolívares (Bs)"),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "cripto": MessageLookupByLibrary.simpleMessage("Cripto"),
    "day": m2,
    "defaultTaxValue": MessageLookupByLibrary.simpleMessage("0.00"),
    "defaultTotalAmountValue": MessageLookupByLibrary.simpleMessage("0.00"),
    "enterYourAmount": MessageLookupByLibrary.simpleMessage(
      "Enter your amount",
    ),
    "estimateTax": MessageLookupByLibrary.simpleMessage("Estimate Tax"),
    "estimateTime": MessageLookupByLibrary.simpleMessage("Estimate Time"),
    "fiat": MessageLookupByLibrary.simpleMessage("FIAT"),
    "have": MessageLookupByLibrary.simpleMessage("HAVE"),
    "hour": m3,
    "justNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "min": m4,
    "nothing": MessageLookupByLibrary.simpleMessage("-"),
    "ops": MessageLookupByLibrary.simpleMessage("Ops..."),
    "pesoColombianoCol": MessageLookupByLibrary.simpleMessage(
      "\'Peso Colombiano (COL\$)",
    ),
    "pleaseEnterAmount": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid amount",
    ),
    "realBrasileiroR": MessageLookupByLibrary.simpleMessage(
      "\'Real Brasileiro (R\$)",
    ),
    "sec": m5,
    "solPeruanoS": MessageLookupByLibrary.simpleMessage("Sol Peruano (S/)"),
    "somethingWrongHappenedPleaseTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "Something wrong happened, please try again later",
        ),
    "tetherUsdt": MessageLookupByLibrary.simpleMessage("Tether (USDT)"),
    "usdCoinUsdc": MessageLookupByLibrary.simpleMessage("USD Coin (USDC)"),
    "usdc": MessageLookupByLibrary.simpleMessage("USDC"),
    "usdt": MessageLookupByLibrary.simpleMessage("USDT"),
    "want": MessageLookupByLibrary.simpleMessage("WANT"),
    "youWillReceive": MessageLookupByLibrary.simpleMessage("You will receive"),
  };
}
