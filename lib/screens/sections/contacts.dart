import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../generated/social_icons.dart';
import '../../widgets/websites.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).primaryColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: height * 0.05),
            AutoSizeText(S.of(context).contacts, maxLines: 1,
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: height * 0.05),
            Text(S.of(context).contactsDesc, textAlign: TextAlign.center),
            SizedBox(height: height * 0.025),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.0,
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
                  onPressed: () => null, //TODO: Add email address.
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
