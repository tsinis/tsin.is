import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';
import '../../generated/l10n.dart';

List<Widget> navigationMenuList(BuildContext context) {
  return <Widget>[
    GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () => print('About Click'),
      child: Text(
        S.of(context).about,
      ).showCursorOnHover.moveUpOnHover,
    ),
    SizedBox(
      width: 30.0,
      height: 20.0,
    ),
    GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () => print('Portfolio Click'),
      child: Text(
        S.of(context).portfolio,
      ).showCursorOnHover.moveUpOnHover,
    ),
    SizedBox(
      width: 30.0,
      height: 20.0,
    ),
    GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () => print('Contacts Click'),
      child: Text(
        S.of(context).contacts,
      ).showCursorOnHover.moveUpOnHover,
    ),
  ];
}
