import 'package:flutter/material.dart';

class AnimatedBackground extends FractionallySizedBox {
  AnimatedBackground({
    final double widthFactor = 0.9,
    final Widget child,
  }) : super(
          child: Opacity(
            opacity: 0.05,
            child: Image.asset(
              'assets/images/header.gif',
              fit: BoxFit.fill,
            ),
          ),
        );
}
