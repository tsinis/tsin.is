import 'package:flutter/material.dart';

class HeightContainer extends StatelessWidget {
  HeightContainer({this.child, this.heightProvided,
   this.widthProvided
   });

  final Widget child;
  @required final double heightProvided;
  @required final double widthProvided;

  @override
  Widget build(BuildContext context) =>
    heightProvided != null?  Container(child: child, height: ((heightProvided) * 0.5) - (widthProvided * 0.05)) : Container(child: child);
}
// TODO Fix layout on Ultra-Wide screens