import 'package:flare_flutter/asset_provider.dart' show AssetProvider;
import 'package:flare_flutter/flare_actor.dart' show FlareActor;
import 'package:flare_flutter/provider/asset_flare.dart' show AssetFlare;
import 'package:flutter/gestures.dart' show PointerHoverEvent;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../services/head_controller.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key key}) : super(key: key);
  static AssetProvider cache =
      AssetFlare(bundle: rootBundle, name: 'assets/images/avatar.flr');
  AssetProvider get _cache => cache;
  // set cache(AssetProvider asset) => asset = _cache;
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final HeadController _headController = HeadController();

  void _pointerHover(PointerHoverEvent pointer) => _headController.moveEyes =
      (Offset(pointer.localPosition.dx, pointer.localPosition.dy));

  @override
  Widget build(BuildContext context) => MouseRegion(
        onExit: (_) => _headController.hovering = true,
        onEnter: (_) => _headController.hovering = false,
        onHover: _pointerHover,
        child: FlareActor.asset(widget._cache,
            controller: _headController,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
            animation: 'blink'),
      );
}
