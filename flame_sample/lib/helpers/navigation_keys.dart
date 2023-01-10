import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'directions.dart';

class NavigationKeys extends StatefulWidget {
  final ValueChanged<Direction> onDirectionChanged;
  const NavigationKeys({Key? key, required this.onDirectionChanged})
      : super(key: key);

  @override
  State<NavigationKeys> createState() => _NavigationKeysState();
}

class _NavigationKeysState extends State<NavigationKeys> {
  Direction direction = Direction.none;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Column(
        children: [
          ArrowKey(
            icons: Icons.keyboard_arrow_up,
            onTapDown: (det) {
              updateDirection(Direction.up);
            },
            onTapUp: (det) {
              updateDirection(Direction.none);
            },
            onLongPressDown: () {
              updateDirection(Direction.up);
            },
            onLongPressEnd: (det) {
              updateDirection(Direction.none);
            },
          ),
          Row(
            children: [
              ArrowKey(
                icons: Icons.keyboard_arrow_left,
                onTapDown: (det) {
                  updateDirection(Direction.left);
                },
                onTapUp: (det) {
                  updateDirection(Direction.none);
                },
                onLongPressDown: () {
                  updateDirection(Direction.left);
                },
                onLongPressEnd: (det) {
                  updateDirection(Direction.none);
                },
              ),
              ArrowKey(
                icons: Icons.keyboard_arrow_right,
                onTapDown: (det) {
                  updateDirection(Direction.right);
                },
                onTapUp: (det) {
                  updateDirection(Direction.none);
                },
                onLongPressDown: () {
                  updateDirection(Direction.right);
                },
                onLongPressEnd: (det) {
                  updateDirection(Direction.none);
                },
              ),
              ArrowKey(
                icons: Icons.keyboard_arrow_down,
                onTapDown: (det) {
                  updateDirection(Direction.down);
                },
                onTapUp: (det) {
                  updateDirection(Direction.none);
                },
                onLongPressDown: () {
                  updateDirection(Direction.down);
                },
                onLongPressEnd: (det) {
                  updateDirection(Direction.none);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateDirection(Direction newDirection) {
    direction = newDirection;
    widget.onDirectionChanged(direction);
  }
}

class ArrowKey extends StatelessWidget {
  const ArrowKey({
    Key? key,
    required this.icons,
    required this.onTapDown,
    required this.onTapUp,
    required this.onLongPressDown,
    required this.onLongPressEnd,
  }) : super(key: key);
  final IconData icons;
  final Function(TapDownDetails) onTapDown;
  final Function(TapUpDetails) onTapUp;
  final Function() onLongPressDown;
  final Function(LongPressEndDetails) onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onLongPress: onLongPressDown,
      onLongPressEnd: onLongPressEnd,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0x88ffffff),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Icon(
          icons,
          size: 42,
        ),
      ),
    );
  }
}
