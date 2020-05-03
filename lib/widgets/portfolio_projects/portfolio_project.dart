import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../animations/background.dart';
import '../../animations/entrance_fader.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../services/height_detector.dart';
import 'project_buttons.dart';

class Project extends StatefulWidget {
  const Project(
      {Key key,
      this.projectName,
      this.projectDesc,
      this.pathToImage,
      this.designURL,
      this.appURL})
      : super(key: key);

  final String projectName, projectDesc, pathToImage, designURL, appURL;

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  EntranceFader _description(double widthProvided, [double heightProvided]) =>
      EntranceFader(
        offset: Offset(widthProvided / 2.0, 0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: HeightContainer(
            heightProvided: heightProvided,
            widthProvided: widthProvided,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
          ),
        ),
      );
  // double get height => MediaQuery.of(context).size.height;
  double get _width => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    // double _height = MediaQuery.of(context).size.height;
    // double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: (_width > 1023) ? _width / 3 : _width,
      child: Card(
        color: Colors.grey[400],
        borderOnForeground: false,
        clipBehavior: Clip.hardEdge,
        elevation: 10.0,
        margin: const EdgeInsets.only(top: 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0
              // topRight: Radius.circular(25.0)
              ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              borderOnForeground: false,
              clipBehavior: Clip.hardEdge,
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 10.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.zero,
                  // topRight: Radius.circular(25.0)
                ),
              ),
              child: (widget.pathToImage != 'assets/images/header.gif')
                  ? Image.asset(widget.pathToImage).zoomInOnHover
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: 60.0,
                                      color: Theme.of(context).accentColor),
                            ),
                          ),
                        )
                      ],
                    ).zoomInOnHover,
            ),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  useInkWell: true),
              header: SizedBox(
                height: 35.0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 35.0),
                      Text(
                        widget.projectName, // FIXME: Fix font size.
                        textAlign: TextAlign.center,
                        softWrap: true,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headline4
                        //       .copyWith(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
              expanded: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.projectDesc,
                      softWrap: true,
                    ),
                  ),
                  ProjectButtonBar(
                    widget.designURL,
                    widget.appURL,
                    tooTight: (MediaQuery.of(context).size.width > 230.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
