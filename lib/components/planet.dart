import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/planet_position.dart';

class Planet extends SpriteComponent with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  final double yPosition;
  final PlanetPosition planetPosition;

  Planet({required this.yPosition, required this.planetPosition});

  Future<void> onLoad() async {
    final planet1 = await Flame.images.load(Assets.planet1);
    final planet2 = await Flame.images.load(Assets.planet2);
    size = Vector2(140, 140);

    switch (planetPosition) {
      case PlanetPosition.top:
        position.x = gameRef.size.x / 1.2;
        position.y = yPosition;
        sprite = Sprite(planet1);
        break;
      case PlanetPosition.bottom:
        position.x = gameRef.size.x / 1;
        position.y = yPosition;
        sprite = Sprite(planet2);
        break;
    }

    add(CircleHitbox());
  }
}
