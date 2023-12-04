import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_app/levels/levels.dart';

class Adventurer extends FlameGame{
  late final CameraComponent cam;
  final world = Level(levelName: 'level-01');

 @override
  FutureOr<void> onLoad() async{
   // load all images to cache
   await images.loadAllImages();
   cam = CameraComponent.withFixedResolution(width: 640, height: 360,world: world);
   cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam,world]);
    return super.onLoad();
  }
}