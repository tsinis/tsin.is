import 'package:flutter/material.dart';

class AnimatedBackground extends FractionallySizedBox {
  AnimatedBackground({Key key})
      : super(
            key: key,
            widthFactor: 0.9,
            child: Opacity(opacity: 0.1, child: Image.asset('assets/images/header.gif', fit: BoxFit.fill)));
}
