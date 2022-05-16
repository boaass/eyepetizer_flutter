import 'package:eyepetizer/ui/widgets/direction_slide_transition.dart';
import 'package:flutter/material.dart';


class AnimationBarItem extends StatefulWidget {
  final bool isSelected;
  final Widget text;
  final Widget icon;
  final Duration duration;

  const AnimationBarItem({
    this.isSelected = false,
    required this.text,
    required this.icon,
    required this.duration,
  });

  @override
  _AnimationBarItemState createState() => _AnimationBarItemState();
}

class _AnimationBarItemState extends State<AnimationBarItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: DirectionSlideTransition(
            direction: widget.isSelected ? AxisDirection.up : AxisDirection.down,
            position: animation,
            child: child,
          )
        );
      },
      child: widget.isSelected ? widget.text : widget.icon
    );
  }
}
