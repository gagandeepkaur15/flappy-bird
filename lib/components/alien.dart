// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Alien extends SpriteComponent
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  final double yPosition;
  Alien({
    required this.yPosition,
  });

  Future<void> onLoad() async {
    final alien = await Flame.images.load(Assets.alien);
    size = Vector2(130, 130);
    position.y = yPosition;
    position.x = gameRef.size.x / 2;
    sprite = Sprite(alien);

    add(CircleHitbox());
  }
}
