import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../animations/brno_on_map.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';
import '../../widgets/websites.dart';

class Contact extends StatelessWidget {
  const Contact([Key key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).primaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: (_width > _height) ? -_height / 1.6 : null,
            bottom: (_width > _height) ? -_height / 1.6 : -10,
            child: SizedBox(
              width: _width,
              child: FittedBox(
                alignment: (_width > _height)
                    ? Alignment.center
                    : Alignment.bottomCenter,
                fit: BoxFit.cover,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(MyIcon.map,
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.2)),
                    const Brno(),
                  ],
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: _height * 0.05),
                AutoSizeText(S.of(context).contacts,
                    maxLines: 1, style: Theme.of(context).textTheme.headline4),
                SizedBox(height: _height * 0.05),
                AutoSizeText(S.of(context).contactsDesc,
                    textAlign: TextAlign.center, maxLines: 6),
                SizedBox(height: _height * 0.03),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5.0,
                  children: <Widget>[
                    Website('LinkedIn.com/in/'),
                    Website('GitHub.com/'),
                    Website('Dribbble.com/'),
                    Website('Medium.com/@'),
                    Website('Vimeo.com/'),
                    Website('Rive.app/a/')
                  ],
                ),
                SizedBox(height: _height * 0.02),
                Wrap(
                  spacing: 10.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    AutoSizeText(S.of(context).email,
                        textAlign: TextAlign.center, maxLines: 4),
                    IconButton(
                      onPressed: Open.mail, //TODO: Add email address.
                      icon: Icon(MyIcon.mail_alt,
                          color: Theme.of(context).primaryColorLight),
                    ).showCursorOnHover.moveUpOnHover
                  ],
                ),
                SizedBox(height: _height * 0.025),
              ],
            ),
          )
        ],
      ),
    );
  }
}
