import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularText extends StatelessWidget {
  const CircularText(
      {@required this.textStyle, this.radius = 26, this.text = '· tsin.is · Roman Cinis', this.startAngle = 0});

  final int radius;
  final double startAngle;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _TextPainter(radius, text, textStyle, initialAngle: startAngle),
      );
}

class _TextPainter extends CustomPainter {
  _TextPainter(this.radius, this.text, this.textStyle, {this.initialAngle = 0});

  final double initialAngle;
  final num radius;
  final String text;
  final TextStyle textStyle;

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2 - radius);

    if (initialAngle != 0) {
      final d = 2.0 * radius * math.sin(initialAngle / 2);
      final rotationAngle = _calculateRotationAngle(0, initialAngle);
      canvas
        ..rotate(rotationAngle)
        ..translate(d, 0);
    }

    double angle = initialAngle;
    for (int i = 0; i < text.length; i++) {
      angle = _drawLetter(canvas, text[i], angle);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    _textPainter
      ..text = TextSpan(text: letter, style: textStyle.copyWith(letterSpacing: 1.5))
      ..layout(maxWidth: double.maxFinite);

    final double d = _textPainter.width;
    final double alpha = 2 * math.asin(d / (2 * radius));

    final double newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(double prevAngle, double alpha) => (alpha + prevAngle) / 2;
}
