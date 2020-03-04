import 'package:flutter/material.dart';

import '../widgets/social_icons.dart';
import '../animations/entrance_fader.dart';

class Portfolio extends StatefulWidget {
  final Color _darkerColor;
  const Portfolio(this._darkerColor);

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
      Duration(milliseconds: 1000),
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
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: widget._darkerColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text('Portfolio', style: Theme.of(context).textTheme.headline4),
            SizedBox(height: height * 0.05),
            _header(),
            SizedBox(height: height * 0.1),
            if (width > height)
              Row(
                children: <Widget>[
                  Expanded(child: _leftSide(width)),
                  SizedBox(width: width * 0.1),
                  Expanded(child: _rightSide(height, width))
                ],
              )
            else ...[
              _leftSide(width),
              _rightSide(height, width),
            ],
            SizedBox(height: height * 0.1),
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
          fontSize: 40,
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

  Widget _rightSide(double height, double width) {
    return EntranceFader(
      offset: Offset(width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Container(
        height: height / 2,
        child: Stack(
          alignment: Alignment(0, 0.5),
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                );
              },
            ),
            Image.asset('assets/images/clock.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(double width) {
    return EntranceFader(
      offset: Offset(-width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Steampunk Flutter Clock',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          SizedBox(height: 32),
          Text(
            'I have made a analog clock variant, with look and feel of Victorian era. This is mainly design contest, so, there is a lot of details and animations inside, made with Rive (ex Flare) tool.',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 32),
          Text(
            'GitHub Repository',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
