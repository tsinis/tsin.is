import 'package:url_launcher/url_launcher.dart';

import 'locale_builder.dart';

// ignore: avoid_classes_with_only_static_members
class Open {
  static const String _cloudURL = 'https://1drv.ms/f/s!Aoc8-1_hYIfGiFYW3PppEoagkHAh',
      fullEmailName = 'job.tsinis@gmail.com';
  static final Uri _mail = Uri(scheme: 'mailto', path: fullEmailName);

  static String get cvURL {
    String langCode;
    switch (LocaleBuilder.language) {
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
        langCode = 'en';
    }
    return 'tsin.is/cv/cv_tsinis_$langCode.pdf';
  }

  static Future<void> url(String _url) async => await launch('https://$_url');

  static Future<void> mail() async {
    // print('checking mail SW');
    if (await canLaunch(_mail.toString())) {
      // print('exists mail SW');
      print(_mail.toString());
      await launch(_mail.toString());
    } else {
      // print('no mail SW');
    }
    // print('done');
  }

  static Future<void> cloud() async {
    if (await canLaunch(_cloudURL)) {
      await launch(_cloudURL);
    } else {
      await launch('https://tsin.is/cv');
    }
  }
}
