import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/project_buttons.dart';
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
  static const Duration _oneSec = const Duration(seconds: 1);
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
      duration: _oneSec,
    );
    Future.delayed(
      _oneSec,
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  EntranceFader _preview(double height, double width) {
    return EntranceFader(
      offset: Offset(-width / 2.0, 0),
      delay: _oneSec,
      duration: _oneSec,
      child: Card(
        borderOnForeground: false,
        clipBehavior: Clip.hardEdge,
        elevation: 6.0,
        margin: EdgeInsets.only(top: 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(widget.pathToImage),
      ),
    );
  }

  EntranceFader _description(double width) {
    return EntranceFader(
      offset: Offset(width / 2.0, 0),
      delay: _oneSec,
      duration: _oneSec,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // SizedBox(height: 50.0),
            Text(
              widget.projectDesc,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 22.0 + ((width > 1500.0) ? width / 220.0 : 0),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 20.0,
                maxHeight: 30.0,
              ),
            ),
            ProjectButtonBar(widget.designURL, widget.appURL),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Divider(
              // indent: width / 5.0,
              // endIndent: width / 5.0,
              ),
        ),
        Text(
          widget.projectName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: 33.0 + width / 1000.0,
              ),
        ),
        if (width / 1.775 > height)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: _preview(height, width)),
              SizedBox(width: width * 0.05),
              Expanded(child: _description(width)),
            ],
          )
        else ...[
          _description(width),
          _preview(height, width),
        ],
      ],
    );
  }
}
