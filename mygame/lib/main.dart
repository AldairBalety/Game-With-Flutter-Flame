import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  final myGame = MyGame();
  runApp(GameWidget(game: myGame));
}

class MyGame extends FlameGame {
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final DinoWorld _dinoWorld = DinoWorld();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_dinoWorld);
    await add(_dinoPlayer);
    _dinoPlayer.position = _dinoWorld.size / 1.5;
    camera.followComponent(_dinoPlayer,
        worldBounds: Rect.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y));
  }
}

class DinoPlayer extends SpriteComponent with HasGameRef {
  DinoPlayer() : super(size: Vector2.all(100.0));
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Avatar.png');
    position = gameRef.size / 2;
  }
}

class DinoWorld extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('Background.png');
    size = sprite!.originalSize;
  }
}
