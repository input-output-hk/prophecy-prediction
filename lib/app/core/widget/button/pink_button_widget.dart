import 'package:flutter/material.dart';
import 'package:squidgame/app/core/round_colors.dart';

class PinkButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final double? height;

  const PinkButtonWidget({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color = RoundColor.red,
    this.height = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: child,
      ),
    );
  }
}
