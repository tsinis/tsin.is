import 'package:flutter/material.dart';

import '../../widgets/navigation/navigation_menu_list.dart';

class Header extends StatelessWidget {
  const Header(this._scrollController);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) => (MediaQuery.of(context).size.width > 639)
      ? NavigationMenu(_scrollController, isWide: true)
      : const SizedBox.shrink();
}
