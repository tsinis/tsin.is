import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';
import '../generated/my_icons.dart';
import '../services/url_click.dart';

class CVButtons extends ButtonBar {
  const CVButtons([Key key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isSmartWatch = MediaQuery.of(context).size.width < 300.0;
    return ButtonBar(
      buttonPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      buttonMinWidth: 300.0,
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Tooltip(
          preferBelow: MediaQuery.of(context).size.width > 1439.0,
          message: Open.cvURL(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: RaisedButton(
              color: Theme.of(context).dividerColor,
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3.0,
              onPressed: () => Open.url(Open.cvURL()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _isSmartWatch
                      ? const SizedBox.shrink()
                      : const Icon(
                          MyIcon.file_pdf,
                          color: Colors.redAccent,
                        ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 10.0,
                      maxWidth: 15.0,
                    ),
                  ),
                  AutoSizeText(
                    S.of(context).cv,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              ),
            ).showCursorOnHover,
          ),
        ),
        Tooltip(
          message: 'Microsoft OneDrive',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: OutlineButton(
              borderSide: const BorderSide(width: 2.4, color: Colors.blueGrey),
              highlightedBorderColor: Colors.blueGrey[400],
              hoverColor: Colors.blueGrey.withOpacity(0.1),
              textColor: Colors.blueGrey[600],
              color: Colors.blueGrey,
              onPressed: Open.cloud,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _isSmartWatch
                      ? const SizedBox.shrink()
                      : Icon(MyIcon.docs, color: Colors.blueGrey[400]),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 10.0,
                      maxWidth: 15.0,
                    ),
                  ),
                  AutoSizeText(S.of(context).cloud,
                      maxLines: 1, style: Theme.of(context).textTheme.button),
                ],
              ),
            ).showCursorOnHover,
          ),
        ),
      ],
    );
  }
}
