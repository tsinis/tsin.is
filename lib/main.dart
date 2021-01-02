// ignore: import_of_legacy_library_into_null_safe
import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:intl/intl_browser.dart';

import 'screens/main_page.dart';
import 'services/div_remover.dart';
import 'services/locale/locale.dart';
import 'widgets/avatar.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  DivRemover.removeFromHTML();
  WidgetsFlutterBinding.ensureInitialized();
  FlareCache.doesPrune = false;
  await cachedActor(Avatar.cache);
  await findSystemLocale()
      .then<String>((_detectedLocale) => language = _detectedLocale.substring(0, 2))
      .whenComplete(() => runApp(const MyWeb()));
}
