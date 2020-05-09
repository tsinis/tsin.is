import 'package:flutter/material.dart';

const _footerTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 12.0,
);

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.amber[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const <Widget>[
                Text('All rights reserved — ©2020 Roman Cinis.',
                    textAlign: TextAlign.center, style: _footerTextStyle),
                SizedBox(height: 5.0),
                Text(
                    '(Font: Hagrid Family by Zetafonts -http://www.zetafonts.com/collection/3760).',
                    textAlign: TextAlign.center,
                    style: _footerTextStyle),
                Text(' Made with 💙 in ', //FIXME: Replace emoji with custom Icon
                    strutStyle: StrutStyle(forceStrutHeight: true),
                    textAlign: TextAlign.center,
                    style: _footerTextStyle),
                FlutterLogo(
                  size: 14.0,
                ),
              ],
            ),
          ),
        ),
      );
}
