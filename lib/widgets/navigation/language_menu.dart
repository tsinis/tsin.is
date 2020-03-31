import 'package:flutter/material.dart';

class LanguageMenu<String> extends PopupMenuButton<String> {
  LanguageMenu({
    @required PopupMenuItemSelected<String> onSelected,
    @required tooltip,
    @required language,
    @required bool isSmartphone,
    PopupMenuItemBuilder<String> itemBuilder,
  }) : super(
          itemBuilder: _langMenuBuilder(itemBuilder),
          tooltip: tooltip,
          onSelected: onSelected,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.translate,
                color: Colors.grey[800],
              ),
              SizedBox(width: 10.0),
              isSmartphone
                  ? SizedBox(height: 0)
                  : Text(
                      language,
                      style: TextStyle(color: Colors.grey[700]),
                    )
              // : null,
            ],
          ),
        );

  static PopupMenuItemBuilder _langMenuBuilder(
          PopupMenuItemBuilder itemBuilder) =>
      (context) => _languageMenu;
}

const List<PopupMenuEntry<String>> _languageMenu = [
  const PopupMenuItem<String>(
    value: 'de',
    child: Center(child: Text('Deutsch')),
  ),
  const PopupMenuItem<String>(
    value: 'en',
    child: Center(child: Text('English')),
  ),
  const PopupMenuItem<String>(
    value: 'sk',
    child: Center(child: Text('Slovenčina')),
  ),
  const PopupMenuItem<String>(
    value: 'cs',
    child: Center(child: Text('Čeština')),
  ),
  const PopupMenuItem<String>(
    value: 'ru',
    child: Center(child: Text('Русский')),
  ),
];
