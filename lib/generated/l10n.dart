// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  String get selectLang {
    return Intl.message(
      'select your language',
      name: 'selectLang',
      desc: '',
      args: [],
    );
  }

  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  String get portfolio {
    return Intl.message(
      'Portfolio',
      name: 'portfolio',
      desc: '',
      args: [],
    );
  }

  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  String get greeting {
    return Intl.message(
      'Hello there, I\'m',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  String get devAndDesigner {
    return Intl.message(
      'Flutter Developer & Designer',
      name: 'devAndDesigner',
      desc: '',
      args: [],
    );
  }

  String get fullName {
    return Intl.message(
      'Roman Cinis',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  String get iAm {
    return Intl.message(
      'I\'m awarded T-shaped specialist in the fields of Flutter Development and Design, with great love for interactive animations and good UX. Let\'s make something awesome together!',
      name: 'iAm',
      desc: '',
      args: [],
    );
  }

  String get findInPortfolio {
    return Intl.message(
      'Here you can find',
      name: 'findInPortfolio',
      desc: '',
      args: [],
    );
  }

  String get somePortfilio {
    return Intl.message(
      'some of my ',
      name: 'somePortfilio',
      desc: '',
      args: [],
    );
  }

  String get projectsPortfolio {
    return Intl.message(
      'projects and repositories.',
      name: 'projectsPortfolio',
      desc: '',
      args: [],
    );
  }

  String get flutterClock {
    return Intl.message(
      'This project is one of the winning submissions in Official Google\'s & Lenovo dev/design contest, called “Flutter Clock” (with almost a thousand entries worldwide).',
      name: 'flutterClock',
      desc: '',
      args: [],
    );
  }

  String get helloDribbble {
    return Intl.message(
      'Interactive animations showcase project, I\'ve made, as my Debut Shot for legendary Dribbble.com, аfter I won the invitation (so now as a “Player”).',
      name: 'helloDribbble',
      desc: '',
      args: [],
    );
  }

  String get thisWeb {
    return Intl.message(
      'This Website',
      name: 'thisWeb',
      desc: '',
      args: [],
    );
  }

  String get thisWebDesc {
    return Intl.message(
      'Obviously, this entire website is made in Flutter and written on pure Dart. The one and only third-party dependency is the animation in the About section, which was made in Rive.',
      name: 'thisWebDesc',
      desc: '',
      args: [],
    );
  }

  String get contactsDesc {
    return Intl.message(
      'Physically in the city of Brno, on the internets, I\'m known as a “tsinis”:',
      name: 'contactsDesc',
      desc: '',
      args: [],
    );
  }

  String get email {
    return Intl.message(
      'or just simply write me the good old e-mail here:',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  String get socilalNetworks {
    return Intl.message(
      '',
      name: 'socilalNetworks',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'sk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
