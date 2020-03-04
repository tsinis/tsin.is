// import 'dart:math' show pi;

import 'package:flutter/material.dart';

import 'themes/theme.dart';
import 'extensions/hover_extensions.dart';
import 'screens/about.dart';
import 'screens/header.dart';
import 'screens/main_text.dart';
import 'screens/portfolio.dart';
import 'screens/presentation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Roman Cinis',
        theme: MyTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final Color _backgroundColor = Colors.grey; // ! TODO: Define colors in theme.
final Color _darkerColor = Colors.grey.shade800;

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

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
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    // print(offset);
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            // width: screenWidth * 0.7,
            child: Opacity(
              opacity: 0.05,
              child: RepaintBoundary(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
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
            top: 0.2 * screenHeight,
            left: 0,
            right: 0,
            child: MainText(_backgroundColor, offset),
          ),
          Header(_backgroundColor),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight * 0.2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.8],
                  colors: [_backgroundColor.withOpacity(0), _backgroundColor],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.95 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              height: screenHeight / 3,
              width: double.infinity,
              color: _backgroundColor,
            ),
          ),
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: screenHeight),
                Container(
                  height: 100,
                  color: _backgroundColor,
                ),
                Container(
                  color: _backgroundColor,
                  child: About(),
                ),
                Portfolio(_darkerColor),
                Presentation(_backgroundColor, _darkerColor),
                Container(
                  height: 100,
                  color: _darkerColor,
                ),
              ],
            ),
          ),
          (MediaQuery.of(context).size.width < 641 || offset > 800)
              ? Positioned(
                  top: 52,
                  right: 20,
                  child: Icon(Icons.menu, color: Colors.grey[700]
                      // size: 32,
                      ).showCursorOnHover.moveUpOnHover,
                )
              : Container(),
        ],
      ),
    );
  }
}
