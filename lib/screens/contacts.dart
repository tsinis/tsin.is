import 'package:flutter/material.dart';
import '../widgets/social_icons.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text(S.of(context).contact,
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: height * 0.05),
            Text(S.of(context).contactDesc, textAlign: TextAlign.center),
            SizedBox(height: height * 0.025),
            Wrap(
              spacing: 30.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              // runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
              Website(SocialIcons.dribbble),
              Website(SocialIcons.linkedin_squared),
              Website(SocialIcons.github_squared),
              Website(SocialIcons.medium),
              Website(SocialIcons.cloud),
              Website(SocialIcons.vimeo_squared),
            ]),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
