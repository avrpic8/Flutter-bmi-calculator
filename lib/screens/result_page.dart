import 'package:bmi_calculator/components/large_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final Color resultColor;
  final String interpretation;

  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.resultColor,
      required this.interpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kTitle),
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              kResultTitle,
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                cardColor: kActiveCardColor,
                cardPadding: const EdgeInsets.all(20),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: kResultTextStyle.copyWith(color: resultColor),
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      kNormalBMIText,
                      style: kLabelTextStyle,
                    ),
                    Text(
                      kNormalBMIFact,
                      style: kBodyTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
                onTap: () {}),
          ),
          LargeButton(
            textButton: kRecalculateButtonText.toUpperCase(),
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
