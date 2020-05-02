import 'package:flutter/material.dart';

import '../extensions/hover_extensions.dart';
import '../generated/social_icons.dart';
import '../services/url_click.dart';

class Website extends StatelessWidget {
  Website(this.url, [Key key]) : super(key: key);

  final String url;

  Color get _color => _getColor();

  IconData get _icon => _getIcon();

  String get _name => url.substring(0, url.indexOf('.'));

  IconData _getIcon() {
    switch (url) {
      case 'Dribbble.com/':
        return SocialIcons.dribbble_squared;
      case 'LinkedIn.com/in/':
        return SocialIcons.linkedin_squared;
      case 'GitHub.com/':
        return SocialIcons.github_squared;
      case 'Medium.com/@':
        return SocialIcons.medium;
      case 'Vimeo.com/':
        return SocialIcons.vimeo_squared;
      default:
        return SocialIcons.rive;
    }
  }

  Color _getColor() {
    switch (url) {
      case 'Dribbble.com/':
        return Colors.pink;
      case 'LinkedIn.com/in/':
        return Colors.lightBlue[300];
      case 'Rive.app/a/':
        return Colors.purple;
      case 'Medium.com/@':
        return Colors.white;
      case 'Vimeo.com/':
        return Colors.cyan;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 140.0,
        child: FlatButton.icon(
          color: Colors.grey.withOpacity(0.2),
          textColor: Theme.of(context).disabledColor,
          hoverColor: _color.withOpacity(0.25),
          highlightColor: _color,
          icon: Icon(_icon),
          label: Text(_name),
          onPressed: () => click(url, name: _name),
        ).showCursorOnHover,
      );
}
