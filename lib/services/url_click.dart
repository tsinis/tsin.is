import 'package:url_launcher/url_launcher.dart';

import 'locale/locale.dart';

// ignore: avoid_classes_with_only_static_members
class Open {
  static const String _cloudURL = 'https://1drv.ms/f/s!Aoc8-1_hYIfGiFYW3PppEoagkHAh',
      fullEmailName = 'tsinis.job@gmail.com';
  static final Uri _mail = Uri(scheme: 'mailto', path: fullEmailName);

  static String get cvURL {
    String langCode = 'en';
    switch (language) {
      case 'sk':
        langCode = 'cs';
        break;
      case 'cs':
        langCode = 'cs';
        break;
      case 'ru':
        langCode = 'ru';
        break;
      // case 'de':
      //   langCode = 'en';
      //   break;
      default:
        break;
    }
    return 'tsinis.github.io/cv/cv_tsinis_$langCode.pdf';
  }

  static Future<void> url(String url) async => await launch('https://$url');

  static Future<void> mail() async {
    if (await canLaunch(_mail.toString())) {
      await launch(_mail.toString());
    }
  }

  static Future<void> cloud() async {
    if (await canLaunch(_cloudURL)) {
      await launch(_cloudURL);
    } else {
      await launch('https://tsinis.github.io/cv');
    }
  }
}
