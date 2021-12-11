import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/large_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/screens/home_page_controller.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { female, male }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kTitle,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: themeData.colorScheme.primary,
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => ReusableCard(
                      cardColor: controller.gender.value == true
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardPadding: const EdgeInsets.all(10),
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        lable: kMale,
                      ),
                      onTap: () {
                        controller.changeGender();
                        print(controller.gender.value);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ReusableCard(
                      cardColor: controller.gender.value == false
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardPadding: const EdgeInsets.all(10),
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        lable: kFemale,
                      ),
                      onTap: () {
                        controller.changeGender();
                        //setFemaleGender();
                      },
                    ),
                  ),
                ),
              ],
            ),
            ReusableCard(
              cardColor: kActiveCardColor,
              cardPadding: const EdgeInsets.all(20),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    kHeight.toUpperCase(),
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Obx(
                        () => Text(
                          controller.height.toString(),
                          style: kNumberTextStyle,
                        ),
                      ),
                      Text(
                        kCm,
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Obx(
                    () => SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                        overlayColor: kCustomizedGreen.withAlpha(30),
                        thumbColor: kCustomizedGreen,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kLabelTextColor,
                        trackHeight: 1.0,
                      ),
                      child: Slider(
                        value: controller.height.value.toDouble(),
                        min: kSliderMinValue,
                        max: kSliderMaxValue,
                        onChanged: (double value) {
                          controller.updateHeight(value.toInt());
                          print(controller.height);
                          //updateHeight(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardPadding: const EdgeInsets.all(10),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kWeight.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Obx(
                          () => Text(
                            controller.weight.toString(),
                            style: kNumberTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  controller.decreaseWeight();
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                controller.increaseWeight();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardPadding: const EdgeInsets.all(10),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kAge.toUpperCase(),
                          style: kLabelTextStyle,
                        ),
                        Obx(
                          () => Text(
                            controller.age.toString(),
                            style: kNumberTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                controller.decreaseAge();
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                controller.increaseAge();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            LargeButton(
              textButton: kCalculateButtonText.toUpperCase(),
              onPress: () {
                CalculatorBrain claculate = CalculatorBrain(
                    height: controller.height.value,
                    weight: controller.weight.value);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        bmiResult: claculate.calculateBMI(),
                        resultText: claculate.getResult(),
                        resultColor: claculate.getResultColor(),
                        interpretation: claculate.getInterpretation()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
