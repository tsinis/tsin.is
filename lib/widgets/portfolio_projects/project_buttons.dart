import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extensions/regular_expressions.dart';
import '../../generated/l10n.dart';
import '../../generated/my_icons.dart';
import '../../services/url_click.dart';
import '../../themes/button_style.dart';
import '../../themes/colors.dart';
import '../../themes/fonts.dart';

class ProjectButtonBar extends ButtonBar {
  const ProjectButtonBar(this._designURL, this._appURL, {this.isWide = true});

  final bool isWide;

  final String _designURL, _appURL;

  bool get _openSource => _appURL.toLowerCase().contains('github');

  bool get _video => _designURL.toLowerCase().contains('vimeo');

  @override
  Widget build(BuildContext context) {
    final bool isSmartWatch = MediaQuery.of(context).size.width < 321;
    return ButtonBar(
      buttonPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      buttonMinWidth: 220,
      buttonHeight: 50,
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Tooltip(
          textStyle: MyTextStyles.caption,
          message: _designURL.short,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: _video
                ? OutlineButton(
                    shape: MyButtons.shape,
                    borderSide: const BorderSide(width: 2.4, color: Color(0xFF26C6DA)),
                    highlightedBorderColor: const Color(0xFF18FFFF),
                    hoverColor: const Color(0x1A00BBD4),
                    textColor: const Color(0xFF018C99),
                    color: const Color(0xFF00ACC1),
                    onPressed: () => Open.url(_designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (isSmartWatch)
                          const SizedBox.shrink()
                        else
                          const Icon(MyIcon.vimeo_v, color: Color(0xFF3DA6B4)),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                        AutoSizeText(
                            ((isWide ? '${S.of(context).see} ' : '') + S.of(context).inAction).capitalizeFirstLetter,
                            maxLines: 1,
                            style: MyTextStyles.button),
                      ],
                    ),
                  )
                : OutlineButton(
                    shape: MyButtons.shape,
                    borderSide: const BorderSide(width: 2.4, color: Color(0xFFFF80AB)),
                    highlightedBorderColor: const Color(0xFFF48FB1),
                    hoverColor: const Color(0x1AE91E62),
                    textColor: const Color(0xFFEC407A),
                    color: Colors.pink,
                    onPressed: () => Open.url(_designURL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (isSmartWatch)
                          const SizedBox.shrink()
                        else
                          const Icon(MyIcon.dribbble, color: Color(0xFFF06292)),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                        AutoSizeText(
                            ((isWide ? '${S.of(context).see} ' : '') + S.of(context).theDesign).capitalizeFirstLetter,
                            maxLines: 1,
                            style: MyTextStyles.button),
                      ],
                    ),
                  ),
          ),
        ),
        Tooltip(
          textStyle: MyTextStyles.caption,
          message: _appURL,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
              shape: MyButtons.shape,
              height: 52,
              color: _openSource ? MyColors.contrastColorLight : Colors.lightGreen,
              elevation: 1.5,
              hoverElevation: 2.5,
              highlightElevation: 3,
              onPressed: () => Open.url(_appURL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _openSource
                    ? <Widget>[
                        if (isSmartWatch) const SizedBox.shrink() else const Icon(MyIcon.github),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 5, maxWidth: 10)),
                        AutoSizeText(
                            ((isWide ? '${S.of(context).check} ' : '') + S.of(context).theCode).capitalizeFirstLetter,
                            maxLines: 1,
                            style: MyTextStyles.button),
                      ]
                    : <Widget>[
                        if (isSmartWatch)
                          const SizedBox.shrink()
                        else
                          const Icon(MyIcon.google_play, color: MyColors.contrastColorLight),
                        ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                        AutoSizeText(
                          isWide ? 'Google Play' : 'Play',
                          maxLines: 1,
                          style: MyTextStyles.button.copyWith(color: MyColors.contrastColorLight),
                        ),
                      ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
