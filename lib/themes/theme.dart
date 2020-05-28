import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData defaultTheme = _buildTheme();

  static const String _displayFont = 'Hagrid', _textFont = '$_displayFont Text';

  static ThemeData _buildTheme() {
    final ThemeData _theme = ThemeData.light();

    return _theme.copyWith(
      primaryColor: Colors.grey,
      primaryColorLight: Colors.grey[300],
      primaryColorDark: Colors.grey[800],
      accentColor: Colors.grey[700],
      backgroundColor: Colors.grey[600],
      scaffoldBackgroundColor: Colors.grey,
      hoverColor: Colors.grey.withOpacity(0.33),
      // cardColor: Colors.grey[600],
      canvasColor: Colors.grey.withOpacity(0.5),
      disabledColor: Colors.grey[900],
      dividerColor: Colors.grey[400],
      // highlightColor: Color(0x66bcbcbc),
      // splashColor: Color(0x66c8c8c8),
      // selectedRowColor: Color(0xfff5f5f5),
      // unselectedWidgetColor: Color(0x8a000000),
      textTheme: _theme.textTheme.copyWith(
        headline6: _theme.textTheme.headline6.copyWith(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w900,
        ),
        headline5: _theme.textTheme.headline5.copyWith(
            fontFamily: _displayFont,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic),
        headline4: _theme.textTheme.headline4.copyWith(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w800,
          fontSize: 40.0,
        ),
        headline3: _theme.textTheme.headline3.copyWith(
            fontFamily: _displayFont,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic),
        headline2: _theme.textTheme.headline2.copyWith(
            fontFamily: _displayFont,
            fontWeight: FontWeight.w500,
            fontSize: 30.0),
        headline1: _theme.textTheme.headline1.copyWith(
            fontFamily: _displayFont,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic),
        subtitle2: _theme.textTheme.subtitle2.copyWith(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w400,
          fontSize: 24.0,
        ),
        subtitle1: _theme.textTheme.subtitle1.copyWith(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w300,
          fontSize: 22.0,
        ),
        bodyText2: _theme.textTheme.bodyText2.copyWith(
          fontFamily: _textFont,
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
        bodyText1: _theme.textTheme.bodyText1.copyWith(
          fontFamily: _textFont,
          fontSize: 20.0,
        ),
        caption: _theme.textTheme.caption.copyWith(
          fontFamily: _textFont,
          fontSize: 18.0,
        ),
        button: _theme.textTheme.button.copyWith(
          fontFamily: _textFont,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        overline: _theme.textTheme.overline.copyWith(
          fontFamily: _textFont,
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
            color: Colors.grey[100].withOpacity(0.1),
            borderRadius: BorderRadius.circular(5.0)),
        textStyle: TextStyle(
          fontFamily: _textFont,
          fontSize: 13.0,
          color: Colors.grey[900],
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.grey[400].withOpacity(0.85),
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w300,
          fontSize: 20.0,
          color: Colors.grey[900],
        ),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
    );
  }
}
