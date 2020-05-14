import 'package:flutter/material.dart';

import '../../extensions/navigation_menu_extensions.dart';
import '../../generated/l10n.dart';
import '../../services/orientation_detector.dart';
import 'navigation_menu_items.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu(this._scrollController, {this.isWide = false, Key key})
      : super(key: key);

  final bool isWide;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) => OrientationSwitcher(
        rowIfWide: isWide,
        children: <Widget>[
          MenuItem(
              menuItem: S.of(context).about,
              onTap: () => Menu.about.scrollTo(context, _scrollController)),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: double.infinity, minHeight: 8.5, minWidth: 30.0),
          ),
          MenuItem(
              menuItem: S.of(context).portfolio,
              onTap: () => Menu.portfolio.scrollTo(context, _scrollController)),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: double.infinity, minHeight: 8.5, minWidth: 30.0),
          ),
          MenuItem(
              menuItem: S.of(context).contacts,
              onTap: () => Menu.contacts.scrollTo(context, _scrollController)),
        ],
      );
}
