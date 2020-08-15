import 'package:flutter/material.dart';

import '../animations/color_on_hover.dart';
import '../animations/translate_on_hover.dart';
import '../animations/zoom_on_hover.dart';

extension HoverExtensions on Widget {
  Widget get moveUpOnHover => TranslateOnHover(child: this);
  Widget get zoomInOnHover => ZoomOnHover(child: this);
  Widget get colorOnHover => ColorOnHover(child: this);
}
