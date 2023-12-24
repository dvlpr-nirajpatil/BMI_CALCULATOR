import 'package:bmiapp/consts/color_pallate.dart';
import 'package:bmiapp/views/HomeScreen/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Expanded valueCards(
    {int? value, String? title, Function? onTapAdd, Function? onTapRemove}) {
  return reusableCard(
    borderRadius: 10,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "${title ?? "WEIGHT"}"
              .text
              .size(22)
              .fontFamily(semiBold)
              .white
              .make(),
          "${value ?? 4}".text.fontFamily(semiBold).size(60).white.make(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              roundIconButtons(onTap: onTapAdd),
              10.widthBox,
              roundIconButtons(icon: Icons.remove, onTap: onTapRemove),
            ],
          )
        ],
      ),
    ),
  );
}

Widget roundIconButtons({IconData? icon, Function? onTap}) {
  return Icon(
    icon ?? Icons.add,
    color: cardColor,
    size: 45,
  ).centered().box.roundedFull.color(greenColor).make().onTap(() {
    if (onTap != null) {
      onTap();
    }
  });
}
