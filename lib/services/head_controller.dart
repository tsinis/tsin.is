import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart' show ValueNotifier;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart' show Mat2D;
import 'package:flare_dart/math/vec2d.dart' show Vec2D;

class HeadController implements FlareController {
  bool _exit;
  FlareAnimationLayer _exitAnimation;
  ActorNode _eyesControl, _headControl;
  Offset _pointer;
  Mat2D _viewTransform;

  @override
  ValueNotifier<bool> isActive;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (_exit) {
      _exitAnimation.time = (_exitAnimation.time + elapsed);
      _exitAnimation.apply(artboard);
      return true;
    } else {
      if (_viewTransform == null ||
          _eyesControl == null ||
          _headControl == null ||
          _pointer == null) {
        return true;
      }

      Mat2D inverseViewTransform = Mat2D();
      if (!Mat2D.invert(inverseViewTransform, _viewTransform)) {
        return true;
      }

      Vec2D worldTouch = Vec2D();
      Vec2D.transformMat2D(worldTouch,
          Vec2D.fromValues(_pointer.dx, _pointer.dy), inverseViewTransform);

      Mat2D inverseTargetWorld = Mat2D();
      if (!Mat2D.invert(
          inverseTargetWorld, _eyesControl.parent.worldTransform)) {
        return true;
      }

      Vec2D localTouchCoordinates = Vec2D();
      Vec2D.transformMat2D(
          localTouchCoordinates, worldTouch, inverseTargetWorld);

      _eyesControl.translation = localTouchCoordinates;
      _headControl.translation = localTouchCoordinates;
      return true;
    }
  }

  @override
  void initialize(FlutterActorArtboard _artboard) {
    _exit = false;
    _eyesControl = _artboard.getNode('eye_control');
    _headControl = _artboard.getNode('head_control');
    _exitAnimation = FlareAnimationLayer()
      ..animation = _artboard.getAnimation('exit')
      ..mix = 1.0;
  }

  @override
  void setViewTransform(Mat2D viewTransform) => _viewTransform = viewTransform;

  // Offset get moveEyes => _pointer;

  set moveEyes(Offset _offset) => _pointer = _offset;

  // bool get hovering => _exit;

  set hovering(bool _isHovering) {
    if (!_isHovering) {
      _exitAnimation.time = 0;
    }
    _exit = _isHovering;
  }
}
