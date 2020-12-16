import 'dart:math' show pi, min;

import 'package:flutter/material.dart';

class ScrollProgress extends StatelessWidget {
  const ScrollProgress({
    @required this.height,
    @required this.offset,
    @required this.scrollController,
  });

  final double height;
  final double offset;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => Transform.rotate(
        angle: 270 * pi / 180,
        child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).accentColor.withOpacity(
                  min(offset / 1000, 1),
                ),
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            value: (scrollController.position.maxScrollExtent - scrollController.position.pixels) /
                scrollController.position.maxScrollExtent),
      );
}
