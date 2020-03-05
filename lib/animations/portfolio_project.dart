import 'package:flutter/material.dart';

import '../widgets/social_icons.dart';
import '../animations/entrance_fader.dart';

class Project extends StatefulWidget {
  const Project({Key key, this.projectName, this.projectDesc, this.pathToImage})
      : super(key: key);

  final String projectName, projectDesc, pathToImage;

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          if (width > height)
            Row(
              children: <Widget>[
                Expanded(child: _leftSide(width)),
                SizedBox(width: width * 0.1),
                Expanded(child: _rightSide(height, width))
              ],
            )
          else ...[
            _leftSide(width),
            _rightSide(height, width),
          ],
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }

  Widget _rightSide(double height, double width) {
    return EntranceFader(
      offset: Offset(width / 2, 0),
      delay: Duration(seconds: 1),
      duration: Duration(seconds: 1),
      child: Container(
        height: height / 2,
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(widget.pathToImage),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(double width) {
    return EntranceFader(
      offset: Offset(-width / 2, 0),
      delay: Duration(seconds: 1),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.projectName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38 + width/1000,
            ),
          ),
          SizedBox(height: 32),
          Text(
            widget.projectDesc,
            style: TextStyle(fontSize: 24 + ((width>1980)? width/150 : 0)),
            textScaleFactor: 1.0,
          ),
        ],
      ),
    );
  }
}
