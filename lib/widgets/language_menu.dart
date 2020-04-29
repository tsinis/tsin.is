import 'package:flutter/material.dart';

class LanguageMenu<String> extends StatelessWidget {
   LanguageMenu(
      {Key key,
      this.onSelected,
      this.tooltip,
      this.language,
      this.isSmartphone})
      : super(key: key);

  @required
  final bool isSmartphone;

  @required
  final String tooltip, language;

  @required
  final PopupMenuItemSelected<String> onSelected;

  final List<PopupMenuItem<String>> _langList = _languagesMap
      .map<String, PopupMenuItem<String>>(
        (dynamic _langCode, dynamic _langName) =>
            MapEntry<String, PopupMenuItem<String>>(
          _langCode as String,
          PopupMenuItem<String>(
            value: _langCode as String,
            child: Center(child: Text(_langName.toString())),
          ),
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.translate,
            color: Colors.grey[800],
          ),
          const SizedBox(width: 10.0),
          isSmartphone
              ? const SizedBox(height: 0)
              : Text(
                  language.toString(),
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
        ],
      ),
    );
}

const Map _languagesMap = <String, String>{
  'cs': 'Čeština',
  'de': 'Deutsch',
  'en': 'English',
  // 'hr': "Hrvatski",
  // 'pl': "Polski",
  'ru': 'Русский',
  'sk': 'Slovenčina',
  // 'sl': "Slovenščina",
  // 'sr': "Српски",
};
