import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:pong05/components/ball_body.dart';

List<Wall> createBoundaries(Forge2DGame game, {double? strokeWidth}) {
  final visibleRect = game.camera.visibleWorldRect;
  final topLeft = visibleRect.topLeft.toVector2();
  final topRight = visibleRect.topRight.toVector2();
  final bottomRight = visibleRect.bottomRight.toVector2();
  final bottomLeft = visibleRect.bottomLeft.toVector2();

  return [
    Wall(topLeft, topRight, strokeWidth: strokeWidth, tiltInvert: true),
    Wall(topRight, bottomRight,
        strokeWidth: strokeWidth, tiltX: false, tiltInvert: true),
    Wall(bottomLeft, bottomRight, strokeWidth: strokeWidth),
    Wall(topLeft, bottomLeft, strokeWidth: strokeWidth, tiltX: false),
  ];
}

class Wall extends BodyComponent with ContactCallbacks {
  final Vector2 start;
  final Vector2 end;
  final double strokeWidth;

  // inclinar/tilt
  int _tiltRightControl = 0;
  int _tiltRightBar = 0;

  bool tiltX;
  bool tiltInvert;

  Wall(this.start, this.end,
      {double? strokeWidth, bool? tiltX, bool? tiltInvert})
      : strokeWidth = strokeWidth ?? 1,
        tiltX = tiltX ?? true,
        tiltInvert = tiltInvert ?? false;

  @override
  Body createBody() {
    final shape = EdgeShape()..set(start, end);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
      userData: this, // To be able to determine object in collision
      position: Vector2.zero(),
    );
    paint.strokeWidth = strokeWidth;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is BallBody) {
      final tilt = tiltX ? other.body.position.x : other.body.position.y;
      if (tilt < 0) {
        // left
        _tiltRightControl = -1;
      } else {
        // right
        _tiltRightControl = 1;
      }
    }

    super.beginContact(other, contact);
  }

  @override
  void update(double dt) {
    if (_tiltRightControl != _tiltRightBar) {
      _tiltRightBar = _tiltRightControl;
      if (tiltInvert) {
        body.setTransform(body.position, _tiltRightBar.toDouble() * 0.008 * -1);
      } else {
        body.setTransform(body.position, _tiltRightBar.toDouble() * 0.008);
      }
    }
    super.update(dt);
  }
}
