import 'package:flutter/material.dart';

class LanguageMenu<String> extends PopupMenuButton<String> {
  LanguageMenu({
    @required PopupMenuItemSelected<String> onSelected,
    String tooltip,
    Widget child,
    PopupMenuItemBuilder<String> itemBuilder,
  }) : super(
          itemBuilder: _langMenuBuilder(itemBuilder),
          onSelected: onSelected,
          tooltip: 'Select your language',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.translate,
                color: Colors.grey[800],
              ),
              SizedBox(width: 10.0),
              Text(
                'Language',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        );

  static PopupMenuItemBuilder _langMenuBuilder(
          PopupMenuItemBuilder itemBuilder) =>
      (context) => _languageMenu;
}

const List<PopupMenuEntry<String>> _languageMenu = [
  const PopupMenuItem<String>(
    value: 'en',
    child: Text('English'),
  ),
  const PopupMenuItem<String>(
    value: 'cz',
    child: Text('Čeština'),
  ),
  const PopupMenuItem<String>(
    value: 'ru',
    child: Text('Русский'),
  ),
  const PopupMenuItem<String>(
    value: 'de',
    child: Text('Deutsch'),
  ),
];
