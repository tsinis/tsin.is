import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../animations/background.dart';
import '../../extensions/hover_extensions.dart';

class ProjectPreview extends StatelessWidget {
  ProjectPreview(this.pathToImage);

  final String pathToImage;

  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      clipBehavior: Clip.hardEdge,
      elevation: 6.0,
      margin: const EdgeInsets.only(top: 40.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: (pathToImage != 'assets/images/header.gif')
          ? Image.asset(pathToImage).zoomInOnHover
          : Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 5 / 3.4,
                  child: Container(
                      color: Theme.of(context).primaryColor,
                      child: AnimatedBackground()),
                ),
                FractionallySizedBox(
                  alignment: FractionalOffset.bottomRight,
                  widthFactor: 0.7,
                  child: FittedBox(
                    // fit: BoxFit.contain,
                    child: Text(
                      S.of(context).devAndDesigner,
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      // softWrap: true,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 60.0, color: Theme.of(context).accentColor),
                    ),
                  ),
                )
              ],
            ).zoomInOnHover,
    );
  }
}
