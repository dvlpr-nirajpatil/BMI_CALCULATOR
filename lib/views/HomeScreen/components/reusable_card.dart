import 'package:bmiapp/consts/color_pallate.dart';
import 'package:flutter/material.dart';

Expanded reusableCard(
    {Widget? child, double? borderRadius, Function? onCardTap, Color? color}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (onCardTap != null) {
          onCardTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: color ?? cardColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        child: child,
      ),
    ),
  );
}
