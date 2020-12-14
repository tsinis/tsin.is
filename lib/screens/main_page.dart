import 'dart:math' show max, min, pi;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../animations/background.dart';
import '../extensions/hover_extensions.dart';
import '../generated/l10n.dart';
import '../generated/my_icons.dart';
import '../services/locale_builder.dart';
import '../themes/theme.dart';
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
  Widget build(BuildContext context) => LocaleBuilder((context) => MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          locale: Locale(LocaleBuilder.language ?? 'en'),
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: MyTheme.defaultTheme,
          home: const MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();
  static ScrollController _scrollController;

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final double _shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SideMenu(_scrollController),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            elevation: 2,
            actions: [
              IconButton(
                icon: const Icon(MyIcon.menu),
                color: Theme.of(context).accentColor,
                onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
              )
            ],
            backgroundColor: Colors.grey.withOpacity(0.8),
            foregroundColor: Colors.grey.withOpacity(0.8),
            leading: const Icon(MyIcon.globe_europe),
            expandedHeight: MediaQuery.of(context).size.height,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(60),
              stretchModes: const [StretchMode.fadeTitle, StretchMode.zoomBackground],
              title: Align(
                alignment: const Alignment(0, 0.2),
                child: Text(
                  S.of(context).devAndDesigner,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: _shortestSide > 530 ? 40 + (_shortestSide / 100) : 40 - (_shortestSide / 50),
                      color: Theme.of(context).textTheme.headline6.color.withOpacity(0.5)),
                ),
              ),
              centerTitle: true,
              background: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.8,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const MainText(),
                    AnimatedBackground(),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: ListView(
          // cacheExtent: double.infinity,
          controller: _scrollController,
          children: const <Widget>[About(), Portfolio(), Contact(), Footer()],
        ),
      ),
    );
  }
}
