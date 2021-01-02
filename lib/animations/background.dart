import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground();
  @override
  Widget build(BuildContext context) => FractionallySizedBox(
      widthFactor: 0.9,
      child: Opacity(
          opacity: 0.1,
          child: Image.asset('assets/images/header.gif', fit: BoxFit.fill, filterQuality: FilterQuality.none)));
}
