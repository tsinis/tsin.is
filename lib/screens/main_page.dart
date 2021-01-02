import 'dart:math' show max, min, pi;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../animations/background.dart';
import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';
import '../generated/my_icons.dart';
import '../services/locale/locale.dart';
import '../services/locale/locale_builder.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';
import '../widgets/circular_text.dart';
import '../widgets/language_menu.dart';
import '../widgets/navigation/scroll_progress_bar.dart';
import '../widgets/navigation/side_menu.dart';
import 'sections/about.dart';
import 'sections/contacts.dart';
import 'sections/footer.dart';
import 'sections/header.dart';
import 'sections/main_text.dart';
import 'sections/portfolio.dart';

class MyWeb extends StatelessWidget {
  const MyWeb();

  @override
  Widget build(BuildContext context) => LocaleBuilder((_) => WidgetsApp(
      localizationsDelegates: const [S.delegate, GlobalMaterialLocalizations.delegate],
      locale: Locale(language),
      supportedLocales: S.delegate.supportedLocales,
      textStyle: MyTextStyles.bodyText1,
      color: MyColors.primaryColor,
      pageRouteBuilder: <T>(_, __) => MaterialPageRoute(settings: _, builder: __),
      home: const _MyHomePage()));
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => setState(() {}));
  }

  double get height => MediaQuery.of(context).size.height;

  bool get isSmartPhone => MediaQuery.of(context).size.width < 646.5 || offset > height;

  double get offset => scrollController.hasClients ? scrollController.offset : 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MyColors.primaryColor,
        key: scaffoldKey,
        endDrawer: SideMenu(scrollController),
        body: Stack(
          children: <Widget>[
            Positioned(
                top: -0.3 * offset,
                left: 0,
                right: 0,
                height: height,
                child: const RepaintBoundary(child: AnimatedBackground())),
            Positioned(top: 0.2 * height, height: height, left: 0, right: 0, child: MainText(offset)),
            Positioned(
              top: height * 0.8 - offset,
              left: 0,
              right: 0,
              height: height * 0.2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0.8],
                      colors: [MyColors.primaryColor.withOpacity(0), MyColors.primaryColor]),
                ),
              ),
            ),
            Positioned(
              top: height * 0.95 - offset,
              left: 0,
              right: 0,
              height: height / 3,
              child: Container(height: height / 3, width: double.infinity, color: MyColors.primaryColor),
            ),
            ListView(
              cacheExtent: double.infinity,
              controller: scrollController,
              children: <Widget>[
                SizedBox(height: height),
                const ColoredBox(color: MyColors.primaryColor, child: About()),
                const Portfolio(),
                const Contact(),
                const Footer()
              ],
            ),
            Positioned(
                right: -(height / 3),
                top: height / 2,
                height: 2,
                width: height * 0.75,
                child: scrollController.hasClients
                    ? ScrollProgress(height: height, offset: offset, scrollController: scrollController)
                    : const SizedBox.shrink()),
            if (height > MediaQuery.of(context).size.width)
              const SizedBox.shrink()
            else
              Positioned(
                left: 80,
                bottom: 80,
                child: CircularText(
                  textStyle: MyTextStyles.overline
                      .copyWith(color: MyColors.contrastColorLight.withOpacity(min(offset / 1000, 0.7))),
                  startAngle: -pi / 2 + offset / 500,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(
                  opacity: max(0, 1 - offset / height),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, left: isSmartPhone ? 30 : 50),
                    child: LanguageMenu(
                        isSmartphone: isSmartPhone,
                        language: S.of(context).language,
                        tooltip: S.of(context).selectLang,
                        onSelected: (String _selectedLang) {
                          language = _selectedLang;
                          LocaleBuilder.of(context).rebuild();
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, right: isSmartPhone ? 20 : 50),
                  child: isSmartPhone
                      ? IconButton(
                          icon: const Icon(MyIcon.menu),
                          color: MyColors.accentColor,
                          onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
                        ).moveUpOnHover
                      : Opacity(opacity: max(0, 1 - offset / height), child: Header(scrollController)),
                )
              ],
            )
          ],
        ),
      );
}
