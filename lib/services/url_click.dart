import 'package:url_launcher/url_launcher.dart';

class Open {
  static Future<void> socialNetwork(String _socialNetwork) async =>
      await launch('https://' + _socialNetwork.toLowerCase() + 'tsinis');

  static Future<void> url(String _url) async => await launch('https://$_url');

  static final Uri _mail =
      Uri(scheme: 'mailto', path: 'my@mail.com', query: 'subject=Hey Roman!');

  static Future<void> mail() async {
    return await launch(_mail.toString());
  }

  static Future<void> cloud() async {
    if (await canLaunch('https://1drv.ms/')) {
      await launch('https://1drv.ms/');
    } else {
      await launch('https://tsinis.github.io/');
    }
  }
}
