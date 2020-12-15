import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../generated/my_icons.dart';
import '../services/url_click.dart';

class CVButtons extends ButtonBar {
  const CVButtons();

  @override
  Widget build(BuildContext context) {
    final bool _isSmartWatch = MediaQuery.of(context).size.width < 300;
    return ButtonBar(
      buttonPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      buttonMinWidth: 300,
      buttonHeight: 50,
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Tooltip(
          preferBelow: MediaQuery.of(context).size.width > 1439,
          message: '🔗 ${Open.cvURL}',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: RaisedButton(
              color: Theme.of(context).dividerColor,
              elevation: 2,
              hoverElevation: 4,
              highlightElevation: 6,
              onPressed: () => Open.url(Open.cvURL),
              child: Row(
                mainAxisSize: _isSmartWatch ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_isSmartWatch) const SizedBox.shrink() else const Icon(MyIcon.file_pdf, color: Colors.redAccent),
                  ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                  AutoSizeText(S.of(context).cv, maxLines: 1, style: Theme.of(context).textTheme.button),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Tooltip(
          message: '🔗 Microsoft OneDrive',
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: OutlineButton(
              borderSide: const BorderSide(width: 2.6, color: Colors.blueGrey),
              highlightedBorderColor: Colors.blueGrey[400],
              hoverColor: Colors.blueGrey.withOpacity(0.1),
              textColor: Colors.blueGrey[600],
              color: Colors.blueGrey,
              onPressed: Open.cloud,
              child: Row(
                mainAxisSize: _isSmartWatch ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_isSmartWatch) const SizedBox.shrink() else Icon(MyIcon.docs, color: Colors.blueGrey[400]),
                  ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                  AutoSizeText(S.of(context).cloud, maxLines: 1, style: Theme.of(context).textTheme.button),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
