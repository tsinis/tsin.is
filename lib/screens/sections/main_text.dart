import 'dart:math' show max;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';

class MainText extends StatelessWidget {
  const MainText(this._offset, [Key key]) : super(key: key);

  final double _offset;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _shortestSide = MediaQuery.of(context).size.shortestSide;
    return Column(
      children: <Widget>[
        SizedBox(
          height: _shortestSide / 9.0 - ((_height < 351.0) ? 22.0 : 0),
        ),
        AutoSizeText(
          S.of(context).greeting,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Theme.of(context).accentColor),
        ),
        SizedBox(height: _shortestSide / 100.0),
        Container(
          margin: EdgeInsets.all(_shortestSide / 20.0),
          child: Opacity(
            opacity: max(0, 0.6 - _offset / _height),
            child: Text(
              S.of(context).devAndDesigner,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: _shortestSide > 530.0
                        ? 60.0 + (_shortestSide / 100.0)
                        : 40.0 - (_shortestSide / 50.0),
                  ),
            ),
          ),
        ),
        SizedBox(height: _height / 4.0),
        Icon(MyIcon.angle_double_down, color: Theme.of(context).accentColor),
      ],
    );
  }
}
