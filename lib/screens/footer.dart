import 'package:flutter/material.dart';

const _footerTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  // fontWeight: FontWeight.w100,
  fontSize: 12.0,
);

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.amber[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                const Text('All rights reserved — ©2020 Roman Cinis.',
                    textAlign: TextAlign.center, style: _footerTextStyle),
                const SizedBox(height: 5.0),
                const Text(
                    '(Font: Hagrid Family by Zetafonts -http://www.zetafonts.com/collection/3760).',
                    textAlign: TextAlign.center,
                    style: _footerTextStyle),
                const Text(' Made with 💙 in ',
                    strutStyle: const StrutStyle(forceStrutHeight: true),
                    textAlign: TextAlign.center,
                    style: _footerTextStyle),
                const FlutterLogo(
                  size: 14.0,
                ),
              ],
            ),
          ),
        ),
      );
}
