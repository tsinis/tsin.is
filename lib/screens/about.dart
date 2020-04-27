import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../generated/social_icons.dart';
import '../services/orientation_detector.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);
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
            S.of(context).fullName,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  fontSize:
                      30.0 + (MediaQuery.of(context).size.shortestSide / 100.0),
                ),
          ),
          OrientationSwitcher(
            columnNotRow: tooTight,
            children: <Widget>[
              const FittedBox(
                  child: Icon(SocialIcons.github_circled,
                      size:
                          333.0)), // TODO: replace this Rive animation placeholder.
              const SizedBox(width: 64.0),
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
