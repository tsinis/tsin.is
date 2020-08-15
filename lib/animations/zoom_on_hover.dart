import 'package:flutter/material.dart';

class ZoomOnHover extends StatefulWidget {
  const ZoomOnHover({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<ZoomOnHover> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _hovering = false;
  Animation<double> _animationCurve;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animationCurve = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutQuint, reverseCurve: Curves.easeInOutQuart);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _mouseEnter(bool hovering) => setState(() => _hovering = hovering);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(_animationCurve);
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          _hovering ? _animationController.forward() : _animationController.reverse();
          return Transform.scale(
            scale: (_animationCurve.value * 1.15) + 1,
            child: widget.child,
          );
        },
      ),
    );
  }
}
