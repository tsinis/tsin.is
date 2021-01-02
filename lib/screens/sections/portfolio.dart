import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';
import '../../widgets/portfolio_projects/portfolio_project.dart';

class Portfolio extends StatelessWidget {
  const Portfolio();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return ColoredBox(
      color: MyColors.backgroundColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: height * 0.1, width: 0),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: AutoSizeText(S.of(context).portfolio,
                    maxLines: 1, style: MyTextStyles.headline4.copyWith(color: MyColors.primaryColorDark))),
            SizedBox(height: height * 0.05, width: 0),
            AutoSizeText.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '${S.of(context).findInPortfolio} ${S.of(context).somePortfilio} ',
                        style: MyTextStyles.bodyText2),
                    TextSpan(
                      text: S.of(context).projectsPortfolio,
                      style: MyTextStyles.bodyText2.copyWith(color: MyColors.primaryColorLight),
                    ),
                  ],
                ),
                maxLines: 6,
                textAlign: TextAlign.center),
            SizedBox(height: height * 0.025, width: 0),
            Wrap(
              spacing: width * 0.025,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Project(
                    projectName: 'Steampunk Flutter Clock',
                    pathToImage: 'assets/images/projects/clock.jpg',
                    projectDesc: S.of(context).flutterClock,
                    designURL: 'vimeo.com/tsinis/flutterclock',
                    appURL: 'github.com/tsinis/flutter_clock'),
                Project(
                    projectName: S.of(context).planetBGame,
                    pathToImage: 'assets/images/projects/planet.jpg',
                    projectDesc: S.of(context).planetBGameDesc,
                    designURL: 'vimeo.com/tsinis/hack20',
                    appURL: 'github.com/tsinis/plan_et_b'),
              ],
            ),
            Wrap(
              spacing: width * 0.025,
              children: [
                Project(
                    projectName: 'App Icon Tools',
                    pathToImage: 'assets/images/projects/tools.jpg',
                    projectDesc: S.of(context).iconTools,
                    designURL: 'vimeo.com/tsinis/app-icon-tools',
                    appURL: 'github.com/tsinis/app_icon_tools'),
                Project(
                    projectName: 'Hello Dribbble',
                    pathToImage: 'assets/images/projects/dribbble.jpg',
                    projectDesc: S.of(context).helloDribbble,
                    designURL: 'dribbble.com/shots/10772196-hello-dribbble-interactive-animation',
                    appURL: 'github.com/tsinis/hello_dribbble'),
              ],
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
