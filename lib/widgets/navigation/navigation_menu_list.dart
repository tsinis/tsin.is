import 'package:flutter/material.dart';

import '../../extensions/navigation_menu_extensions.dart';
import '../../services/orientation_detector.dart';
import '../../generated/l10n.dart';
import 'navigation_menu_items.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu(this.scrollController, [this.columnNotRow = true]);

  final bool columnNotRow;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => OrientationSwitcher(
        columnNotRow: columnNotRow,
        children: <Widget>[
          MenuItem(
            menuItem: S.of(context).about,
            onTap: () => Menu.about.scrollTo(context, scrollController),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: double.infinity, minHeight: 8.5, minWidth: 30.0),
          ),
          MenuItem(
            menuItem: S.of(context).portfolio,
            onTap: () => Menu.portfolio.scrollTo(context, scrollController),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: double.infinity, minHeight: 8.5, minWidth: 30.0),
          ),
          MenuItem(
            menuItem: S.of(context).contacts,
            onTap: () => Menu.contacts.scrollTo(context, scrollController),
          ),
        ],
      );
}
