import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;

  const RoundedIconButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kButtonColor,
      elevation: 0,
      child: Icon(icon),
    );
  }
}
