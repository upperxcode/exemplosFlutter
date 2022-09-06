import 'package:flutter/material.dart';

enum Direction {
  horizontal,
  vertical;
}

class Separator extends StatelessWidget {
  final Direction direction;
  final double size;
  const Separator([
    this.direction = Direction.horizontal,
    this.size = 10,
  ]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: direction == Direction.horizontal ? size : 0,
      width: direction == Direction.vertical ? size : 0,
    );
  }
}
