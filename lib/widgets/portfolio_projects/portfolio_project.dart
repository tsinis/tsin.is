import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../animations/background.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import 'project_buttons.dart';

class Project extends StatefulWidget {
  const Project({Key key, this.projectName, this.projectDesc, this.pathToImage, this.designURL, this.appURL})
      : super(key: key);

  final String projectName, projectDesc, pathToImage, designURL, appURL;

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> with SingleTickerProviderStateMixin {
  // double get _height => MediaQuery.of(context).size.height;
  double get _width => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: (_width > 1023) ? _width / 3 : _width,
        child: Card(
          color: Theme.of(context).dividerColor,
          borderOnForeground: false,
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          margin: const EdgeInsets.only(top: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                borderOnForeground: false,
                clipBehavior: Clip.hardEdge,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.zero)),
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
                              child: Text(
                                S.of(context).devAndDesigner,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 60, color: Theme.of(context).accentColor),
                              ),
                            ),
                          )
                        ],
                      ).zoomInOnHover,
              ),
              ExpandablePanel(
                theme: const ExpandableThemeData(
                    iconColor: Colors.black26,
                    iconPadding: EdgeInsets.symmetric(horizontal: 15),
                    iconSize: 18,
                    fadeCurve: Curves.fastOutSlowIn,
                    sizeCurve: Curves.easeInToLinear,
                    expandIcon: MyIcon.caret_down,
                    collapseIcon: MyIcon.caret_up,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                    useInkWell: false),
                header: SizedBox(
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 35),
                        Text(widget.projectName, textAlign: TextAlign.center, softWrap: true),
                      ],
                    ),
                  ),
                ).showCursorOnHover,
                expanded: Column(
                  children: [
                    const SizedBox(height: 10),
                    FractionallySizedBox(
                      widthFactor: 0.85,
                      child: AutoSizeText(widget.projectDesc,
                          textAlign: TextAlign.justify, maxLines: 8, maxFontSize: 20, softWrap: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ProjectButtonBar(widget.designURL, widget.appURL, isWide: _width > 399),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      );
}
