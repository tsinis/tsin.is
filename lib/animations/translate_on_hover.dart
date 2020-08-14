import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  const TranslateOnHover({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  bool _hovering = false;
  final Matrix4 _hoverTransform = Matrix4.identity()..translate(0, -5, 0);
  final Matrix4 _nonHoverTransform = Matrix4.identity();

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) => MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovering ? _hoverTransform : _nonHoverTransform,
        child: widget.child,
      ),
    );
}
