import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final Color _backgroundColor;
  const MainText(this._backgroundColor);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text('Hello there, I\'m',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.grey.shade700)
              // style: TextStyle(color: _backgroundColor, fontWeight: FontWeight.w100,),
              ),
          SizedBox(height: 50),
          Container(
            height: 1,
            width: 200,
            color: Colors.grey.shade600,
          ),
          SizedBox(height: 20),
          Text(
            'Flutter Developer & Designer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize:
                  MediaQuery.of(context).size.shortestSide > 400 ? 70 : 40,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.shortestSide / 5.5),
          RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.arrow_upward, color: Colors.grey[600]),
          ),
          SizedBox(height: 20),
          Text(
            'SCROLL DOWN',
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      );
}
