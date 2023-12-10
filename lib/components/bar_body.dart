import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/body_component.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
import 'package:forge2d/src/dynamics/body.dart';
import 'package:pong05/components/ball_body.dart';

class BarBody extends BodyComponent with KeyboardHandler, ContactCallbacks {
  Vector2 position;
  final Vector2 size;

  // inclinar/tilt
  int _tiltRightControl = 0;
  int _tiltRightBar = 0;

  final bool playerOne;
  final bool tildInvert;

  // moving
  final double speedBar = 50;
  double limit = 0;
  double move = 0;

  BarBody(this.position, {Vector2? size, bool? playerOne, bool? tildInvert})
      : size = size ?? Vector2(8, 1),
        playerOne = playerOne ?? true,
        tildInvert = tildInvert ?? false;

  @override
  Future<void> onLoad() {
    limit = game.camera.visibleWorldRect.bottomRight.toVector2().x;

    return super.onLoad();
  }

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBoxXY(size.x, size.y);
    final bodyDef =
        BodyDef(position: position, type: BodyType.kinematic, userData: this);
    final fixtureDef =
        FixtureDef(shape, friction: 1, density: 5, restitution: 1);

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void update(double dt) {
    body.setTransform(
        Vector2((body.position.x + move * dt * speedBar).clamp(-limit, limit),
            body.position.y),
        _tiltRightBar.toDouble() * .1 * (tildInvert ? -1 : 1));

    // if (tildInvert) {
    //   body.setTransform(
    //       Vector2((body.position.x + move * dt * speedBar).clamp(-limit, limit),
    //           body.position.y),
    //       _tiltRightBar.toDouble() * .1 * -1);
    // } else {
    //   body.setTransform(
    //       Vector2((body.position.x + move * dt * speedBar).clamp(-limit, limit),
    //           body.position.y),
    //       _tiltRightBar.toDouble() * .1);
    // }

    if (_tiltRightControl != _tiltRightBar) {
      _tiltRightBar = _tiltRightControl;
      body.setTransform(
          body.position, _tiltRightBar.toDouble() * .1 * (tildInvert ? -1 : 1));
      // if (tildInvert) {
      //   body.setTransform(body.position, _tiltRightBar.toDouble() * .1 * -1);
      // } else {
      //   body.setTransform(body.position, _tiltRightBar.toDouble() * .1);
      // }
    }

    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // no move
    if (keysPressed.isEmpty) {
      move = 0;
    }

    if (playerOne) {
      // move right
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
          keysPressed.contains(LogicalKeyboardKey.keyD)) {
        move = 1;
      } else
      // move left
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
          keysPressed.contains(LogicalKeyboardKey.keyA)) {
        move = -1;
      }
    } else {
      // move right
      if (keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
          keysPressed.contains(LogicalKeyboardKey.keyW)) {
        move = 1;
      } else
      // move left
      if (keysPressed.contains(LogicalKeyboardKey.arrowDown) ||
          keysPressed.contains(LogicalKeyboardKey.keyS)) {
        move = -1;
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is BallBody) {
      if (other.body.position.x - body.position.x < 0) {
        _tiltRightControl = -1;
      } else {
        _tiltRightControl = 1;
      }
    }

    super.beginContact(other, contact);
  }
}
