import 'package:flutter/material.dart';
import '../../generated/my_icons.dart';

const _footerTextStyle = TextStyle(fontFamily: 'Roboto', fontSize: 12);

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.amber[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const <Widget>[
              Text('All rights reserved — ©2020 Roman Cinis.', textAlign: TextAlign.center, style: _footerTextStyle),
              SizedBox(width: 5),
              Text('(Font: Hagrid Family by Zetafonts -http://www.zetafonts.com/collection/3760).',
                  textAlign: TextAlign.center, style: _footerTextStyle),
              Text(' Made with ',
                  strutStyle: StrutStyle(forceStrutHeight: true), textAlign: TextAlign.center, style: _footerTextStyle),
              Icon(MyIcon.heart, color: Colors.blue, size: 13),
              Text(' in ',
                  strutStyle: StrutStyle(forceStrutHeight: true), textAlign: TextAlign.center, style: _footerTextStyle),
              FlutterLogo(size: 14),
            ],
          ),
        ),
      );
}
