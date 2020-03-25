import 'package:flutter/material.dart';

import 'social_icons.dart';

class ProjectButtonBar extends ButtonBar {
  ProjectButtonBar(this.designURL, this.appURL);
  final String designURL, appURL;

  bool get _openSource => appURL.contains('github');

  @override
  Widget build(BuildContext context) => ButtonBar(
        buttonPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        buttonMinWidth: 180.0,
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: OutlineButton(
              borderSide: BorderSide(width: 4.0, color: Colors.pink[600]),
              highlightedBorderColor: Colors.pink[200],
              hoverColor: Colors.pink.withOpacity(0.1),
              textColor: Colors.pink[300],
              color: Colors.pink,
              onPressed: () => print('Link to $designURL'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    SocialIcons.dribbble,
                    color: Colors.pink,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 10.0,
                      maxWidth: 15.0,
                    ),
                  ),
                  Text('See the Design'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              color: _openSource ? null : Colors.green,
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3.0,
              onPressed: () => print('Link to $appURL'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _openSource
                    ? <Widget>[
                        Icon(SocialIcons.github_circled),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 5.0,
                            maxWidth: 10.0,
                          ),
                        ),
                        Text('Check the Code')
                      ]
                    : <Widget>[
                        Icon(
                          SocialIcons.google,
                          color: Colors.grey[100],
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 5.0,
                            maxWidth: 10.0,
                          ),
                        ),
                        Text(
                          'Google Play',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
              ),
            ),
          ),
        ],
      );
}
