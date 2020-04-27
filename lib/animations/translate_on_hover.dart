import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  const TranslateOnHover({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  bool _hovering = false;
  final _hoverTransform = Matrix4.identity()..translate(0, -5.0, 0);
  final _nonHoverTransform = Matrix4.identity();

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? _hoverTransform : _nonHoverTransform,
      ),
    );
  }
}
