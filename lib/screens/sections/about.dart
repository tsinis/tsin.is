import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../services/orientation_detector.dart';
import '../../widgets/avatar.dart';
import '../../widgets/cv_buttons.dart';

class About extends StatelessWidget {
  const About([Key key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isWide = MediaQuery.of(context).size.width > 1023.9;
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: OrientationSwitcher(
        rowIfWide: _isWide,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(S.of(context).fullName, maxLines: 1, style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 15),
                AutoSizeText(S.of(context).iAm, maxLines: _isWide ? 8 : 16, strutStyle: const StrutStyle(height: 1.75)),
                const SizedBox(width: 10, height: 10),
                const CVButtons(),
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.shortestSide * 0.6,
              height: MediaQuery.of(context).size.shortestSide * 0.6,
              child: Avatar())
        ],
      ),
    );
  }
}
