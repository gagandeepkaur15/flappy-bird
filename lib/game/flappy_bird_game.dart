import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/alien_group.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/planet_group.dart';
import 'package:flappy_bird/game/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.planetInterval, repeat: true);
  Timer alienInterval = Timer(Config.alienInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      bird = Bird(),
      PlanetGroup(),
      AlienGroup(),
    ]);

    interval.onTick = () => add(PlanetGroup());
    alienInterval.onTick = () => add(AlienGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
