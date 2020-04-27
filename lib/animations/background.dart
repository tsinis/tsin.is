import 'package:flutter/material.dart';

class AnimatedBackground extends FractionallySizedBox {
  AnimatedBackground({
    Key key,
    final double widthFactor = 0.9,
    final Widget child,
  }) : super(
          key: key,
          child: Opacity(
            opacity: 0.05,
            child: Image.asset(
              'assets/images/header.gif',
              fit: BoxFit.fill,
            ),
          ),
        );
}
