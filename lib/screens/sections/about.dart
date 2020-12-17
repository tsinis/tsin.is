import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../services/orientation_detector.dart';
import '../../themes/fonts.dart';
import '../../widgets/avatar.dart';
import '../../widgets/cv_buttons.dart';

class About extends StatelessWidget {
  const About();

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 1023.9;
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: OrientationSwitcher(
        rowIfWide: isWide,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(S.of(context).fullName, maxLines: 1, style: MyTextStyles.headline4),
                const SizedBox(height: 15),
                AutoSizeText(S.of(context).iAm,
                    maxLines: isWide ? 8 : 16,
                    strutStyle: const StrutStyle(height: 1.25),
                    style: MyTextStyles.bodyText1),
                // const SizedBox(width: 10, height: 10),
                const CVButtons(),
                // const SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.shortestSide * 0.6,
              height: MediaQuery.of(context).size.shortestSide * 0.6,
              child: const Avatar())
        ],
      ),
    );
  }
}
