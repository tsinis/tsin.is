import 'package:flutter/material.dart';
import 'package:tsin.is/services/url_click.dart';
// import 'dart:html' as html;
import '../widgets/social_icons.dart';
import '../extensions/hover_extensions.dart';

class Website extends FlatButton {
  Website(this.url);
  final String url;

  Color get _color => _getColor();
  IconData get _icon => _getIcon();
  String get _name => url.substring(0, url.indexOf("."));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.0,
      child: FlatButton.icon(
        textColor: Theme.of(context).disabledColor,
        hoverColor: _color.withOpacity(0.25),
        highlightColor: _color,
        icon: Icon(_icon),
        label: Text(_name),
        onPressed: () => click(url, name: _name)
      ).showCursorOnHover,
    );
  }

  IconData _getIcon() {
    switch (url) {
      case 'Dribbble.com/':
        return SocialIcons.dribbble;
        break;
      case 'LinkedIn.com/in/':
        return SocialIcons.linkedin_squared;
        break;
      case 'GitHub.com/':
        return SocialIcons.github_squared;
        break;
      case 'Rive.app/a/':
        return SocialIcons.laptop;
        break;
      case 'Medium.com/@':
        return SocialIcons.medium;
        break;
      case 'Vimeo.com/':
        return SocialIcons.vimeo_squared;
        break;
    }
  }

  Color _getColor() {
    switch (url) {
      case 'Dribbble.com/':
        return Colors.pink;
        break;
      case 'LinkedIn.com/in/':
        return Colors.lightBlue[300];
        break;
      case 'GitHub.com/':
        return Colors.grey;
        break;
      case 'Rive.app/a/':
        return Colors.purple;
        break;
      case 'Medium.com/@':
        return Colors.white;
        break;
      case 'Vimeo.com/':
        return Colors.cyan;
        break;
    }
  }
}
