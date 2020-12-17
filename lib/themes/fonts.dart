import 'package:flutter/widgets.dart';
import 'colors.dart';

class MyTextStyles {
  static const String _displayFont = 'Hagrid', _textFont = '$_displayFont Text';
  static const TextStyle
      // headline1 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
      // headline2 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w500, fontSize: 30),
      // headline3 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
      headline4 =
          TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w800, fontSize: 40, color: MyColors.accentColor),
      // headline5 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
      headline6 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w900, fontSize: 50),
      bodyText1 = TextStyle(fontFamily: _textFont, fontWeight: FontWeight.w200, fontSize: 24),
      bodyText2 = TextStyle(fontFamily: _textFont, fontWeight: FontWeight.w300, fontSize: 24),
      // subtitle1 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w300, fontSize: 22),
      subtitle2 = TextStyle(fontFamily: _displayFont, fontWeight: FontWeight.w400, fontSize: 24),
      button = TextStyle(fontFamily: _textFont, fontSize: 16, fontWeight: FontWeight.w400),
      caption = TextStyle(
          fontFamily: _textFont, fontSize: 14, color: MyColors.contrastColorLight, fontWeight: FontWeight.w100),
      overline = TextStyle(fontFamily: _textFont, fontSize: 10, fontWeight: FontWeight.w300);
}
