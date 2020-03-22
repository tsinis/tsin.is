import 'package:flutter/material.dart';

import '../services/orientation_detector.dart';
import '../widgets/social_icons.dart';
import '../generated/l10n.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool tooTight = width < 900.0;
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Column(
        children: <Widget>[
          Text(
            'Roman Cinis',
            style: Theme.of(context).textTheme.headline3.copyWith(
                fontSize:
                    30.0 + (MediaQuery.of(context).size.shortestSide / 100.0)),
          ),
          OrientationSwitcher(
            tight: tooTight,
            children: <Widget>[
              FittedBox(
                  child: Icon(SocialIcons.github_circled,
                      size:
                          333.0)), // TODO: replace this Rive animation placeholder.
              SizedBox(width: 64.0),
              tooTight
                  ? Text(S.of(context).iAm)
                  : Flexible(
                      child: Text(
                        S.of(context).iAm,
                        style: TextStyle(fontSize: 15.0 + width / 100.0),
                      ),
                    )
            ],
          ),
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
