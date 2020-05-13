import 'dart:math' show max;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../generated/social_icons.dart';

class MainText extends StatelessWidget {
  const MainText(this.offset, [Key key]) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return Column(
      children: <Widget>[
        SizedBox(
          height: shortestSide / 9.0 - ((height < 351.0) ? 22.0 : 0),
        ),
        AutoSizeText(
          S.of(context).greeting,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Theme.of(context).backgroundColor),
        ),
        SizedBox(height: shortestSide / 100.0),
        Container(
          margin: EdgeInsets.all(shortestSide / 20.0),
          child: Opacity(
            opacity: max(0, 0.6 - offset / height),
            child: Text(
              S.of(context).devAndDesigner,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: shortestSide > 530.0
                        ? 60.0 + (shortestSide / 100.0)
                        : 40.0 - (shortestSide / 50.0),
                  ),
            ),
          ),
        ),
        SizedBox(height: height / 4.0),
        Icon(SocialIcons.down_big, color: Theme.of(context).accentColor),
      ],
    );
  }
}
