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

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Reserve a table`
  String get reserveTable {
    return Intl.message(
      'Reserve a table',
      name: 'reserveTable',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Sushi and rolls`
  String get sushiRolls {
    return Intl.message(
      'Sushi and rolls',
      name: 'sushiRolls',
      desc: '',
      args: [],
    );
  }

  /// `Sets`
  String get sets {
    return Intl.message(
      'Sets',
      name: 'sets',
      desc: '',
      args: [],
    );
  }

  /// `Ramen`
  String get ramen {
    return Intl.message(
      'Ramen',
      name: 'ramen',
      desc: '',
      args: [],
    );
  }

  /// `San Francisco`
  String get sanFrancisco {
    return Intl.message(
      'San Francisco',
      name: 'sanFrancisco',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get aNew {
    return Intl.message(
      'New',
      name: 'aNew',
      desc: '',
      args: [],
    );
  }

  /// `Salmon Set: sushi, simple roll, california roll`
  String get salmonSet {
    return Intl.message(
      'Salmon Set: sushi, simple roll, california roll',
      name: 'salmonSet',
      desc: '',
      args: [],
    );
  }

  /// `Kani syake roll with shrimp and surimi`
  String get kaniSyake {
    return Intl.message(
      'Kani syake roll with shrimp and surimi',
      name: 'kaniSyake',
      desc: '',
      args: [],
    );
  }

  /// `Spicy Ramen with spiced pork and mince`
  String get SpicyRamen {
    return Intl.message(
      'Spicy Ramen with spiced pork and mince',
      name: 'SpicyRamen',
      desc: '',
      args: [],
    );
  }

  /// `Original Ramen with Hakata noodles`
  String get originalRamenWithHakataNoodles {
    return Intl.message(
      'Original Ramen with Hakata noodles',
      name: 'originalRamenWithHakataNoodles',
      desc: '',
      args: [],
    );
  }

  /// `Fresh California Bowl with salmon`
  String get freshCaliforniaBowlWithSalmon {
    return Intl.message(
      'Fresh California Bowl with salmon',
      name: 'freshCaliforniaBowlWithSalmon',
      desc: '',
      args: [],
    );
  }

  /// `Rice Bowls`
  String get riceBowls {
    return Intl.message(
      'Rice Bowls',
      name: 'riceBowls',
      desc: '',
      args: [],
    );
  }

  /// `Gyoza`
  String get gyoza {
    return Intl.message(
      'Gyoza',
      name: 'gyoza',
      desc: '',
      args: [],
    );
  }

  /// `Order delivery`
  String get orderDelivery {
    return Intl.message(
      'Order delivery',
      name: 'orderDelivery',
      desc: '',
      args: [],
    );
  }

  /// `In the restaurant`
  String get inTheRestaurant {
    return Intl.message(
      'In the restaurant',
      name: 'inTheRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `Book a table`
  String get bookTable {
    return Intl.message(
      'Book a table',
      name: 'bookTable',
      desc: '',
      args: [],
    );
  }

  /// `Reserved`
  String get reserved {
    return Intl.message(
      'Reserved',
      name: 'reserved',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Reserve`
  String get reserve {
    return Intl.message(
      'Reserve',
      name: 'reserve',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Number of guests`
  String get numberOfGuests {
    return Intl.message(
      'Number of guests',
      name: 'numberOfGuests',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `dec`
  String get decemberShort {
    return Intl.message(
      'dec',
      name: 'decemberShort',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
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
