import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/portfolio_projects/portfolio_project.dart';

class Portfolio extends StatelessWidget {
  const Portfolio([Key key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: _height * 0.1, width: 0),
            AutoSizeText(S.of(context).portfolio,
                maxLines: 1, style: Theme.of(context).textTheme.headline4),
            SizedBox(height: _height * 0.05, width: 0),
            AutoSizeText.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${S.of(context).findInPortfolio} ${S.of(context).somePortfilio} ',
                    ),
                    TextSpan(
                      text: S.of(context).projectsPortfolio,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).primaryColorLight,
                          ),
                    ),
                  ],
                ),
                maxLines: 6,
                textAlign: TextAlign.center),
            SizedBox(height: _height * 0.025, width: 0),
            Wrap(
              spacing: _width * 0.025,
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Project(
                    projectName: 'Steampunk Flutter Clock',
                    pathToImage: 'assets/images/clock.jpg',
                    projectDesc: S.of(context).flutterClock,
                    designURL: 'vimeo.com/tsinis/flutterclock',
                    appURL: 'github.com/tsinis/flutter_clock'),
                Project(
                    projectName: 'Hello Dribbble',
                    pathToImage: 'assets/images/dribbble.jpg',
                    projectDesc: S.of(context).helloDribbble,
                    designURL:
                        'dribbble.com/shots/10772196-hello-dribbble-interactive-animation',
                    appURL: 'github.com/tsinis/hello_dribbble'),
              ],
            ),
            Wrap(
              spacing: _width * 0.025,
              direction: Axis.horizontal,
              children: [
                Project(
                    projectName: S.of(context).tongueTwisters,
                    pathToImage: 'assets/images/clock.jpg', //TODO: Add Tongue Twisters screenshot
                    projectDesc: S.of(context).tongueTwistersDesc,
                    designURL: 'dribbble.com/shots/',
                    appURL: 'play.google.com/store/apps/'),
                Project(
                    projectName: S.of(context).thisWeb,
                    pathToImage: 'assets/images/header.gif',
                    projectDesc: S.of(context).thisWebDesc,
                    designURL: 'dribbble.com/shots/',
                    appURL: 'github.com/tsinis/tsin.is'),
              ],
            ),
            SizedBox(height: _height * 0.1),
          ],
        ),
      ),
    );
  }
}
