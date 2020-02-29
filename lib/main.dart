// import 'dart:math' show pi;

import 'package:flutter/material.dart';
import './entrance_fader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Roman Cinis',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          fontFamily: 'Hagrid',
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 28),
          ),
        ),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final Color _backgroundColor = Colors.grey;
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
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/images/header.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.2 * screenHeight,
            left: 0,
            right: 0,
            child: MainText(),
          ),
          Header(),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/images/middle.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
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
                  stops: [0, 1],
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
                  child: Page1(),
                ),
                Page2(),
                Page3(),
                Container(
                  height: 100,
                  color: _darkerColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        children: <Widget>[
          Text('tsin.is'),
          Spacer(),
          if (MediaQuery.of(context).size.width > 900) ...[
            Text('About'),
            SizedBox(width: 32),
            Text('Portfolio'),
            SizedBox(width: 32),
            Text('Expirience'),
            SizedBox(width: 32),
            // Text('Gallery'),
            // SizedBox(width: 32),
            Text('Contact'),
            SizedBox(width: 64),
          ],
          Icon(
            Icons.menu,
            color: _backgroundColor,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'About me',
          style: TextStyle(color: _backgroundColor),
        ),
        SizedBox(height: 16),
        Container(
          height: 1,
          width: 64,
          color: _backgroundColor,
        ),
        SizedBox(height: 32),
        Text(
          'Flutter Developer & Designer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 60 : 40,
          ),
        ),
        SizedBox(height: 32),
        RotatedBox(
          quarterTurns: 2,
          child: Icon(Icons.arrow_upward, color: Colors.grey),
        ),
        SizedBox(height: 16),
        Text('SCROLL DOWN', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: <Widget>[
          Text(
            'Hello World!',
            // style: TextStyle(
            //   fontFamily: 'Roboto',
            //   color: Colors.black,
            //   fontSize: 16,
            //   fontWeight: FontWeight.w500,
            // ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Roman',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                ' Cinis',
                style: TextStyle(color: Colors.black, fontSize: 30),
              )
            ],
          ),
          SizedBox(height: height * 0.1),
          if (width > 440)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                      'I am awarded T-shaped specialist in the fields of Flutter Development and Design, with great love for “juicy” animations and good UX.'),
                ),
                SizedBox(width: 64),
                Expanded(
                  child: Text(
                      'In video below, you can see a one of the winning submissions in the Google & Lenovo dev/design contest, called Flutter Clock. More at: www.flutter.dev/clock'),
                )
              ],
            )
          else ...[
            Text(
                'I am awarded T-shaped specialist in the fields of Flutter Development and Design, with great love for “juicy” animations and good UX.'),
            SizedBox(height: 16),
            Text(
                'In video below, you can see a one of the winning submissions in the Google & Lenovo dev/design contest, called Flutter Clock. More at: www.flutter.dev/clock'),
          ],
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: _backgroundColor,
      height: height > width ? height * 0.5 : height * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.4,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: EntranceFader(
                offset: Offset(width / 4, 0),
                duration: Duration(seconds: 1),
                child: Text(
                  'AWARDED',
                  style: TextStyle(
                    color: _darkerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.4,
            child: Container(
              color: _darkerColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              duration: Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/clock.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  Icon(
                    Icons.play_circle_outline,
                    size: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: _darkerColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text('Portfolio', style: TextStyle(color: Colors.black)),
            SizedBox(height: height * 0.05),
            _header(),
            SizedBox(height: height * 0.1),
            if (width > height)
              Row(
                children: <Widget>[
                  Expanded(child: _leftSide(width)),
                  SizedBox(width: width * 0.1),
                  Expanded(child: _rightSide(height, width))
                ],
              )
            else ...[
              _leftSide(width),
              _rightSide(height, width),
            ],
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  RichText _header() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontFamily: 'Hagrid Text',
        ),
        children: [
          TextSpan(
            text: 'Here you can find',
          ),
          TextSpan(
            text: 'some of my ',
          ),
          TextSpan(
            text: 'projects and repositories',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Hagrid Text',
            ),
          )
        ],
      ),
    );
  }

  Widget _rightSide(double height, double width) {
    return EntranceFader(
      offset: Offset(width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Container(
        height: height / 2,
        child: Stack(
          alignment: Alignment(0, 0.5),
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                );
              },
            ),
            Image.asset('assets/images/clock.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(double width) {
    return EntranceFader(
      offset: Offset(-width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Steampunk Flutter Clock',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          SizedBox(height: 32),
          Text(
            'I have made a analog clock variant, with look and feel of, late 18 or early 19 century. This is mainly design contest, so, there is a lot of details and animations inside, made with Rive (ex Flare) tool',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 32),
          Text(
            'GitHub Repository',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
