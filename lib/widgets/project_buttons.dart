import 'package:flutter/material.dart';

import 'social_icons.dart';

class ProjectButtonBar extends ButtonBar {
  ProjectButtonBar(this.designURL, this.appURL);
  final String designURL, appURL;

  bool get _openSource => appURL.contains('github');

  @override
  Widget build(BuildContext context) => ButtonBar(
        buttonPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        buttonMinWidth: 200.0,
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(
            borderSide: BorderSide(width: 3.4, color: Colors.pink[600]),
            highlightedBorderColor: Colors.pink[200],
            hoverColor: Colors.pink.withOpacity(0.1),
            textColor: Colors.pink[300],
            color: Colors.pink,
            onPressed: () => print('Link to $designURL'),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  SocialIcons.dribbble,
                  color: Colors.pink,
                ),
                SizedBox(width: 10.0),
                Text('See the Design'),
              ],
            ),
          ),
          RaisedButton(
            color: _openSource ? null : Colors.green,
            elevation: 1.5,
            hoverElevation: 2.5,
            highlightElevation: 3.0,
            onPressed: () => print('Link to $appURL'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _openSource
                  ? <Widget>[
                      Icon(SocialIcons.github_circled),
                      SizedBox(width: 10.0),
                      Text('Check the Code')
                    ]
                  : <Widget>[
                      Icon(
                        SocialIcons.google,
                        color: Colors.grey[100],
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Google Play',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
            ),
          ),
        ],
      );
}
