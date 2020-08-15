import 'dart:math' show max, min, pi;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../animations/background.dart';
import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';
import '../generated/my_icons.dart';
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
  const MyWeb([Key key]) : super(key: key);
  @override
  Widget build(BuildContext context) => LocaleBuilder((context) => MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
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

  double get _height => MediaQuery.of(context).size.height;

  bool get _isSmartPhone => MediaQuery.of(context).size.width < 646.5 || offset > _height;

  Color get _grey => Theme.of(context).primaryColor;

  double get offset => _scrollController.hasClients ? _scrollController.offset : 0;

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
              height: _height,
              child: RepaintBoundary(child: AnimatedBackground()),
            ),
            Positioned(top: 0.2 * _height, left: 0, right: 0, child: MainText(offset)),
            Positioned(
              top: _height * 0.8 - offset,
              left: 0,
              right: 0,
              height: _height * 0.2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0.8],
                      colors: [_grey.withOpacity(0), _grey]),
                ),
              ),
            ),
            Positioned(
              top: _height * 0.95 - offset,
              left: 0,
              right: 0,
              height: _height / 3,
              child: Container(height: _height / 3, width: double.infinity, color: _grey),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              cacheExtent: double.infinity,
              controller: _scrollController,
              children: <Widget>[
                Container(height: _height),
                Container(color: _grey, child: const About()),
                const Portfolio(),
                const Contact(),
                const Footer()
              ],
            ),
            Positioned(
                right: -(_height / 3),
                top: _height / 2,
                height: 2,
                width: _height * 0.75,
                child: _scrollController.hasClients
                    ? ScrollProgress(height: _height, offset: offset, scrollController: _scrollController)
                    : const SizedBox.shrink()),
            if (_height > MediaQuery.of(context).size.width)
              const SizedBox.shrink()
            else
              Positioned(
                left: 80,
                bottom: 80,
                child: CircularText(
                  textStyle: Theme.of(context).textTheme.overline.copyWith(
                        fontSize: 10,
                        color: Colors.white.withOpacity(min(offset / 1000, 0.3)),
                      ),
                  startAngle: -pi / 2 + offset / 500,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(
                  opacity: max(0, 1 - offset / _height),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, left: _isSmartPhone ? 30 : 50),
                    child: LanguageMenu(
                        isSmartphone: _isSmartPhone,
                        language: S.of(context).language,
                        tooltip: S.of(context).selectLang,
                        // ignore: avoid_types_on_closure_parameters
                        onSelected: (String _selectedLang) {
                          LocaleBuilder.language = _selectedLang;
                          LocaleBuilder.of(context).rebuild();
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, right: _isSmartPhone ? 20 : 50),
                  child: _isSmartPhone
                      ? IconButton(
                          icon: const Icon(MyIcon.menu),
                          color: Theme.of(context).accentColor,
                          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                        ).moveUpOnHover
                      : Opacity(opacity: max(0, 1 - offset / _height), child: Header(_scrollController)),
                )
              ],
            )
          ],
        ),
      );
}
