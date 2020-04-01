import 'package:flutter/material.dart';

import '../widgets/portfolio_projects/project_preview.dart';
import '../widgets/portfolio_projects/project_buttons.dart';
import '../animations/entrance_fader.dart';

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

  EntranceFader _preview(double width) => EntranceFader(
        offset: Offset(-width / 2.0, 0),
        child: ProjectPreview(widget.pathToImage),
      );

  EntranceFader _description(double width) => EntranceFader(
        offset: Offset(width / 2.0, 0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.projectDesc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 22.0 + ((width > 1500.0) ? width / 220.0 : 0),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  maxHeight: 30.0,
                ),
              ),
              ProjectButtonBar(
                widget.designURL,
                widget.appURL,
                (MediaQuery.of(context).size.width > 230.0),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: const Divider(),
        ),
        Text(
          widget.projectName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: 33.0 + width / 1000.0,
              ),
        ),
        if (width / 1.775 > height && width > 1019.0)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: _preview(width)),
              SizedBox(width: width * 0.05),
              Expanded(child: _description(width)),
            ],
          )
        else ...[
          _description(width),
          _preview(width),
        ],
      ],
    );
  }
}
