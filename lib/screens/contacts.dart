import 'package:flutter/material.dart';
import '../widgets/websites.dart';
import '../generated/l10n.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text(S.of(context).contact,
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: height * 0.05),
            Text(S.of(context).contactDesc, textAlign: TextAlign.center),
            SizedBox(height: height * 0.025),
            Wrap(
              spacing: 15.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              // runAlignment: WrapAlignment.spaceAround,
              alignment: WrapAlignment.start,
              children: <Widget>[
              Website('LinkedIn.com/in/'),
              Website('GitHub.com/'),
              Website('Rive.app/a/'),
              Website('Dribbble.com/'),
              Website('Vimeo.com/'),
              Website('Medium.com/@'),
            ]),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
