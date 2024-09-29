import 'package:flutter/material.dart';

import '../../themes/light-colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.horizontalPadding=0,
    this.verticalPadding=5,
    this.containerBorderRadius = 5,
    this.minWidth= double.infinity,
    this.containerColor=primaryColor,
    this.textColor = Colors.white,
    this.elevation = 16,
    required this.onPressed,
    required this.child,
  });

  final double verticalPadding;
  final double horizontalPadding;
  final double containerBorderRadius;
  final Color containerColor;
  final Color textColor;
  final double elevation;
  final double minWidth;
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(containerBorderRadius)),
          color: containerColor,
        ),
        width: minWidth,
          child: Center(child: child),
      ),
    );

  }
}
