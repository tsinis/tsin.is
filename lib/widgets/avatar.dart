import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../services/eye_controller.dart';

class Avatar extends StatefulWidget {
  const Avatar(this._cachedAvatar, {Key key}) : super(key: key);

  final AssetProvider _cachedAvatar;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final EyesController _eyesController = EyesController();

  void _pointerHover(PointerHoverEvent pointer) => _eyesController
      .moveEyes(Offset(pointer.localPosition.dx, pointer.localPosition.dy));

  void _pointerExit(PointerExitEvent pointer) => _eyesController.deactivate();

  @override
  Widget build(BuildContext context) => MouseRegion(
        onExit: _pointerExit,
        onHover: _pointerHover,
        child: FlareActor.asset(widget._cachedAvatar,
            controller: _eyesController,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.scaleDown,
            animation: 'blink'),
      );
}
