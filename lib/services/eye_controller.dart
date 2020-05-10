import 'dart:ui';

import 'package:flutter/material.dart' show ValueNotifier;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart' show Mat2D;
import 'package:flare_dart/math/vec2d.dart' show Vec2D;

class EyesController implements FlareController {
  ActorNode _eyesControl;
  Offset _pointer;
  Mat2D _viewTransform;

  @override
  ValueNotifier<bool> isActive;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (_eyesControl == null || _pointer == null || _viewTransform == null) {
      return true;
    }

    Mat2D inverseViewTransform = Mat2D();
    if (!Mat2D.invert(inverseViewTransform, _viewTransform)) {
      return true;
    }

    Vec2D worldTouch = Vec2D();
    Vec2D.transformMat2D(worldTouch, Vec2D.fromValues(_pointer.dx, _pointer.dy),
        inverseViewTransform);

    Mat2D inverseTargetWorld = Mat2D();
    if (!Mat2D.invert(inverseTargetWorld, _eyesControl.parent.worldTransform)) {
      return true;
    }

    Vec2D localTouchCoordinates = Vec2D();
    Vec2D.transformMat2D(localTouchCoordinates, worldTouch, inverseTargetWorld);

    _eyesControl.translation = localTouchCoordinates;
    return true;
  }

  @override
  void initialize(FlutterActorArtboard _artboard) =>
      _eyesControl = _artboard.getNode('eye_control');

  void moveEyes(Offset _offset) => _pointer = _offset;

  void deactivate() {
    // TODO: Implement this EyeController deactivation.
  }

  @override
  void setViewTransform(Mat2D viewTransform) => _viewTransform = viewTransform;
}
