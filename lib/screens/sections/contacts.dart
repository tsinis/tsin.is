import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../animations/brno_on_map.dart';
import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';
import '../../widgets/map_of_europe.dart';
import '../../widgets/websites.dart';

class Contact extends StatelessWidget {
  const Contact();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // MapProvider.controller.tileSize = 256 / MediaQuery.of(context).devicePixelRatio;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: max(width, 400),
          height: max(height / ((width > height) ? 1.6 : 1.2), (width > height) ? 500 : 1200),
          child: const MapOfEurope(),
        ),
        const Brno(),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: height * 0.05),
              AutoSizeText(S.of(context).contacts, maxLines: 1, style: MyTextStyles.headline4),
              SizedBox(height: height * 0.05),
              AutoSizeText(S.of(context).contactsDesc,
                  textAlign: TextAlign.center,
                  maxLines: 6,
                  style:
                      MyTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w400, color: MyColors.contrastColorLight)),
              SizedBox(height: height * 0.03),
              const Websites(),
              SizedBox(height: height * 0.02),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  AutoSizeText(S.of(context).email,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: MyTextStyles.bodyText2
                          .copyWith(fontWeight: FontWeight.w400, color: MyColors.contrastColorLight)),
                  Tooltip(
                    preferBelow: false,
                    message: Open.fullEmailName,
                    textStyle: MyTextStyles.caption,
                    child: const IconButton(
                            onPressed: Open.mail, icon: Icon(MyIcon.mail_alt, color: MyColors.contrastColorLight))
                        .moveUpOnHover,
                  )
                ],
              ),
              SizedBox(height: height * 0.025),
            ],
          ),
        )
      ],
    );
  }
}
