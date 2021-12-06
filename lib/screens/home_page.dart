import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/large_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { female, male }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 180;
  int weight = 75;
  int age = 20;
  Gender selectedGender = Gender.male;

  void setMaleGender() {
    setState(() {
      selectedGender = Gender.male;
    });
  }

  void setFemaleGender() {
    setState(() {
      selectedGender = Gender.female;
    });
  }

  void updateHeight(double value) {
    setState(() {
      height = value.toInt();
    });
  }

  void decreaseWeight() {
    setState(() {
      weight--;
    });
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardPadding: const EdgeInsets.all(10),
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      lable: kMale,
                    ),
                    onTap: () {
                      setMaleGender();
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardPadding: const EdgeInsets.all(10),
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      lable: kFemale,
                    ),
                    onTap: () {
                      setFemaleGender();
                    },
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
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        kCm,
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
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
                        value: height.toDouble(),
                        min: kSliderMinValue,
                        max: kSliderMaxValue,
                        onChanged: (double value) {
                          updateHeight(value);
                        }),
                  ),
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
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  decreaseWeight();
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  increaseWeight();
                                }),
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
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
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
                CalculatorBrain claculate =
                    CalculatorBrain(height: height, weight: weight);
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
