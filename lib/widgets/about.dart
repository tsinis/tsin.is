import 'package:flutter/material.dart';
import 'package:tsin.is/utils/orientation.dart';
import 'package:tsin.is/utils/social_icons.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool tooTight = width < 900;
    const String _aboutMe =
        'I am awarded T-shaped specialist in the fields of Flutter Development and Design, with great love for “juicy” animations and good UX. Let\'s make something awesome together!';
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // Text(
          // 'My name is',
          // style: TextStyle(
          //   fontFamily: 'Roboto',
          //   color: Colors.black,
          //   fontSize: 16,
          //   fontWeight: FontWeight.w500,
          // ),
          // ),
          // SizedBox(height: 12),
          Text(
            'Roman Cinis',
            style: Theme.of(context).textTheme.headline3.copyWith(
                fontSize:
                    30 + (MediaQuery.of(context).size.shortestSide / 100)),
          ),
          OrientationSwitcher(
            tight: tooTight,
            children: <Widget>[
              FittedBox(
                  child: Icon(SocialIcons.github_circled,
                      size:
                          333)), // TODO: replace this Rive animation placeholder.
              SizedBox(width: 64),
              tooTight
                  ? Text(_aboutMe)
                  : Flexible(
                      child: Text(_aboutMe,
                          style: TextStyle(fontSize: 15 + width / 100)))
            ],
          ),
          // else ...[
          //   Icon(SocialIcons.github_circled, size: 200),
          //   SizedBox(height: 64),
          //   Text(_aboutMe),
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
