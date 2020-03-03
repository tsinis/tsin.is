import 'dart:math' show max;

import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final Color _backgroundColor;
  final double _offset;
  const MainText(this._backgroundColor, this._offset);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return Column(
      children: <Widget>[
        // SizedBox(height: 100),
        SizedBox(height: shortestSide / 9 - ((height < 351) ? 22 : 0)),
        Text('Hello there, I\'m',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.grey.shade600)
            // style: TextStyle(color: _backgroundColor, fontWeight: FontWeight.w100,),
            ),
        // SizedBox(height: 100),
        SizedBox(height: shortestSide / 100),
        // Container(
        //   height: 1,
        //   width: 200,
        //   color: Colors.transparent,
        //   // color: Colors.grey.shade600,
        // ),
        // SizedBox(height: 50),
        Container(
          margin: EdgeInsets.all(shortestSide / 20),
          child: Opacity(
            opacity: max(0, 0.5 - _offset / 800),
            child: Text(
              'Flutter Developer & Designer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: shortestSide > 530
                    ? 60 + (shortestSide / 100)
                    : 40 - (shortestSide / 50),
              ),
            ),
          ),
        ),
        SizedBox(height: height / 4),
        RotatedBox(
          quarterTurns: 2,
          child: Icon(Icons.arrow_upward, color: Colors.grey[700]),
        ),
        // SizedBox(height: 20),
        // Text(
        //   'SCROLL DOWN',
        //   style: Theme.of(context).textTheme.caption.copyWith(
        //         color: Colors.grey[600],
        //       ),
        // ),
      ],
    );
  }
}
