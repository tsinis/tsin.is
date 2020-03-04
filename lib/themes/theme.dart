import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData defaultTheme = _buildTheme();

  static ThemeData _buildTheme() {
    final ThemeData _base = ThemeData.light();

    return _base.copyWith(
      primaryColor: Colors.grey,
      textTheme: _base.textTheme.copyWith(
        headline6: _base.textTheme.headline6.copyWith(
          fontFamily: 'Hagrid',
          fontWeight: FontWeight.w900,
        ),
        headline5: _base.textTheme.headline5.copyWith(
            fontFamily: 'Hagrid',
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic),
        headline4: _base.textTheme.headline4.copyWith(
          fontFamily: 'Hagrid',
          fontWeight: FontWeight.w800,
        ),
        headline3: _base.textTheme.headline3.copyWith(
            fontFamily: 'Hagrid',
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic),
        headline2: _base.textTheme.headline2.copyWith(
          fontFamily: 'Hagrid',
          fontWeight: FontWeight.w500,
        ),
        headline1: _base.textTheme.headline1.copyWith(
            fontFamily: 'Hagrid',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic),
        subtitle2: _base.textTheme.subtitle2.copyWith(
          fontFamily: 'Hagrid',
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
        subtitle1: _base.textTheme.subtitle1.copyWith(
          fontFamily: 'Hagrid',
          fontWeight: FontWeight.w300,
          fontSize: 22,
        ),
        bodyText2: _base.textTheme.bodyText2.copyWith(
          fontFamily: 'Hagrid Text',
          fontWeight: FontWeight.w300,
          fontSize: 24,
        ),
        bodyText1: _base.textTheme.bodyText1.copyWith(
          fontFamily: 'Hagrid Text',
          fontSize: 20,
        ),
        caption: _base.textTheme.caption.copyWith(
          fontFamily: 'Hagrid Text',
          fontSize: 18,
        ),
        button: _base.textTheme.button.copyWith(
          fontFamily: 'Hagrid Text',
          fontSize: 14,
        ),
        overline: _base.textTheme.overline.copyWith(
          fontFamily: 'Hagrid Text',
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
