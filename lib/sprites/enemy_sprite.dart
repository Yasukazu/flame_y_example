import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnemySprite extends PositionComponent with Hitbox, Collidable {
  EnemySprite({
    required double length,
    Color? color,
  })  : this.length = length,
        this.color = color ?? Colors.greenAccent,
        super(
          anchor: Anchor.center,
          size: Vector2.all(length),
        ) {
    hitbox = HitboxRectangle(relation: Vector2(2.0, 2.0));
    addShape(hitbox);
  }
  late double length;
  late Color color;
  late HitboxRectangle hitbox;

  @override
  void onGameResize(Vector2 gameSize) {
    position = Vector2(
      gameSize.x / 2.0,
      gameSize.y / 5.0,
    );
    hitbox.position = position;

    clearEffects();
    addEffect(MoveEffect(
      path: [
        Vector2(-200.0, 0.0),
        Vector2(400.0, 0.0),
        Vector2(-200.0, 0.0),
      ],
      duration: 5.0,
      curve: Curves.linear,
      isInfinite: true,
      isAlternating: true,
      isRelative: true,
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, length, length),
      Paint()..color = color,
    );
  }

  /// 接触したときの処理
  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    //
  }
}
