import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData defaultTheme = _buildTheme();

  static ThemeData _buildTheme() {
    final ThemeData _base = ThemeData.light();

    return _base.copyWith(
      primaryColor: Colors.grey,
      primaryColorLight: Colors.grey[400],
      primaryColorDark: Colors.grey[800],
      accentColor: Colors.grey[700],
      backgroundColor: Colors.grey[600],
      scaffoldBackgroundColor: Colors.grey,
      hoverColor: Colors.grey,
      // cardColor: Color(0xffffffff),
      // dividerColor: Color(0x1f000000),
      // highlightColor: Color(0x66bcbcbc),
      // splashColor: Color(0x66c8c8c8),
      // selectedRowColor: Color(0xfff5f5f5),
      // unselectedWidgetColor: Color(0x8a000000),
      // disabledColor: Color(0x61000000),
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
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
            color: Colors.grey[100].withOpacity(0.1),
            borderRadius: BorderRadius.circular(5.0)),
        textStyle: TextStyle(
          fontFamily: 'Hagrid',
          // fontWeight: FontWeight.w200,
          fontSize: 13,
          color: Colors.grey[900],
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.grey[400].withOpacity(0.85),
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: TextStyle(
          fontFamily: 'Hagrid',
          fontWeight: FontWeight.w300,
          fontSize: 20,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
