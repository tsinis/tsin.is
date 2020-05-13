import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';
import '../generated/social_icons.dart';
import '../services/url_click.dart';

class CVButtons extends ButtonBar {
  const CVButtons(this.tooTight, {Key key}) : super(key: key);

  // final String designURL, appURL;
  final bool tooTight;

  @override
  Widget build(BuildContext context) => ButtonBar(
        buttonPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        buttonMinWidth: 300.0,
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: RaisedButton(
              color: Colors.grey[400],
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3.0,
              onPressed: () => openURL('http'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    SocialIcons.file_pdf,
                    color: Colors.red[900],
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 10.0,
                      maxWidth: 15.0,
                    ),
                  ),
                  AutoSizeText(
                    // tooTight ? 'CV ' : S.of(context).cv,
                    S.of(context).cv,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              ),
            ).showCursorOnHover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: OutlineButton(
              borderSide: const BorderSide(width: 4.8, color: Colors.blueGrey),
              highlightedBorderColor: Colors.blueGrey[400],
              hoverColor: Colors.blueGrey.withOpacity(0.1),
              textColor: Colors.blueGrey[600],
              color: Colors.blueGrey,
              onPressed: () => openURL('www'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    SocialIcons.download_cloud,
                    color: Colors.blueGrey[400],
                  ),
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
        ],
      );
}
