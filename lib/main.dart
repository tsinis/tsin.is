import 'dart:math' show max, min, pi;

import 'package:flutter/material.dart';

import 'animations/background.dart';
import 'widgets/circular_text.dart';
import 'widgets/navigation/scroll_progress_bar.dart';
import 'widgets/navigation/side_menu.dart';
import 'screens/footer.dart';
import 'screens/contacts.dart';
import 'themes/theme.dart';
import 'extensions/hover_extensions.dart';
import 'generated/l10n.dart';
import 'screens/about.dart';
import 'screens/header.dart';
import 'screens/main_text.dart';
import 'screens/portfolio.dart';
import 'widgets/language_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        builder: (BuildContext context, Widget child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child),
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: MyTheme.defaultTheme,
        home: _MyHomePage(),
      );
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  ScrollController scrollController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  double get height => MediaQuery.of(context).size.height;

  bool get _isSmartPhone =>
      (MediaQuery.of(context).size.width < 646.5 || offset > height);

  Color get _grey => Theme.of(context).primaryColor;

  double get offset =>
      scrollController.hasClients ? scrollController.offset : 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        endDrawer: SideMenu(scrollController),
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
              controller: scrollController,
              children: <Widget>[
                Container(height: height),
                Container(
                  color: _grey,
                  child: About(),
                ),
                Portfolio(),
                Contact(),
                Footer()
              ],
            ),
            Positioned(
              right: -(height / 3.0),
              top: height / 2.0,
              height: 2.0,
              width: height * 0.75,
              child: scrollController.hasClients
                  ? ScrollProgress(
                      height: height,
                      offset: offset,
                      scrollController: scrollController)
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
                      onSelected: (String _selectedLand) => setState(() {
                        S.load(Locale(_selectedLand));
                      }),
                    ).showCursorOnHover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, right: _isSmartPhone ? 20.0 : 50.0),
                  child: _isSmartPhone
                      ? IconButton(
                          icon: Icon(Icons.menu),
                          color: Theme.of(context).accentColor,
                          onPressed: () =>
                              _scaffoldKey.currentState.openEndDrawer(),
                        ).showCursorOnHover.moveUpOnHover
                      : Opacity(
                          opacity: max(0, 1.0 - offset / height),
                          child: Header(scrollController),
                        ),
                )
              ],
            )
          ],
        ),
      );
}
