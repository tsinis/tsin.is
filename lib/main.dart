import 'dart:math' show max;

import 'package:flutter/material.dart';

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
import 'widgets/navigation/language_menu.dart';
// import 'screens/presentation.dart';

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
  ScrollController _scrollController;
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

  Color get _grey => Theme.of(context).primaryColor;

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SideMenu(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: height,
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
              cacheExtent: 64.0,
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
                Contact(),
                Footer()
              ],
            ),
          ),
          (MediaQuery.of(context).size.width < 646.5 || offset > height)
              ? Positioned(
                  top: 30.0,
                  right: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      (_scaffoldKey.currentState.isEndDrawerOpen)
                          ?
                          // print('no'): print('yes');
                          _scaffoldKey.currentState.openDrawer()
                          : _scaffoldKey.currentState.openEndDrawer();
                    },
                  ).showCursorOnHover.moveUpOnHover,
                )
              : Opacity(
                  opacity: max(0, 1.0 - offset / height),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: LanguageMenu(
                          language: S.of(context).language,
                          tooltip: S.of(context).selectLang,
                          onSelected: (String value) => setState(() {
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
