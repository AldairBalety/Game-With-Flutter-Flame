import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  final myGame = MyGame();
  runApp(GameWidget(game: myGame));
}

class MyGame extends FlameGame {
  SpriteComponent avatar = SpriteComponent();
  SpriteComponent fondo = SpriteComponent();
  @override
  Future<void> onLoad() async {
    //load game assets
    super.onLoad();
  }
}
