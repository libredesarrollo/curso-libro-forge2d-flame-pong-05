import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:pong05/components/ball_body.dart';
import 'package:pong05/components/bar_body.dart';
import 'package:pong05/utils/boundaries.dart';

class MyGame extends Forge2DGame with HasKeyboardHandlerComponents {
  MyGame() : super(gravity: Vector2.all(0));

  @override
  FutureOr<void> onLoad() {
    world.add(BallBody());

    // first player
    world.add(BarBody(
        Vector2(0, camera.visibleWorldRect.bottomRight.toVector2().y * .9)));

    // second player
    world.add(BarBody(
        Vector2(0, camera.visibleWorldRect.topRight.toVector2().y * .9),
        playerOne: false,
        tildInvert: true));

    world.addAll(createBoundaries(this));

    return super.onLoad();
  }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
