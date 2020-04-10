import 'package:flutter/material.dart';
import '../animations/color_on_hover.dart';
import '../animations/zoom_on_hover.dart';
import 'dart:html' as html;

import '../animations/translate_on_hover.dart';

extension HoverExtensions on Widget {
  static final _appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // The widget we're using the extension on.
      onHover: (event) => _appContainer.style.cursor = 'pointer',
      onExit: (event) => _appContainer.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover => TranslateOnHover(child: this);
  Widget get zoomInOnHover => ZoomOnHover(child: this);
  Widget get colorOnHover => ColorOnHover(child: this);
}
