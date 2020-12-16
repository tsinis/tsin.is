import 'package:flutter/material.dart';

import '../generated/my_icons.dart';
import '../services/url_click.dart';

class Websites extends StatelessWidget {
  const Websites();

  static const Map<String, MapEntry<IconData, Color>> _websites = {
    'LinkedIn.com/in/': MapEntry(MyIcon.linkedin, Color(0xFF2867B2)),
    'GitHub.com/': MapEntry(MyIcon.github_square, Color(0xFF24292e)),
    'Dribbble.com/': MapEntry(MyIcon.dribbble_square, Color(0xFFea4c89)),
    'Medium.com/@': MapEntry(MyIcon.medium, Colors.black),
    // 'Codepen.io/': MapEntry(MyIcon.codepen, Color(0xFF333333)),
    'Vimeo.com/': MapEntry(MyIcon.vimeo_square, Color(0xFF1ab7ea)),
    'Telegram.me/': MapEntry(MyIcon.telegram, Color(0xFF0088cc)),
    'Rive.app/a/': MapEntry(MyIcon.rive, Colors.white)
  };

  @override
  Widget build(BuildContext context) => Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: _websites.entries
          .map<_WebsiteButton>((_webSiteData) =>
              _WebsiteButton(url: _webSiteData.key, icon: _webSiteData.value.key, color: _webSiteData.value.value))
          .toList());
}

class _WebsiteButton extends StatelessWidget {
  const _WebsiteButton({this.url, this.icon, this.color});
  final String url;
  final IconData icon;
  final Color color;

  String get _fullURL => '${url.toLowerCase()}tsinis';

  @override
  Widget build(BuildContext context) => Tooltip(
        preferBelow: false,
        message: '🔗 $_fullURL',
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 156,
            child: FlatButton.icon(
              height: 46,
              color: Colors.grey[300].withOpacity(0.5),
              textColor: Theme.of(context).disabledColor,
              hoverColor: color.withOpacity(0.5),
              highlightColor: color.withOpacity(0.66),
              icon: Icon(icon, color: color),
              label: Text(url.substring(0, url.indexOf('.')),
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      .copyWith(fontSize: 18, letterSpacing: 0.33, fontWeight: FontWeight.w400, color: Colors.black)),
              onPressed: () => Open.url(_fullURL),
            ),
          ),
        ),
      );
}
