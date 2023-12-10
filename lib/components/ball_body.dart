import 'package:flame_forge2d/body_component.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:forge2d/src/dynamics/body.dart';

class BallBody extends BodyComponent with ContactCallbacks {
  BallBody() : super() {
    renderBody = true;
  }

  @override
  Body createBody() {
    final velocity = Vector2.random() - Vector2.random() * 500;

    final shape = CircleShape()..radius = 2;
    final bodyDef = BodyDef(
        linearVelocity: velocity,
        position: Vector2(0, 0),
        type: BodyType.dynamic,
        userData: this);
    final fixtureDef =
        FixtureDef(shape, friction: 1, density: 5, restitution: 1);

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    body.linearVelocity *= 5;

    super.beginContact(other, contact);
  }
}
