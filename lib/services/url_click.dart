import 'package:url_launcher/url_launcher.dart';

import 'locale_builder.dart';

class Open {
  static const String _cloudURL =
      'https://1drv.ms/f/s!Aoc8-1_hYIfGiFYW3PppEoagkHAh';

  static final Uri _mail = Uri(scheme: 'mailto', path: 'my@mail.com');

  static String cvURL() {
    String _langCode = 'en';
    switch (LocaleBuilder.language) {
      case 'sk':
        _langCode = 'cs';
        break;
      case 'de':
        _langCode = 'en';
        break;
      default:
        _langCode = LocaleBuilder.language;
    }
    return 'web.site/tsinis_$_langCode.pdf';
  }

  static Future<void> url(String _url) async => await launch('https://$_url');

  static Future<void> mail() async {
    if (await canLaunch(_mail.toString())) {
      await launch(_mail.toString());
    } else {
      // print('no mail SW');
    }
  }

  static Future<void> cloud() async {
    if (await canLaunch(_cloudURL)) {
      await launch(_cloudURL);
    } else {
      await launch('https://tsinis.github.io/'); // TODO: Add GitHub link
    }
  }
}
