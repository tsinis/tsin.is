import 'package:flutter/material.dart';

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

final List<PopupMenuItem<String>> _langList = _languagesMap
    .map<String, PopupMenuItem<String>>(
      (String _langCode, String _langName) => MapEntry<String, PopupMenuItem<String>>(
        _langCode,
        PopupMenuItem<String>(value: _langCode, child: Center(child: Text(_langName.toString()))),
      ),
    )
    .values
    .toList();

List<PopupMenuItem<String>> get langList => _langList;
