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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get currentLocale {
    return Intl.message(
      'en',
      name: 'currentLocale',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Check the`
  String get check {
    return Intl.message(
      'Check the',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `All languages`
  String get cloud {
    return Intl.message(
      'All languages',
      name: 'cloud',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Physically in the city of Brno, on the internets, I'm known as a “tsinis”:`
  String get contactsDesc {
    return Intl.message(
      'Physically in the city of Brno, on the internets, I\'m known as a “tsinis”:',
      name: 'contactsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Grab my CV`
  String get cv {
    return Intl.message(
      'Grab my CV',
      name: 'cv',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Developer & Designer`
  String get devAndDesigner {
    return Intl.message(
      'Flutter Developer & Designer',
      name: 'devAndDesigner',
      desc: '',
      args: [],
    );
  }

  /// `or just simply write me a good old e-mail here:`
  String get email {
    return Intl.message(
      'or just simply write me a good old e-mail here:',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Here you can find`
  String get findInPortfolio {
    return Intl.message(
      'Here you can find',
      name: 'findInPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `This project is one of the winning submissions in the Official Google's & Lenovo dev/design contest, called “Flutter Clock” (with almost a thousand entries worldwide).`
  String get flutterClock {
    return Intl.message(
      'This project is one of the winning submissions in the Official Google\'s & Lenovo dev/design contest, called “Flutter Clock” (with almost a thousand entries worldwide).',
      name: 'flutterClock',
      desc: '',
      args: [],
    );
  }

  /// `Roman Cinis`
  String get fullName {
    return Intl.message(
      'Roman Cinis',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Hello there, I'm`
  String get greeting {
    return Intl.message(
      'Hello there, I\'m',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Interactive animations showcase project, I've made, as my Debut Shot for legendary Dribbble.com, аfter I won the invitation (so now as a “Player”).`
  String get helloDribbble {
    return Intl.message(
      'Interactive animations showcase project, I\'ve made, as my Debut Shot for legendary Dribbble.com, аfter I won the invitation (so now as a “Player”).',
      name: 'helloDribbble',
      desc: '',
      args: [],
    );
  }

  /// `I'm awarded T-shaped specialist in the fields of Flutter Development and Design, with a great love for interactive animations and good UX. Let's make something awesome together!\n\nWant to know more?`
  String get iAm {
    return Intl.message(
      'I\'m awarded T-shaped specialist in the fields of Flutter Development and Design, with a great love for interactive animations and good UX. Let\'s make something awesome together!\n\nWant to know more?',
      name: 'iAm',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get inAction {
    return Intl.message(
      'Video',
      name: 'inAction',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Plan-et-B Game`
  String get planetBGame {
    return Intl.message(
      'Plan-et-B Game',
      name: 'planetBGame',
      desc: '',
      args: [],
    );
  }

  /// `This project is one of the winners of this year's official Flutter Community Hackaton. More than two and a half thousand developers from all over the world took part in it.`
  String get planetBGameDesc {
    return Intl.message(
      'This project is one of the winners of this year\'s official Flutter Community Hackaton. More than two and a half thousand developers from all over the world took part in it.',
      name: 'planetBGameDesc',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get portfolio {
    return Intl.message(
      'Portfolio',
      name: 'portfolio',
      desc: '',
      args: [],
    );
  }

  /// `projects and repositories.`
  String get projectsPortfolio {
    return Intl.message(
      'projects and repositories.',
      name: 'projectsPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `See the`
  String get see {
    return Intl.message(
      'See the',
      name: 'see',
      desc: '',
      args: [],
    );
  }

  /// `select your language`
  String get selectLang {
    return Intl.message(
      'select your language',
      name: 'selectLang',
      desc: '',
      args: [],
    );
  }

  /// `some of my `
  String get somePortfilio {
    return Intl.message(
      'some of my ',
      name: 'somePortfilio',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get theCode {
    return Intl.message(
      'Code',
      name: 'theCode',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get theDesign {
    return Intl.message(
      'Design',
      name: 'theDesign',
      desc: '',
      args: [],
    );
  }

  /// `This Website`
  String get thisWeb {
    return Intl.message(
      'This Website',
      name: 'thisWeb',
      desc: '',
      args: [],
    );
  }

  /// `Obviously, this entire website is made in Flutter and written on pure Dart. The one and only third-party dependency is the animation in the About section, which was made in Rive.`
  String get thisWebDesc {
    return Intl.message(
      'Obviously, this entire website is made in Flutter and written on pure Dart. The one and only third-party dependency is the animation in the About section, which was made in Rive.',
      name: 'thisWebDesc',
      desc: '',
      args: [],
    );
  }

  /// `A set of tools, for creating and previewing Flutter application icons. Support all platforms, including mobile but designed as “Desktop First” solution.`
  String get iconTools {
    return Intl.message(
      'A set of tools, for creating and previewing Flutter application icons. Support all platforms, including mobile but designed as “Desktop First” solution.',
      name: 'iconTools',
      desc: '',
      args: [],
    );
  }

  /// `Tongue Twisters`
  String get tongueTwisters {
    return Intl.message(
      'Tongue Twisters',
      name: 'tongueTwisters',
      desc: '',
      args: [],
    );
  }

  /// `Application for testing tongue twisters with focus on the design. Created it in coop with illustrator – license do not allow me to open source (i.e. illustrations).`
  String get tongueTwistersDesc {
    return Intl.message(
      'Application for testing tongue twisters with focus on the design. Created it in coop with illustrator – license do not allow me to open source (i.e. illustrations).',
      name: 'tongueTwistersDesc',
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
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}