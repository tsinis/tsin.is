import 'package:flutter/material.dart';

class ZoomOnHover extends StatefulWidget {
  const ZoomOnHover({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<ZoomOnHover>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _hovering = false;
  Animation<double> _animationCurve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationCurve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuint,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) {
    final _animation = Tween<double>(begin: 0, end: 1).animate(_animationCurve);
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget child) {
          _hovering ? _controller.forward() : _controller.reverse();
          return Transform.scale(
            scale: (_animationCurve.value * 1.15) + 1,
            child: widget.child,
          );
        },
      ),
    );
  }
}
