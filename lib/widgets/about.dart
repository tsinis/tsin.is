import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: <Widget>[
          Text(
            'My name is',
            // style: TextStyle(
            //   fontFamily: 'Roboto',
            //   color: Colors.black,
            //   fontSize: 16,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
          // SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Roman',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              ),
              Text(
                ' Cinis',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 30),
              )
            ],
          ),
          SizedBox(height: height * 0.1),
          if (width > 440)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                      'I am awarded T-shaped specialist in the fields of Flutter Development and Design, with great love for “juicy” animations and good UX.'),
                ),
                SizedBox(width: 64),
                Expanded(
                  child: Text(
                      'In video below, you can see a one of the winning submissions in the Google & Lenovo dev/design contest, called Flutter Clock. More at: www.flutter.dev/clock'),
                )
              ],
            )
          else ...[
            Text(
                'I am awarded T-shaped specialist in the fields of Flutter Development and Design, with great love for “juicy” animations and good UX.'),
            SizedBox(height: 16),
            Text(
                'In video below, you can see a one of the winning submissions in the Google & Lenovo dev/design contest, called Flutter Clock. More at: www.flutter.dev/clock'),
          ],
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
