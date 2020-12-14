// import 'dart:math' show max;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';

class MainText extends StatelessWidget {
  const MainText();

  @override
  Widget build(BuildContext context) {
    // final double _height = MediaQuery.of(context).size.height;
    // final double _shortestSide = MediaQuery.of(context).size.shortestSide;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // SizedBox(height: _shortestSide / 8 - ((_height < 351) ? 22 : 0)),
        AutoSizeText(S.of(context).greeting,
            maxLines: 1, style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).accentColor)),
        // SizedBox(height: _shortestSide / 100),
        // Container(
        //   margin: EdgeInsets.all(_shortestSide / 20),
        //   ),
        // if (_shortestSide > 780) ...[
        // SizedBox(height: _height / 5),
        Icon(MyIcon.angle_double_down, color: Theme.of(context).backgroundColor),
        // const SizedBox(height: 20)
        // ]
      ],
    );
  }
}
