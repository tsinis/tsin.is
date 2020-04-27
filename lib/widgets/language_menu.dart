import 'package:flutter/material.dart';

class LanguageMenu<String> extends StatelessWidget {
  const LanguageMenu(
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

  static const Map _languagesMap = <dynamic, dynamic>{
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

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return _languagesMap
            .map<String, PopupMenuItem<String>>(
              (dynamic _langCode, dynamic _langName) {
                return MapEntry<String, PopupMenuItem<String>>(
                  _langCode as String,
                  PopupMenuItem<String>(
                    value: _langCode as String,
                    child: Center(child: Text(_langName.toString())),
                  ),
                );
              },
            )
            .values
            .toList();
      },
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
}
