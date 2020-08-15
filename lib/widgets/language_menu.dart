import 'package:flutter/material.dart';
import '../generated/my_icons.dart';

class LanguageMenu<String> extends StatelessWidget {
  LanguageMenu({Key key, this.onSelected, this.tooltip, this.language, this.isSmartphone}) : super(key: key);

  @required
  final bool isSmartphone;

  @required
  final String tooltip, language;

  @required
  final PopupMenuItemSelected<String> onSelected;

  final List<PopupMenuItem<String>> _langList = _languagesMap
      .map<String, PopupMenuItem<String>>(
        (_langCode, _langName) => MapEntry<String, PopupMenuItem<String>>(
          _langCode as String,
          PopupMenuItem<String>(value: _langCode as String, child: Center(child: Text(_langName.toString()))),
        ),
      )
      .values
      .toList();

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: (_) => _langList,
        tooltip: tooltip.toString(),
        onSelected: onSelected,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
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

const Map<String, String> _languagesMap = <String, String>{
  'cs': 'Čeština',
  // 'de': 'Deutsch',
  'en': 'English',
  // 'hr': "Hrvatski",
  // 'pl': "Polski",
  'ru': 'Русский',
  'sk': 'Slovenčina',
  // 'sl': "Slovenščina",
  // 'sr': "Српски",
};
