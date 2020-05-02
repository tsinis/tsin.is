import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class LocaleBuilder extends StatefulWidget {
  const LocaleBuilder({Key key, this.builder}) : super(key: key);

  static String language;

  @override
  LocaleBuilderState createState() => LocaleBuilderState();

  final Function(BuildContext) builder;

  static LocaleBuilderState of(BuildContext context) =>
      context.findAncestorStateOfType<State<LocaleBuilder>>()
          as LocaleBuilderState;
}

class LocaleBuilderState extends State<LocaleBuilder> {
  void rebuild() => S
      .load(Locale(LocaleBuilder.language))
      .whenComplete(() => setState(() {}));

  @override
  Widget build(BuildContext context) => widget.builder(context) as Widget;
}
