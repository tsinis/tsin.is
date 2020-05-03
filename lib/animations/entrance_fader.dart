import 'package:flutter/material.dart';

class EntranceFader extends StatefulWidget {
  const EntranceFader({
    Key key,
    this.child,
    this.delay = const Duration(seconds: 1),
    this.duration = const Duration(seconds: 1),
    this.offset = const Offset(0, 32.0),
  }) : super(key: key);

  final Widget child;

  final Duration delay;

  final Duration duration;

  final Offset offset;

  @override
  _EntranceFaderState createState() => _EntranceFaderState();
}

class _EntranceFaderState extends State<EntranceFader>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<num> _dxAnimation;
  Animation<num> _dyAnimation;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation = Tween(begin: widget.offset.dx, end: 0).animate(_animationController);
    _dyAnimation = Tween(begin: widget.offset.dy, end: 0).animate(_animationController);
    Future.delayed(
      widget.delay,
      () {
        if (mounted) {
          _animationController.forward();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Opacity(
          opacity: _animationController.value,
          child: Transform.translate(
            offset: Offset(
                _dxAnimation.value.toDouble(), _dyAnimation.value.toDouble()),
            child: widget.child,
          ),
        ),
      );
}
