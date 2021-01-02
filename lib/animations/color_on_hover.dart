import 'package:flutter/material.dart';
import '../themes/colors.dart';

class ColorOnHover extends StatefulWidget {
  const ColorOnHover({@required this.isExpanded, this.child});

  final Widget child;
  final bool isExpanded;

  @override
  _ColorOnHoverState createState() => _ColorOnHoverState();
}

class _ColorOnHoverState extends State<ColorOnHover> {
  bool hovering = false;

  void _mouseEnter(bool _hovering) => setState(() => hovering = _hovering);

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => _mouseEnter(true),
        onExit: (_) => _mouseEnter(false),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                (hovering || widget.isExpanded) ? MyColors.transparent : MyColors.primaryColor,
                BlendMode.saturation,
              ),
              child: widget.child),
        ),
      );
}
