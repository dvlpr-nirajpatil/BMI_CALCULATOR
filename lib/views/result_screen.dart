import 'package:bmiapp/consts/color_pallate.dart';
import 'package:bmiapp/controller/bmi_controller.dart';
import 'package:bmiapp/views/HomeScreen/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BmiController>();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: greenColor,
        elevation: 0,

        padding: EdgeInsets.all(0),
        height: context.height * 0.07,
        notchMargin: 0,
        // color: greenColor,
        child: "RE-CALCULATE"
            .text
            .size(22)
            .fontFamily(semiBold)
            .make()
            .centered()
            .box
            .color(greenColor)
            .make()
            .onTap(() {
          Get.back();
        }),
      ),
      body: Container(
        width: context.width,
        padding: EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.heightBox,
            "Your Results".text.white.size(32).fontFamily(semiBold).make(),
            10.heightBox,
            reusableCard(
              borderRadius: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  context.width.widthBox,
                  "${controller.feedback}"
                      .text
                      .white
                      .fontFamily(semiBold)
                      .size(18)
                      .make(),
                  "${controller.bmi.toStringAsFixed(1)}"
                      .text
                      .size(100)
                      .white
                      .fontFamily(semiBold)
                      .make(),
                  "Normal BMI range :".text.color(greenColor).size(18).make(),
                  "18.5 - 25 kg/m2".text.white.size(18).make(),
                  30.heightBox,
                  "${controller.review}"
                      .text
                      .white
                      .fontFamily(semiBold)
                      .align(TextAlign.center)
                      .size(18)
                      .make()
                      .box
                      .padding(EdgeInsets.symmetric(horizontal: 20))
                      .make()
                ],
              ),
            ),
            10.heightBox
          ],
        ),
      ),
    );
  }
}
