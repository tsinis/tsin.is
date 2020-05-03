import 'package:flutter/material.dart';

import '../../animations/background.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';

class ProjectPreview extends StatelessWidget {
  const ProjectPreview(this.pathToImage, [Key key]) : super(key: key);

  final String pathToImage;

  @override
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
                  aspectRatio: 5 / 3,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: AnimatedBackground(),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: FractionalOffset.bottomRight,
                  widthFactor: 0.3,
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
