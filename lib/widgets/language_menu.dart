import 'package:flutter/material.dart';

import '../generated/my_icons.dart';
import '../helpers/languages.dart';

class LanguageMenu<String> extends StatelessWidget {
  const LanguageMenu(
      {@required this.onSelected, @required this.tooltip, @required this.language, @required this.isSmartphone});

  final bool isSmartphone;

  final String tooltip, language;

  final PopupMenuItemSelected<String> onSelected;

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        // ignore: avoid_as
        itemBuilder: (_) => langList as List<PopupMenuEntry<String>>,
        tooltip: tooltip.toString(),
        onSelected: onSelected,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(MyIcon.globe_europe, color: Theme.of(context).primaryColorDark),
            const SizedBox(width: 10),
            if (isSmartphone)
              const SizedBox.shrink()
            else
              Text(language.toString(), style: TextStyle(color: Theme.of(context).accentColor)),
          ],
        ),
      );
}
