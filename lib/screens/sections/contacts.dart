import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';
import '../../animations/brno_on_map.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';
import '../../widgets/map_of_europe.dart';
import '../../widgets/websites.dart';

class Contact extends StatelessWidget {
  const Contact([Key key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    // MapOfEurope.controller.tileSize = 256 / MediaQuery.of(context).devicePixelRatio;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: max(_width, 400),
            height: max(_height / ((_width > _height) ? 1.6 : 1.2), (_width > _height) ? 500 : 1200),
            child: Map(
              controller: MapOfEurope.controller,
              provider: MapOfEurope(S.of(context).currentLocale),
            ),
          ),
          const Brno(),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: _height * 0.05),
                AutoSizeText(S.of(context).contacts, maxLines: 1, style: Theme.of(context).textTheme.headline4),
                SizedBox(height: _height * 0.05),
                AutoSizeText(S.of(context).contactsDesc, textAlign: TextAlign.center, maxLines: 6),
                SizedBox(height: _height * 0.03),
                const Websites(),
                SizedBox(height: _height * 0.02),
                Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    AutoSizeText(S.of(context).email, textAlign: TextAlign.center, maxLines: 4),
                    IconButton(
                      onPressed: Open.mail, //TODO: Add email address.
                      icon: Icon(MyIcon.mail_alt, color: Theme.of(context).primaryColorLight),
                    ).moveUpOnHover
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
