import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final void Function()? onPressed;
  final Size? minimumSize;
  final Color? backgroundColor;
  const ReusableButton({
    Key? key,
    required this.text,
    this.style,
    this.onPressed,
    this.minimumSize, this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize,
        elevation: 1.5,
        backgroundColor: backgroundColor
      ),
      child: Text(text, style: style,),
    );
  }
}
