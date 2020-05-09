import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';

import 'screens/main_page.dart';
import 'services/locale_builder.dart';

Future<void> _cacheAvatar() async => await cachedActor(MyWeb.cachedAvatar);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  await _cacheAvatar().whenComplete(() async => await findSystemLocale()
      .then<void>((_detectedLocale) =>
          LocaleBuilder.language = _detectedLocale.substring(0, 2))
      .whenComplete(() => runApp(const MyWeb())));
}
