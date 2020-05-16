import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart' show ValueNotifier;

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_dart/math/mat2d.dart' show Mat2D;
import 'package:flare_dart/math/vec2d.dart' show Vec2D;

class HeadController implements FlareController {
  bool _notHovering = false, _clicked = false;
  FlareAnimationLayer _exitAnimation, _backgroundAnimation;
  ActorNode _eyesControl, _headControl;
  Offset _pointer;
  Mat2D _viewTransform;

  @override
  ValueNotifier<bool> isActive;

  @override
  bool advance(FlutterActorArtboard _artboard, double _elapsed) {
    if (_notHovering) {
      if (_exitAnimation.time < _exitAnimation.animation.duration) {
        _exitAnimation.time += _elapsed;
        _exitAnimation.apply(_artboard);
      }
      return true;
    } else {
      if (_clicked) {
        if (_backgroundAnimation.time <
            _backgroundAnimation.animation.duration) {
          _backgroundAnimation.time += _elapsed;
          _backgroundAnimation.apply(_artboard);
        } else {
          _clicked = false;
        }
      }

      if (_viewTransform == null ||
          _eyesControl == null ||
          _headControl == null ||
          _pointer == null) {
        return false;
      }

      Mat2D inverseViewTransform = Mat2D();
      if (!Mat2D.invert(inverseViewTransform, _viewTransform)) {
        return false;
      }

      Vec2D _globalPointer = Vec2D();
      Vec2D.transformMat2D(_globalPointer,
          Vec2D.fromValues(_pointer.dx, _pointer.dy), inverseViewTransform);

      Mat2D _inversePointerGlobal = Mat2D();
      if (!Mat2D.invert(
          _inversePointerGlobal, _eyesControl.parent.worldTransform)) {
        return false;
      }

      Vec2D _pointerCoordinates = Vec2D();
      Vec2D.transformMat2D(
          _pointerCoordinates, _globalPointer, _inversePointerGlobal);

      _eyesControl.translation = _headControl.translation = _pointerCoordinates;
      return true;
    }
  }

  @override
  void initialize(FlutterActorArtboard _artboard) {
    _eyesControl = _artboard.getNode('eye_control');
    _headControl = _artboard.getNode('head_control');
    _exitAnimation = FlareAnimationLayer()
      ..animation = _artboard.getAnimation('exit')
      ..mixSeconds = 1.0
      ..mix = 1.0;
    _backgroundAnimation = FlareAnimationLayer()
      ..animation = _artboard.getAnimation('background')
      ..mix = 1.0;
  }

  @override
  void setViewTransform(Mat2D viewTransform) => _viewTransform = viewTransform;

  // Offset get moveEyes => _pointer;

  set move(Offset _offset) => _pointer = _offset;

  void isHovering() {
    _exitAnimation.time = 0;
    _notHovering = false;
  }

  void notHovering() => _notHovering = true;

  void clicked() {
    _backgroundAnimation.time = 0;
    _clicked = true;
  }
}
