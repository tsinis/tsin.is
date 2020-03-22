import 'package:flutter/material.dart';

import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        children: <Widget>[
          if (MediaQuery.of(context).size.width > 640.0) ...[
            GestureDetector(
              // behavior: HitTestBehavior.translucent,
              onTap: () => print('About Click'),
              child: Text(
                S.of(context).about,
              ).showCursorOnHover.moveUpOnHover,
            ),
            SizedBox(width: 30.0),
            Text(
              S.of(context).portfolio,
            ).showCursorOnHover.moveUpOnHover,
            SizedBox(width: 30.0),
            Text(
              S.of(context).contact,
            ).showCursorOnHover.moveUpOnHover,
          ],
        ],
      ),
    );
  }
}
