import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extensions/regular_expressions.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';

class ProjectButtonBar extends ButtonBar {
  const ProjectButtonBar(this._designURL, this._appURL, {this.isWide});

  final bool isWide;

  final String _designURL, _appURL;

  bool get _openSource => _appURL.toLowerCase().contains('github');

  bool get _video => _designURL.toLowerCase().contains('vimeo');

  @override
  Widget build(BuildContext context) {
    final bool _isSmartWatch = MediaQuery.of(context).size.width < 321;
    return ButtonBar(
      buttonPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      buttonMinWidth: 220,
      buttonHeight: 50,
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Tooltip(
          message: '🔗 ${_designURL.short}',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: _video
                ? OutlineButton(
                    borderSide: BorderSide(width: 2.4, color: Colors.cyan[400]),
                    highlightedBorderColor: Colors.cyanAccent,
                    hoverColor: Colors.cyan.withOpacity(0.1),
                    textColor: Colors.cyan[800],
                    color: Colors.cyan[600],
                    onPressed: () => Open.url(_designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (_isSmartWatch) const SizedBox.shrink() else const Icon(MyIcon.vimeo_v, color: Colors.cyan),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                        AutoSizeText(
                            ((isWide ? '${S.of(context).see} ' : '') + S.of(context).inAction).capitalizeFirstLetter,
                            maxLines: 1),
                      ],
                    ),
                  )
                : OutlineButton(
                    borderSide: BorderSide(width: 2.4, color: Colors.pinkAccent[100]),
                    highlightedBorderColor: Colors.pink[200],
                    hoverColor: Colors.pink.withOpacity(0.1),
                    textColor: Colors.pink[400],
                    color: Colors.pink,
                    onPressed: () => Open.url(_designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (_isSmartWatch) const SizedBox.shrink() else Icon(MyIcon.dribbble, color: Colors.pink[300]),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                        AutoSizeText(
                            ((isWide ? '${S.of(context).see} ' : '') + S.of(context).theDesign).capitalizeFirstLetter,
                            maxLines: 1),
                      ],
                    ),
                  ),
          ),
        ),
        Tooltip(
          message: '🔗 $_appURL',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
              height: 52,
              color: _openSource ? Theme.of(context).primaryColorLight : Colors.lightGreen,
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3,
              onPressed: () => Open.url(_appURL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _openSource
                    ? <Widget>[
                        if (_isSmartWatch) const SizedBox.shrink() else const Icon(MyIcon.github),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 5, maxWidth: 10)),
                        AutoSizeText(
                            ((isWide ? '${S.of(context).check} ' : '') + S.of(context).theCode).capitalizeFirstLetter,
                            maxLines: 1,
                            style: TextStyle(color: Theme.of(context).primaryColorDark)),
                      ]
                    : <Widget>[
                        if (_isSmartWatch)
                          const SizedBox.shrink()
                        else
                          const Icon(MyIcon.google_play, color: Colors.white),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                        AutoSizeText(
                          isWide ? 'Google Play' : 'Play',
                          maxLines: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
