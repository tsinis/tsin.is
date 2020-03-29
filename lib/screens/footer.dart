import 'package:flutter/material.dart';

final _footerTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w100,
  fontSize: 12.0,
);

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text('All rights reserved — ©2020 Roman Cinis.',
                  textAlign: TextAlign.center, style: _footerTextStyle),
              SizedBox(height: 5.0),
              Text(
                  '(Font: Hagrid Family by Zetafonts -http://www.zetafonts.com/collection/3760).',
                  textAlign: TextAlign.center,
                  style: _footerTextStyle),
              Text(' Made with 💙 in ',
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
}
