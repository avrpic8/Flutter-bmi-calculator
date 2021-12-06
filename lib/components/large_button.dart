import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String textButton;
  final Function() onPress;

  const LargeButton({Key? key, required this.textButton, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kCustomizedGreen,
        ),
        child: Center(
          child: Text(
            textButton,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
