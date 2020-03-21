import 'package:flutter/material.dart';

const List<PopupMenuEntry<String>> languageMenu = [
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
