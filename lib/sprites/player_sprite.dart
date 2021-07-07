import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flame_example/sprites/enemy_sprite.dart';
import 'package:flame_example/sprites/info_sprite.dart';

class PlayerSprite extends SpriteComponent with Hitbox, Collidable {
  PlayerSprite({
    required Image image,
    required Vector2 size,
  }) : super(
          sprite: Sprite(image),
          size: size,
        ) {
    hitbox = HitboxRectangle(relation: Vector2(2.0, 2.0));
    addShape(hitbox);

    info = InfoSprite()..position = Vector2(50.0, 150.0);
    addChild(info);

    anchor = Anchor.center;
  }
  late HitboxRectangle hitbox;
  late InfoSprite info;

  @override
  void onGameResize(Vector2 gameSize) {
    position = Vector2(
      gameSize.x / 2.0,
      gameSize.y / 5.0 * 5.0,
    );
    hitbox.position = position;
  }

  @override
  void update(double dt) {
    super.update(dt);
    info.text = "X: ${position.x.toInt()}\nY: ${position.y.toInt()}";
  }

  /// 接触したときの処理
  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is EnemySprite) {
      other.shouldRemove = true;
    }
  }
}
