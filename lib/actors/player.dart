import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_app/adventurer.dart';

enum PlayerState {
  idle,
  running,
  jumping,
  falling,
  hit,
  appearing,
  disappearing
}

class Player extends SpriteAnimationGroupComponent with HasGameRef<Adventurer>{
  String character;

  Player({
    position,
    this.character = 'Ninja Frog',
  }) : super(position: position);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;

  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    // debugMode = true;

    // startingPosition = Vector2(position.x, position.y);

    // add(RectangleHitbox(
    //   position: Vector2(hitbox.offsetX, hitbox.offsetY),
    //   size: Vector2(hitbox.width, hitbox.height),
    // ));
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation('Idle', 11);
    runningAnimation = _spriteAnimation('Run', 12);
    // jumpingAnimation = _spriteAnimation('Jump', 1);
    // fallingAnimation = _spriteAnimation('Fall', 1);
    // hitAnimation = _spriteAnimation('Hit', 7)..loop = false;
    // appearingAnimation = _specialSpriteAnimation('Appearing', 7);
    // disappearingAnimation = _specialSpriteAnimation('Desappearing', 7);

    // List of all animations
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
    //   PlayerState.jumping: jumpingAnimation,
    //   PlayerState.falling: fallingAnimation,
    //   PlayerState.hit: hitAnimation,
    //   PlayerState.appearing: appearingAnimation,
    //   PlayerState.disappearing: disappearingAnimation,
     };

    // Set current animation
    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/$character/$state (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}