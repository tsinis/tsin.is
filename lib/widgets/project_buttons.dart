import 'package:flutter/material.dart';

import 'social_icons.dart';

class ProjectButtonBar extends ButtonBar {
  @override
  Widget build(BuildContext context) => ButtonBar(
        buttonMinWidth: 200.0,
        alignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          OutlineButton(
            onPressed: () => print('Dribbble Pressed'),
            child: Row(
              children: <Widget>[
                Icon(SocialIcons.dribbble),
                SizedBox(width: 10.0),
                Text('Design')
              ],
            ),
          ),
          RaisedButton(
            onPressed: () => print('Github Pressed'),
            child: Row(
              children: <Widget>[
                Icon(SocialIcons.github_circled),
                SizedBox(width: 10.0),
                Text('Code')
              ],
            ),
          ),
        ],
      );
}
