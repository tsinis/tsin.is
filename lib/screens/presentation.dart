import 'package:flutter/material.dart';

import '../animations/entrance_fader.dart';

class Presentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Color _darkGrey = Theme.of(context).primaryColorDark;
    return Container(
      color: Theme.of(context).primaryColor,
      height: height > width ? height * 0.5 : height * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.4,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: EntranceFader(
                offset: Offset(width / 4.0, 0),
                duration: Duration(seconds: 1),
                child: Text(
                  'AWARDED',
                  style: TextStyle(
                    color: _darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.4,
            child: Container(
              color: _darkGrey,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              duration: Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/clock.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  Icon(
                    Icons.play_circle_outline,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
