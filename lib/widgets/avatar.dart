import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/flare_actor.dart' show FlareActor;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/gestures.dart' show PointerHoverEvent;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../animations/head_controller.dart';

class Avatar extends StatefulWidget {
  const Avatar([Key key]) : super(key: key);

  static AssetProvider cache =
      AssetFlare(bundle: rootBundle, name: 'assets/images/avatar.flr');

  @override
  _AvatarState createState() => _AvatarState();

  AssetProvider get _cache => cache;

  // set cache(AssetProvider asset) => asset = _cache;
}

class _AvatarState extends State<Avatar> {
  final HeadController _headController = HeadController();

  void _pointerHover(PointerHoverEvent pointer) => _headController.move =
      (Offset(pointer.localPosition.dx, pointer.localPosition.dy));

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _headController.clicked,
        child: MouseRegion(
          onExit: (_) => _headController.notHovering(),
          onEnter: (_) => _headController.isHovering(),
          onHover: _pointerHover,
          child: FlareActor.asset(widget._cache,
              controller: _headController,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth,
              animation: 'blink'),
        ),
      );
}
