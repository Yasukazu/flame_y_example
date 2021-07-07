import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame_example/sprites/enemy_sprite.dart';
import 'package:flame_example/sprites/player_sprite.dart';
import 'package:flutter/material.dart';

void main() => runApp(GameWidget(game: MainGame()));

class MainGame extends BaseGame
    with
        TapDetector,
        HasCollidables,
        VerticalDragDetector,
        HorizontalDragDetector {
  late PlayerSprite player;
  late EnemySprite enemy;

  /// ロード処理
  @override
  Future<void> onLoad() async {
    // 敵の初期化
    enemy = EnemySprite(length: 100.0);
    add(enemy);

    // プレイヤーの初期化
    player = PlayerSprite(
      image: await images.load('player.png'),
      size: Vector2(100.0, 100.0),
    );
    add(player);

    // カメラがプレイヤーを追従する
    camera.followComponent(player);
  }

  /// 垂直方向にドラッグしたときの処理
  /// tokino syori
  @override
  void onVerticalDragUpdate(DragUpdateDetails details) {
    player.position += Vector2(
      details.delta.dx,
      details.delta.dy,
    );
  }

  /// 水平方向にドラッグしたときの処理
  @override
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    player.position += Vector2(
      details.delta.dx,
      details.delta.dy,
    );
  }

  /// タップ or クリックしたときの処理
  @override
  void onTap() {
    //
  }
}
