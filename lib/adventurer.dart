import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_app/levels/levels.dart';

class Adventurer extends FlameGame{
  late final CameraComponent cam;
  final world = Level();

 @override
  FutureOr<void> onLoad() {
   cam = CameraComponent.withFixedResolution(width: 640, height: 360,world: world);
   cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam,world]);
    return super.onLoad();
  }
}