import 'package:flutter/material.dart';
// ! TODO: Check status of ColorFiltered for Flutter Web - not implemented yet
class ColorOnHover extends StatefulWidget {
  ColorOnHover({this.child});

  final Widget child;

  @override
  _ColorOnHoverState createState() => _ColorOnHoverState();
}

class _ColorOnHoverState extends State<ColorOnHover> {
  bool _hovering = false;
  final Color _greyscale = Colors.grey;
  final Color _colored = Colors.red;

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
            _hovering ? _greyscale : _colored,
            BlendMode.saturation),
            child: widget.child),
      ),
    );
  }
}
