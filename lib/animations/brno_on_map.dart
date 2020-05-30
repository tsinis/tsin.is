import 'dart:math';

import 'package:flutter/material.dart';

class _PulseAnimation extends CustomPainter {
  final Animation<double> _animation;

  _PulseAnimation(this._animation) : super(repaint: _animation);

  void circle(Canvas _canvas, Rect _rect, double _value) {
    double _opacity = (1.0 - (_value / 3)).clamp(0.0, 1.0).toDouble();
    Color color = Color.fromRGBO(120, 120, 120, _opacity);

    double _size = _rect.width / 20;
    double area = _size * _size;
    double _radius = sqrt(area * _value * 4);

    final Paint _paint = Paint()..color = color;
    _canvas.drawCircle(_rect.center, _radius, _paint);
  }

  @override
  void paint(Canvas _canvas, Size _size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, _size.width, _size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(_canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(_PulseAnimation oldDelegate) => true;
}

class Brno extends StatefulWidget {
  const Brno([Key key]) : super(key: key);
  @override
  _BrnoState createState() => _BrnoState();
}

class _BrnoState extends State<Brno> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(period: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
      painter: _PulseAnimation(_controller),
      child: const SizedBox(width: 4.0, height: 4.0));
}
