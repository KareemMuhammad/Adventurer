import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_app/actors/player.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World {
  final String levelName;
  Level({required this.levelName});

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async{
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));
    add(level);
    _spawningObjects();
    return super.onLoad();
  }

  void _spawningObjects() {
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if (spawnPointsLayer != null) {
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case 'Player':
            final player = Player(
              character: 'Ninja Frog',
              position:  Vector2(spawnPoint.x, spawnPoint.y)
            );
            add(player);
            break;
          // case 'Fruit':
          //   final fruit = Fruit(
          //     fruit: spawnPoint.name,
          //     position: Vector2(spawnPoint.x, spawnPoint.y),
          //     size: Vector2(spawnPoint.width, spawnPoint.height),
          //   );
          //   add(fruit);
          //   break;
          // case 'Saw':
          //   final isVertical = spawnPoint.properties.getValue('isVertical');
          //   final offNeg = spawnPoint.properties.getValue('offNeg');
          //   final offPos = spawnPoint.properties.getValue('offPos');
          //   final saw = Saw(
          //     isVertical: isVertical,
          //     offNeg: offNeg,
          //     offPos: offPos,
          //     position: Vector2(spawnPoint.x, spawnPoint.y),
          //     size: Vector2(spawnPoint.width, spawnPoint.height),
          //   );
          //   add(saw);
          //   break;
          // case 'Checkpoint':
          //   final checkpoint = Checkpoint(
          //     position: Vector2(spawnPoint.x, spawnPoint.y),
          //     size: Vector2(spawnPoint.width, spawnPoint.height),
          //   );
          //   add(checkpoint);
          //   break;
          // case 'Chicken':
          //   final offNeg = spawnPoint.properties.getValue('offNeg');
          //   final offPos = spawnPoint.properties.getValue('offPos');
          //   final chicken = Chicken(
          //     position: Vector2(spawnPoint.x, spawnPoint.y),
          //     size: Vector2(spawnPoint.width, spawnPoint.height),
          //     offNeg: offNeg,
          //     offPos: offPos,
          //   );
          //   add(chicken);
          //   break;
          default:
        }
      }
    }
  }

}