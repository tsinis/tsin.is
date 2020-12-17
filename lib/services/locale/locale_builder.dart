import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'locale.dart';

class LocaleBuilder extends StatefulWidget {
  const LocaleBuilder(this._builder);

  @override
  _LocaleBuilderState createState() => _LocaleBuilderState();

  final Widget Function(BuildContext) _builder;

  static _LocaleBuilderState of(BuildContext context) => context.findAncestorStateOfType<_LocaleBuilderState>();
}

class _LocaleBuilderState extends State<LocaleBuilder> {
  void rebuild() => S.load(Locale(language)).whenComplete(() => setState(() {}));

  @override
  Widget build(BuildContext context) => widget._builder(context);
}
