import 'package:flutter/material.dart';

import '../../services/url_click.dart';
import '../social_icons.dart';
import '../../extensions/hover_extensions.dart';

class ProjectButtonBar extends ButtonBar {
  ProjectButtonBar(this.designURL, this.appURL, this.tooTight);

  final String designURL, appURL;
  final bool tooTight;

  bool get _openSource => appURL.toLowerCase().contains('github');

  bool get _video => designURL.toLowerCase().contains('vimeo');

  @override
  Widget build(BuildContext context) => ButtonBar(
        buttonPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        buttonMinWidth: 180.0,
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: _video
                ? OutlineButton(
                    borderSide: BorderSide(
                      width: 4.8,
                      color: Colors.cyan[700],
                    ),
                    highlightedBorderColor: Colors.cyan[300],
                    hoverColor: Colors.cyan.withOpacity(0.1),
                    textColor: Colors.cyan[400],
                    color: Colors.cyan[600],
                    onPressed: () => click(designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          SocialIcons.vimeo,
                          color: Colors.cyan,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 10.0,
                            maxWidth: 15.0,
                          ),
                        ),
                        Text((tooTight ? 'See ' : '') + 'in Action'),
                      ],
                    ),
                  ).showCursorOnHover
                : OutlineButton(
                    borderSide: BorderSide(width: 4.8, color: Colors.pink[600]),
                    highlightedBorderColor: Colors.pink[200],
                    hoverColor: Colors.pink.withOpacity(0.1),
                    textColor: Colors.pink[300],
                    color: Colors.pink,
                    onPressed: () => click(designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          SocialIcons.dribbble,
                          color: Colors.pink,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 10.0,
                            maxWidth: 15.0,
                          ),
                        ),
                        Text((tooTight ? 'See ' : '') + 'the Design'),
                      ],
                    ),
                  ).showCursorOnHover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              color: _openSource ? null : Colors.green,
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3.0,
              onPressed: () => click(appURL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _openSource
                    ? <Widget>[
                        Icon(SocialIcons.github_circled),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 5.0,
                            maxWidth: 10.0,
                          ),
                        ),
                        Text((tooTight ? 'Check ' : '') + 'the Code'),
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
                        ),
                      ],
              ),
            ).showCursorOnHover,
          ),
        ],
      );
}
