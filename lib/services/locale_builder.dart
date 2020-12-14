import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class LocaleBuilder extends StatefulWidget {
  const LocaleBuilder(this._builder);

  static String language;

  @override
  _LocaleBuilderState createState() => _LocaleBuilderState();

  final Function(BuildContext) _builder;

  static _LocaleBuilderState of(BuildContext context) =>
      context.findAncestorStateOfType<State<LocaleBuilder>>() as _LocaleBuilderState;
}

class _LocaleBuilderState extends State<LocaleBuilder> {
  void rebuild() => S.load(Locale(LocaleBuilder.language)).whenComplete(() => setState(() {}));

  @override
  Widget build(BuildContext context) => widget._builder(context) as Widget;
}
