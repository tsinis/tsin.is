import 'package:flutter/material.dart';
// TODO!: Check status of ColorFiltered for Flutter Web - not implemented yet

class ColorOnHover extends StatefulWidget {
  const ColorOnHover({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _ColorOnHoverState createState() => _ColorOnHoverState();
}

class _ColorOnHoverState extends State<ColorOnHover> {
  bool _hovering = false;

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) => MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                _hovering ? Theme.of(context).primaryColor : Colors.transparent,
                BlendMode.saturation),
            child: widget.child),
      ),
    );
  }
