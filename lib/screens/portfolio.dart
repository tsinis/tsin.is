import 'package:flutter/material.dart';

import '../animations/portfolio_project.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text('Portfolio', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: height * 0.05),
            _header(),
            SizedBox(height: height * 0.1),
            Project(
              projectName: 'Steampunk Flutter Clock',
              pathToImage: 'assets/images/clock.jpg',
              projectDesc:
                  'I have made a analog clock variant, with look and feel of Victorian era. This is mainly design contest, so, there is a lot of details and animations inside, made with Rive (ex Flare) tool.',
            )
          ],
        ),
      ),
    );
  }

  RichText _header() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontFamily: 'Hagrid Text',
        ),
        children: [
          TextSpan(
            text: 'Here you can find ',
          ),
          TextSpan(
            text: 'some of my ',
          ),
          TextSpan(
            text: 'projects and repositories',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Hagrid Text',
            ),
          )
        ],
      ),
    );
  }
}
