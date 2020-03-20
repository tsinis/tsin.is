import 'dart:math' show max;

import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class MainText extends StatelessWidget {
  final double _offset;
  const MainText(this._offset);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return Column(
      children: <Widget>[
        // SizedBox(height: 100),
        SizedBox(height: shortestSide / 9.0 - ((height < 351.0) ? 22.0 : 0)),
        Text(S.of(context).greeting,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Theme.of(context).backgroundColor)),
        // SizedBox(height: 100),
        SizedBox(height: shortestSide / 100.0),
        // Container(
        //   height: 1,
        //   width: 200,
        //   color: Colors.transparent,
        //   // color: Colors.grey.shade600,
        // ),
        // SizedBox(height: 50),
        Container(
          margin: EdgeInsets.all(shortestSide / 20.0),
          child: Opacity(
            opacity: max(0, 0.5 - _offset / 800.0),
            child: Text(
              'Flutter Developer & Designer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: shortestSide > 530.0
                    ? 60 + (shortestSide / 100.0)
                    : 40 - (shortestSide / 50.0),
              ),
            ),
          ),
        ),
        SizedBox(height: height / 4.0),
        RotatedBox(
          quarterTurns: 2,
          child: Icon(Icons.arrow_upward, color: Theme.of(context).accentColor),
        ),
        // SizedBox(height: 20),
        // Text(
        //   'SCROLL DOWN',
        //   style: Theme.of(context).textTheme.caption.copyWith(
        //         color: Colors.grey[600],
        //       ),
        // ),
      ],
    );
  }
}
