import 'package:flutter/material.dart';
import '../widgets/social_icons.dart';
import '../widgets/websites.dart';
import '../generated/l10n.dart';
import '../extensions/hover_extensions.dart';

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
          children: <Widget>[
            SizedBox(height: height * 0.05),
            Text(S.of(context).contact,
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: height * 0.05),
            Text(S.of(context).contactDesc, textAlign: TextAlign.center),
            SizedBox(height: height * 0.025),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Website('LinkedIn.com/in/'),
                Website('GitHub.com/'),
                Website('Dribbble.com/'),
                Website('Medium.com/@'),
                Website('Vimeo.com/'),
                Website('Rive.app/a/'),
              ],
            ),
            SizedBox(height: height * 0.01),
            Wrap(
              spacing: 10.0,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text(
                  S.of(context).email,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(
                    SocialIcons.mail_alt,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  onPressed: () => print('Send email'),
                ).showCursorOnHover.moveUpOnHover
              ],
            ),
            SizedBox(height: height * 0.025),
          ],
        ),
      ),
    );
  }
}
