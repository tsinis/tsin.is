import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_browser.dart';

import 'screens/main_page.dart';
import 'services/locale_builder.dart';
import 'widgets/avatar.dart';

Future<void> _cacheAvatar() async => await cachedActor(Avatar.cache);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  await _cacheAvatar();
  await findSystemLocale()
      .then<String>((_detectedLocale) => LocaleBuilder.language = _detectedLocale.substring(0, 2))
      .whenComplete(() => runApp(const MyWeb()));
}
