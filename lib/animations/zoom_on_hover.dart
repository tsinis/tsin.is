import 'package:flutter/material.dart';

class ZoomOnHover extends StatefulWidget {
  const ZoomOnHover({@required this.isExpanded, this.child});

  final Widget child;
  final bool isExpanded;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<ZoomOnHover> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animationCurve;
  bool hovering = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 1300), vsync: this);
    animationCurve =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOutQuint, reverseCurve: Curves.easeInOutQuart);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _mouseEnter(bool _hovering) => setState(() => hovering = _hovering);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = Tween<double>(begin: 0, end: 1).animate(animationCurve);
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          (hovering || widget.isExpanded) ? animationController.forward() : animationController.reverse();
          return Transform.scale(scale: (animationCurve.value * 1.15) + 1, child: widget.child);
        },
      ),
    );
  }
}
