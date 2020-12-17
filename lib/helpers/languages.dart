import 'package:flutter/material.dart';
import '../themes/fonts.dart';

const Map<String, String> _languagesMap = <String, String>{
  'cs': 'Čeština',
  // 'de': 'Deutsch',
  'en': 'English',
  // 'pl': "Polski",
  'ru': 'Русский',
  'sk': 'Slovenčina',
  // 'sr': "Српски",
};

final List<PopupMenuItem<String>> _langList = _languagesMap
    .map<String, PopupMenuItem<String>>(
      (String langCode, String langName) => MapEntry<String, PopupMenuItem<String>>(
        langCode,
        PopupMenuItem<String>(
          value: langCode,
          child: Center(child: Text(langName, style: MyTextStyles.bodyText1.copyWith(fontSize: 20))),
        ),
      ),
    )
    .values
    .toList();

List<PopupMenuItem<String>> get langList => _langList;
