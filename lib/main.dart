import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_app/adventurer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  Adventurer game = Adventurer();
  runApp(GameWidget(game: kDebugMode? Adventurer() : game));
}
