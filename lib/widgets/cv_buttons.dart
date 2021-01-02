import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../generated/my_icons.dart';
import '../services/url_click.dart';
import '../themes/button_style.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';

class CVButtons extends ButtonBar {
  const CVButtons();

  @override
  Widget build(BuildContext context) {
    final bool isSmartWatch = MediaQuery.of(context).size.width < 300;
    return ButtonBar(
      buttonPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      buttonMinWidth: 300,
      buttonHeight: 49,
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Tooltip(
          textStyle: MyTextStyles.caption,
          preferBelow: MediaQuery.of(context).size.width > 1439,
          message: Open.cvURL,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MaterialButton(
              colorBrightness: Brightness.dark,
              shape: MyButtons.shape,
              height: 52,
              color: MyColors.primaryColorLight,
              elevation: 2,
              hoverElevation: 4,
              highlightElevation: 6,
              onPressed: () => Open.url(Open.cvURL),
              child: Row(
                mainAxisSize: isSmartWatch ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (isSmartWatch) const SizedBox.shrink() else const Icon(MyIcon.file_pdf, color: Colors.redAccent),
                  ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                  AutoSizeText(S.of(context).cv, maxLines: 1, style: MyTextStyles.button),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Tooltip(
          textStyle: MyTextStyles.caption,
          message: 'Microsoft OneDrive',
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: OutlineButton(
              shape: MyButtons.shape,
              borderSide: const BorderSide(width: 2.6, color: MyColors.primaryColorLight),
              highlightedBorderColor: MyColors.primaryColor,
              hoverColor: MyColors.primaryColorLight.withOpacity(0.1),
              textColor: MyColors.primaryColorDark,
              color: MyColors.primaryColorLight,
              onPressed: Open.cloud,
              child: Row(
                mainAxisSize: isSmartWatch ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (isSmartWatch)
                    const SizedBox.shrink()
                  else
                    const Icon(MyIcon.docs, color: MyColors.primaryColorLight),
                  ConstrainedBox(constraints: const BoxConstraints(minWidth: 10, maxWidth: 15)),
                  AutoSizeText(S.of(context).cloud,
                      maxLines: 1, style: MyTextStyles.button.copyWith(color: MyColors.contrastColorDark)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
