import 'dart:math' show max, min, pi;

import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_localizations/flutter_localizations.dart';

import '../animations/background.dart';
import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';
import '../generated/social_icons.dart';
import '../services/locale_builder.dart';
import '../themes/theme.dart';
import '../widgets/circular_text.dart';
import '../widgets/language_menu.dart';
import '../widgets/navigation/scroll_progress_bar.dart';
import '../widgets/navigation/side_menu.dart';
import 'sections/about.dart';
import 'sections/contacts.dart';
import 'sections/footer.dart';
import 'sections/header.dart';
import 'sections/main_text.dart';
import 'sections/portfolio.dart';

class MyWeb extends StatelessWidget {
  const MyWeb({Key key}) : super(key: key);
  static final AssetProvider cachedAvatar =
      AssetFlare(bundle: rootBundle, name: 'assets/images/avatar.flr');
  @override
  Widget build(BuildContext context) => LocaleBuilder(
      builder: (context) => MaterialApp(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale(LocaleBuilder.language ?? 'en'),
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: MyTheme.defaultTheme,
              home: _MyHomePage()));
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  static ScrollController _scrollController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  double get height => MediaQuery.of(context).size.height;

  bool get _isSmartPhone =>
      (MediaQuery.of(context).size.width < 646.5 || offset > height);

  Color get _grey => Theme.of(context).primaryColor;

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        endDrawer: SideMenu(_scrollController),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: -0.3 * offset,
              left: 0,
              right: 0,
              height: height,
              child: RepaintBoundary(
                child: AnimatedBackground(),
              ),
            ),
            Positioned(
              top: 0.2 * height,
              left: 0,
              right: 0,
              child: MainText(offset),
            ),
            Positioned(
              top: height * 0.8 - offset,
              left: 0,
              right: 0,
              height: height * 0.2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.8],
                    colors: [_grey.withOpacity(0), _grey],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.95 - offset,
              left: 0,
              right: 0,
              height: height / 3.0,
              child: Container(
                height: height / 3.0,
                width: double.infinity,
                color: _grey,
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              cacheExtent: double.infinity,
              controller: _scrollController,
              children: <Widget>[
                Container(height: height),
                Container(
                  color: _grey,
                  child: About(MyWeb.cachedAvatar),
                ),
                const Portfolio(),
                const Contact(),
                const Footer()
              ],
            ),
            Positioned(
              right: -(height / 3.0),
              top: height / 2.0,
              height: 2.0,
              width: height * 0.75,
              child: _scrollController.hasClients
                  ? ScrollProgress(
                      height: height,
                      offset: offset,
                      scrollController: _scrollController)
                  : Container(),
            ),
            (height > MediaQuery.of(context).size.width)
                ? Container()
                : Positioned(
                    left: 80.0,
                    bottom: 70.0,
                    child: CircularText(
                      textStyle: Theme.of(context).textTheme.overline.copyWith(
                            fontSize: 10.0,
                            color: Colors.white.withOpacity(
                              min(offset / 1000.0, 0.3),
                            ),
                          ),
                      startAngle: -pi / 2.0 + offset / 500.0,
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(
                  opacity: max(0, 1.0 - offset / height),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 30.0, left: _isSmartPhone ? 30.0 : 50.0),
                    child: LanguageMenu(
                        isSmartphone: _isSmartPhone,
                        language: S.of(context).language,
                        tooltip: S.of(context).selectLang,
                        onSelected: (String _selectedLang) {
                          LocaleBuilder.language = _selectedLang;
                          LocaleBuilder.of(context).rebuild();
                        }).showCursorOnHover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, right: _isSmartPhone ? 20.0 : 50.0),
                  child: _isSmartPhone
                      ? IconButton(
                          icon: const Icon(SocialIcons.menu),
                          color: Theme.of(context).accentColor,
                          onPressed: () =>
                              _scaffoldKey.currentState.openEndDrawer(),
                        ).showCursorOnHover.moveUpOnHover
                      : Opacity(
                          opacity: max(0, 1.0 - offset / height),
                          child: Header(_scrollController),
                        ),
                )
              ],
            )
          ],
        ),
      );
}
