import 'package:flutter/material.dart';

import '../widgets/navigation/navigation_menu_list.dart';

class Header extends StatelessWidget {
  const Header(this.scrollController, [Key key]) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) =>
      (MediaQuery.of(context).size.width > 639.0)
          ? NavigationMenu(scrollController, columnNotRow: false)
          : Container();
}
