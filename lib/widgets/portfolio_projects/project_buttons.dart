import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';
import '../../extensions/string_capitalize.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';

class ProjectButtonBar extends ButtonBar {
  const ProjectButtonBar(this._designURL, this._appURL, {this.isWide, Key key})
      : super(key: key);

  final bool isWide;

  final String _designURL, _appURL;

  bool get _openSource => _appURL.toLowerCase().contains('github');

  bool get _video => _designURL.toLowerCase().contains('vimeo');

  @override
  Widget build(BuildContext context) {
    bool _isSmartWatch = MediaQuery.of(context).size.width < 321.0;
    return ButtonBar(
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
                  onPressed: () => Open.url(_designURL),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _isSmartWatch
                          ? const SizedBox()
                          : Icon(
                              MyIcon.vimeo_v,
                              color: Colors.cyan[400],
                            ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 10.0,
                          maxWidth: 15.0,
                        ),
                      ),
                      AutoSizeText(
                          ((isWide ? '${S.of(context).see} ' : '') +
                                  S.of(context).inAction)
                              .capitalizeFirstLetter(),
                          maxLines: 1),
                    ],
                  ),
                ).showCursorOnHover
              : OutlineButton(
                  borderSide:
                      BorderSide(width: 4.8, color: Colors.pinkAccent[100]),
                  highlightedBorderColor: Colors.pink[200],
                  hoverColor: Colors.pink.withOpacity(0.1),
                  textColor: Colors.pink[400],
                  color: Colors.pink,
                  onPressed: () => Open.url(_designURL),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _isSmartWatch
                          ? const SizedBox()
                          : Icon(
                              MyIcon.dribbble,
                              color: Colors.pink[300],
                            ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 10.0,
                          maxWidth: 15.0,
                        ),
                      ),
                      AutoSizeText(
                          ((isWide ? '${S.of(context).see} ' : '') +
                                  S.of(context).theDesign)
                              .capitalizeFirstLetter(),
                          maxLines: 1),
                    ],
                  ),
                ).showCursorOnHover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: RaisedButton(
            color: _openSource
                ? Theme.of(context).primaryColorLight
                : Colors.lightGreen,
            elevation: 1.5,
            hoverElevation: 2.5,
            highlightElevation: 3.0,
            onPressed: () => Open.url(_appURL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _openSource
                  ? <Widget>[
                      _isSmartWatch
                          ? const SizedBox()
                          : const Icon(
                              MyIcon.github,
                              // color: Colors.black
                            ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 5.0,
                          maxWidth: 10.0,
                        ),
                      ),
                      AutoSizeText(
                        ((isWide ? '${S.of(context).check} ' : '') +
                                S.of(context).theCode)
                            .capitalizeFirstLetter(),
                        maxLines: 1,
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ]
                  : <Widget>[
                      _isSmartWatch
                          ? const SizedBox()
                          : const Icon(MyIcon.google_play, color: Colors.white),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 10.0,
                          maxWidth: 15.0,
                        ),
                      ),
                      AutoSizeText(
                        isWide ? 'Google Play' : 'Play',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
            ),
          ).showCursorOnHover,
        ),
      ],
    );
  }
}
