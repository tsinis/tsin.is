import 'package:flutter/material.dart';

class ColorOnHover extends StatefulWidget {
  const ColorOnHover({this.child});

  final Widget child;

  @override
  _ColorOnHoverState createState() => _ColorOnHoverState();
}

class _ColorOnHoverState extends State<ColorOnHover> {
  bool _hovering = false;

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => _mouseEnter(true),
        onExit: (_) => _mouseEnter(false),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  _hovering ? Colors.transparent : Theme.of(context).primaryColor, BlendMode.saturation),
              child: widget.child),
        ),
      );
}
