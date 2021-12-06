import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final EdgeInsetsGeometry cardPadding;
  final Widget cardChild;
  final Function() onTap;

  const ReusableCard(
      {Key? key,
      required this.cardColor,
      required this.cardPadding,
      required this.cardChild,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: cardPadding,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
