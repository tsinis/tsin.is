import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/portfolio_projects/portfolio_project.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key key}) : super(key: key);
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  RichText _header() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.headline2,
        children: [
          TextSpan(
            text: '${S.of(context).findInPortfolio} ',
          ),
          TextSpan(
            text: '${S.of(context).somePortfilio} ',
          ),
          TextSpan(
            text: S.of(context).projectsPortfolio,
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          )
        ],
      ),
    );
  }

  double get height => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: height * 0.1),
              Text(S.of(context).portfolio,
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(height: height * 0.05),
              _header(),
              SizedBox(height: height * 0.025),
              Project(
                projectName: 'Steampunk Flutter Clock',
                pathToImage: 'assets/images/clock.jpg', // TODO: Add zoomed image assets for projects
                projectDesc: S.of(context).flutterClock,
                designURL: 'vimeo.com/tsinis/flutterclock',
                appURL: 'github.com/tsinis/flutter_clock',
              ),
              Project(
                projectName: 'Hello Dribbble',
                pathToImage: 'assets/images/clock.jpg',
                projectDesc: S.of(context).helloDribbble,
                designURL:
                    'dribbble.com/shots/10772196-hello-dribbble-interactive-animation',
                appURL: 'github.com/tsinis/hello_dribbble',
              ),
              Project(
                projectName: S.of(context).tongueTwisters,
                pathToImage: 'assets/images/clock.jpg',
                projectDesc: S.of(context).tongueTwistersDesc,
                designURL: 'dribbble.com/shots/',
                appURL: 'play.google.com/store/apps/',
              ),
              Project(
                projectName: S.of(context).thisWeb,
                pathToImage: 'assets/images/header.gif',
                projectDesc: S.of(context).thisWebDesc,
                designURL: 'dribbble.com/shots/',
                appURL: 'github.com/tsinis/hello_dribbble',
              ),
              SizedBox(height: height * 0.1),
            ],
          ),
        ),
      );
}
