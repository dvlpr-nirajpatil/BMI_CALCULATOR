import 'package:bmiapp/consts/color_pallate.dart';
import 'package:bmiapp/views/HomeScreen/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Expanded genderCard(
    {IconData? icon,
    String? title,
    Function? onTap,
    Color? color,
    Color? textColor}) {
  return reusableCard(
    onCardTap: () {
      if (onTap != null) {
        onTap();
      }
    },
    color: color,
    borderRadius: 10,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.male,
          size: 100,
          color: textColor ?? Colors.white,
        ),
        10.heightBox,
        "${title ?? "MALE"} "
            .text
            .size(22)
            .fontFamily(semiBold)
            .color(textColor ?? Colors.white)
            .make()
      ],
    ),
  );
}
