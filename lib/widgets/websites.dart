import 'package:flutter/material.dart';

import '../extensions/hover_extensions.dart';
import '../generated/my_icons.dart';
import '../services/url_click.dart';

class Website extends StatelessWidget {
  Website(this._url, [Key key]) : super(key: key);

  final String _url;

  Color get _color => _getColor();

  IconData get _icon => _getIcon();

  String get _name => _url.substring(0, _url.indexOf('.'));

  IconData _getIcon() {
    switch (_url) {
      case 'Dribbble.com/':
        return MyIcon.dribbble_square;
      case 'LinkedIn.com/in/':
        return MyIcon.linkedin;
      case 'GitHub.com/':
        return MyIcon.github_square;
      case 'Medium.com/@':
        return MyIcon.medium;
      case 'Vimeo.com/':
        return MyIcon.vimeo_square;
      default:
        return MyIcon.rive;
    }
  }

  Color _getColor() {
    switch (_url) {
      case 'Dribbble.com/':
        return Colors.pink[600];
      case 'LinkedIn.com/in/':
        return Colors.blue;
      case 'Rive.app/a/':
        return Colors.white;
      // case 'Medium.com/@':
      //   return Colors.black;
      case 'Vimeo.com/':
        return Colors.cyan[600];
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 140.0,
        child: FlatButton.icon(
          textColor: Theme.of(context).disabledColor,
          hoverColor: _color.withOpacity(0.15),
          highlightColor: _color,
          icon: Icon(_icon, color: _getColor().withOpacity(0.66)),
          label: Text(_name),
          onPressed: () => Open.socialNetwork(_url),
        ).showCursorOnHover,
      );
}
