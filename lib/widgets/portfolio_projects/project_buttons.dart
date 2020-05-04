import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../generated/social_icons.dart';
import '../../services/url_click.dart';

class ProjectButtonBar extends ButtonBar {
  const ProjectButtonBar(this.designURL, this.appURL, {this.tooTight, Key key})
      : super(key: key);

  final String designURL, appURL;
  final bool tooTight;

  bool get _openSource => appURL.toLowerCase().contains('github');

  bool get _video => designURL.toLowerCase().contains('vimeo');

  @override
  Widget build(BuildContext context) => ButtonBar(
        buttonPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        buttonMinWidth: 220.0,
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: _video
                ? OutlineButton(
                    borderSide: BorderSide(
                      width: 4.8,
                      color: Colors.cyan[300],
                    ),
                    highlightedBorderColor: Colors.cyanAccent[400],
                    hoverColor: Colors.cyan.withOpacity(0.1),
                    textColor: Colors.cyanAccent[700],
                    color: Colors.cyan[600],
                    onPressed: () => click(designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          SocialIcons.vimeo,
                          color: Colors.cyan[300],
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 10.0,
                            maxWidth: 15.0,
                          ),
                        ),
                        Text((tooTight ? '${S.of(context).see} ' : '') +
                            S.of(context).inAction),
                      ],
                    ),
                  ).showCursorOnHover
                : OutlineButton(
                    borderSide: BorderSide(width: 4.8, color: Colors.pinkAccent[100]),
                    highlightedBorderColor: Colors.pink[200],
                    hoverColor: Colors.pink.withOpacity(0.1),
                    textColor: Colors.pink[400],
                    color: Colors.pink,
                    onPressed: () => click(designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          SocialIcons.dribbble,
                          color: Colors.pink[300],
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 10.0,
                            maxWidth: 15.0,
                          ),
                        ),
                        Text((tooTight ? '${S.of(context).see} ' : '') +
                            S.of(context).theDesign),
                      ],
                    ),
                  ).showCursorOnHover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              color: _openSource ? Colors.grey[300] : Colors.lightGreen,
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3.0,
              onPressed: () => click(appURL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _openSource
                    ? <Widget>[
                        Icon(SocialIcons.github_circled, color: Colors.grey[700]),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 5.0,
                            maxWidth: 10.0,
                          ),
                        ),
                        Text((tooTight ? '${S.of(context).check} ' : '') +
                            S.of(context).theCode, style: TextStyle(color: Colors.grey[800]),),
                      ]
                    : <Widget>[
                        Icon(
                          SocialIcons.google_play,
                          color: Colors.lightGreen[50],
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 10.0,
                            maxWidth: 15.0,
                          ),
                        ),
                        Text(
                          'Google Play',
                          style: TextStyle(color: Colors.lightGreen[50]),
                        ),
                      ],
              ),
            ).showCursorOnHover,
          ),
        ],
      );
}

// XXX: New Icons Added: codepen, appstore_squared, appstore.