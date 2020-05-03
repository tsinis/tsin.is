import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';

import 'screens/main_page.dart';
import 'services/locale_builder.dart';
Future<void> main() async => await findSystemLocale().then((_detectedLocale) {
      LocaleBuilder.language = _detectedLocale.substring(0, 2);
      runApp(const MyWeb());
    });
