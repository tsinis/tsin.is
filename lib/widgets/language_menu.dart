import 'package:flutter/material.dart';

import '../generated/my_icons.dart';
import '../helpers/languages.dart';
import '../themes/button_style.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu(
      {@required this.onSelected, @required this.tooltip, @required this.language, @required this.isSmartphone});

  final bool isSmartphone;
  final String tooltip, language;
  final PopupMenuItemSelected<String> onSelected;

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        itemBuilder: (_) => langList,
        tooltip: tooltip,
        shape: MyButtons.shape,
        color: Colors.white70,
        onSelected: onSelected,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(MyIcon.globe_europe, color: MyColors.primaryColorDark),
            const SizedBox(width: 10),
            if (isSmartphone)
              const SizedBox.shrink()
            else
              Text(language, style: MyTextStyles.bodyText1.copyWith(color: MyColors.accentColor)),
          ],
        ),
      );
}
