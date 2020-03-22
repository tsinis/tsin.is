import 'dart:math';

import 'package:flutter/material.dart';

import 'themes/theme.dart';
import 'extensions/hover_extensions.dart';
import 'generated/l10n.dart';
import 'screens/about.dart';
import 'screens/header.dart';
import 'screens/main_text.dart';
import 'screens/portfolio.dart';
import 'screens/presentation.dart';
import 'widgets/language_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        builder: (BuildContext context, Widget child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        ),
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Roman Cinis',
        theme: MyTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        home: _MyHomePage(),
      );
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  ScrollController _scrollController;

  double get height => MediaQuery.of(context).size.height;
  // double get _screenWidth => MediaQuery.of(context).size.width;
  Color get _grey => Theme.of(context).primaryColor;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  @override
  Widget build(BuildContext context) {
    // print(offset);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: height,
            // width: _screenWidth * 0.7,
            child: Opacity(
              opacity: 0.05,
              child: RepaintBoundary(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Image.asset(
                    'assets/images/header.gif',
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.none,
                  ),
                ),
              ),
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
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: height),
                Container(
                  height: 100.0,
                  color: _grey,
                ),
                Container(
                  color: _grey,
                  child: About(),
                ),
                Portfolio(),
                Presentation(),
                Container(
                  height: 100.0,
                  color: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
          ),
          (MediaQuery.of(context).size.width < 641.0 || offset > height)
              ? Positioned(
                  top: 52.0,
                  right: 20.0,
                  child: Icon(Icons.menu, color: Theme.of(context).accentColor
                          // size: 32,
                          )
                      .showCursorOnHover
                      .moveUpOnHover,
                )
              : Opacity(
                  opacity: max(0, 1.0 - offset / height),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: LanguageMenu(
                          onSelected: (value) => setState(() {
                            S.load(Locale(value));
                          }),
                        ).showCursorOnHover,
                      ),
                      Spacer(),
                      Header(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
