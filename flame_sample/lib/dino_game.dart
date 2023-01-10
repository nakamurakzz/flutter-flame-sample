import 'dart:ui';

import 'package:flame/game.dart';
import 'dino_player.dart';
import 'dino_world.dart';
import 'helpers/directions.dart';

class DinoGame extends FlameGame {
  DinoPlayer _dinoPlayer = DinoPlayer();
  DinoWorld _dinoWorld = DinoWorld();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(_dinoWorld);
    add(_dinoPlayer);
    _dinoPlayer.position = _dinoWorld.size / 2;
    camera.followComponent(_dinoPlayer,
        worldBounds: Rect.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y));
  }

  onArrowKeyChanged(Direction direction) {
    _dinoPlayer.direction = direction;
  }
}
