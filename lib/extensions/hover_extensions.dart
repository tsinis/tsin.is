// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import '../animations/color_on_hover.dart';
import '../animations/translate_on_hover.dart';
import '../animations/zoom_on_hover.dart';

extension HoverExtensions on Widget {
  static final html.Element _appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover => MouseRegion(
      onHover: (_) => _appContainer.style.cursor = 'pointer',
      onExit: (_) => _appContainer.style.cursor = 'default',
      child: this);

  Widget get moveUpOnHover => TranslateOnHover(child: this);
  Widget get zoomInOnHover => ZoomOnHover(child: this);
  Widget get colorOnHover => ColorOnHover(child: this);
}
