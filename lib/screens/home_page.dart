import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { female, male }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kTitle,
          style: GoogleFonts.poppins(),
        ),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardPadding: const EdgeInsets.all(2),
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      lable: kMale,
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardPadding: const EdgeInsets.all(1),
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      lable: kFemale,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardPadding: const EdgeInsets.all(1),
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
                        12.toString(),
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
                        onChanged: (double newValue) {}),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
