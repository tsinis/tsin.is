import 'package:flare_flutter/asset_provider.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../services/orientation_detector.dart';
import '../../widgets/avatar.dart';

class About extends StatelessWidget {
  const About(this._cachedAvatar, {Key key}) : super(key: key);
  final AssetProvider _cachedAvatar;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool tooTight = width < 900.0;
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Column(
        children: <Widget>[
          Text(
            S.of(context).fullName,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  fontSize:
                      30.0 + (MediaQuery.of(context).size.shortestSide / 100.0),
                ),
          ),
          SizedBox(height: height / 20),
          OrientationSwitcher(
            columnNotRow: tooTight,
            children: <Widget>[
              tooTight
                  ? Text(S.of(context).iAm)
                  : Flexible(
                      child: Text(
                        S.of(context).iAm,
                        style: TextStyle(fontSize: 15.0 + width / 100.0),
                      ),
                    ),
              // const SizedBox(width: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.shortestSide * 0.6,
                height: MediaQuery.of(context).size.shortestSide * 0.6,
                child: Avatar(_cachedAvatar),
              ),
            ],
          ),
          // SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
