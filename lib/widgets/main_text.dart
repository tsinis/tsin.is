import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final Color _backgroundColor;
  final double _offset;
  const MainText(this._backgroundColor, this._offset);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          // SizedBox(height: 100),
          SizedBox(height: MediaQuery.of(context).size.shortestSide / 6),
          Text('Hello there, I\'m',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey.shade600)
              // style: TextStyle(color: _backgroundColor, fontWeight: FontWeight.w100,),
              ),
          // SizedBox(height: 100),
          SizedBox(height: MediaQuery.of(context).size.shortestSide / 10),
          // Container(
          //   height: 1,
          //   width: 200,
          //   color: Colors.transparent,
          //   // color: Colors.grey.shade600,
          // ),
          // SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.all(20),
            child: Opacity(
              opacity: 0.5,
              child: Text(
                'Flutter Developer & Designer',
                textAlign: TextAlign.center,
                // maxLines: 4,
                // softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize:
                      MediaQuery.of(context).size.shortestSide > 530 ? 75 : 40,
                  // shadows: [
                  //   Shadow(
                  //     blurRadius: 10,
                  //     color: Colors.grey[300],
                  //     offset: Offset(0, 2 + (-_offset  / 70)),
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.shortestSide / 4),
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
