import 'package:flutter/material.dart';

class ZoomOnHover extends StatefulWidget {
  ZoomOnHover({this.child});

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<ZoomOnHover>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

  }
  // double get height => MediaQuery.of(context).size.height;

  final _hoverTransform = Matrix4.identity()..scale(1.1, 1.1);
  final _nonHoverTransform = Matrix4.identity();


  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform(
          alignment: Alignment.center,
          child: widget.child,
          transform: _hovering ? _hoverTransform : _nonHoverTransform,
        ),
      ),
    );
  }
}
