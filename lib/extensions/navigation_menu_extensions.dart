import 'package:flutter/material.dart';

enum Menu { about, portfolio, contacts }

extension MenuExtension on Menu {
  void scrollTo(BuildContext context, ScrollController _scrollController) {
    _scrollController.animateTo(_getValue(context, _scrollController),
        duration: const Duration(seconds: 2), curve: Curves.easeInOut);
    Scaffold.of(context).openDrawer();
  }

  double _getValue(BuildContext context, ScrollController scrollController) {
    final bool _isSmartPhone = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    switch (this) {
      case Menu.contacts:
        return scrollController.position.maxScrollExtent - (_isSmartPhone ? 240 : 130);
      case Menu.portfolio:
        return scrollController.position.extentInside +
            310000 / MediaQuery.of(context).size.height +
            MediaQuery.of(context).size.shortestSide / (_isSmartPhone ? 1.2 : 3);
      default:
        return MediaQuery.of(context).size.height;
    }
  }
}
