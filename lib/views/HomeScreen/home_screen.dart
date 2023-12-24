import 'package:bmiapp/consts/color_pallate.dart';
import 'package:bmiapp/controller/bmi_controller.dart';
import 'package:bmiapp/views/HomeScreen/components/gender_card.dart';
import 'package:bmiapp/views/HomeScreen/components/reusable_card.dart';
import 'package:bmiapp/views/HomeScreen/components/value_cards.dart';
import 'package:bmiapp/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BmiController());
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: greenColor,
        elevation: 0,

        padding: EdgeInsets.all(0),
        height: context.height * 0.07,
        notchMargin: 0,
        // color: greenColor,
        child: "CALCULATE"
            .text
            .size(22)
            .fontFamily(semiBold)
            .make()
            .centered()
            .box
            .color(greenColor)
            .make()
            .onTap(() {
          controller.calculateBmi();
          Get.to(() => ResultScreen(),
              duration: Duration(milliseconds: 400),
              transition: Transition.downToUp);
        }),
      ),
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: "BMI CALCULATOR".text.white.fontFamily(semiBold).make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        width: context.width,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Obx(
                    () => genderCard(
                        textColor:
                            controller.gender.value == 1 ? cardColor : null,
                        color: controller.gender.value == 1
                            ? activeCardColor
                            : cardColor,
                        onTap: () {
                          print(controller.gender.value);
                          if (controller.gender.value != 1) {
                            controller.gender(1);
                          } else {
                            controller.gender(2);
                          }
                        }),
                  ),
                  15.widthBox,
                  Obx(
                    () => genderCard(
                        textColor:
                            controller.gender.value == 0 ? cardColor : null,
                        icon: Icons.female,
                        title: "FEMALE",
                        color: controller.gender.value == 0
                            ? activeCardColor
                            : cardColor,
                        onTap: () {
                          print(controller.gender.value);
                          if (controller.gender.value != 0) {
                            controller.gender(0);
                          } else {
                            controller.gender(2);
                          }
                        }),
                  ),
                ],
              ),
            ),
            15.heightBox,
            reusableCard(
              borderRadius: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "HEIGHT".text.white.size(22).fontFamily(semiBold).make(),
                    Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "${controller.height.value.toInt()}"
                              .text
                              .size(60)
                              .fontFamily(semiBold)
                              .white
                              .make(),
                          "Cm".text.white.size(18).make()
                        ],
                      ),
                    ),
                    Obx(
                      () => Slider(
                        activeColor: greenColor,
                        min: 100,
                        max: 200,
                        value: controller.height.toDouble(),
                        onChanged: (value) {
                          controller.height(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            15.heightBox,
            Expanded(
              child: Row(
                children: [
                  Obx(
                    () => valueCards(
                        value: controller.weight.value,
                        onTapAdd: () {
                          controller.weight(controller.weight.value + 1);
                        },
                        onTapRemove: () {
                          if (controller.weight.value >= 5) {
                            controller.weight(controller.weight.value - 1);
                          }
                        }),
                  ),
                  15.widthBox,
                  Obx(
                    () => valueCards(
                        title: "AGE",
                        value: controller.age.value,
                        onTapAdd: () {
                          controller.age(controller.age.value + 1);
                        },
                        onTapRemove: () {
                          if (controller.age.value > 1) {
                            controller.age(controller.age.value - 1);
                          }
                        }),
                  ),
                ],
              ),
            ),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
