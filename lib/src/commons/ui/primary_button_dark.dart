import 'package:molz/src/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:molz/src/utils/custom_colors.dart';

class PrimaryDarkButton extends StatelessWidget {
  const PrimaryDarkButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = option5Color,
    this.btnWidth = double.infinity,
    this.btnHeight = 50,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final color;
  // final EdgeInsets padding;
  final double btnWidth;
  final double btnHeight;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // padding: padding,
      color: color,
      minWidth: btnWidth,
      height: btnHeight,
      onPressed: press,
      child: Text(
        text,
        style: const TextStyle(color: option1Color, fontSize: 18),
      ),
    );
  }
}
