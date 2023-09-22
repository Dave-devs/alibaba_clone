// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:alibaba_clone/constants/palette.dart';

class ReusableText extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final bool obscureText;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  const ReusableText({super.key, 
    this.controller,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.keyboardType,
    this.textInputAction,
    this.style,
    required this.obscureText,
    this.maxLines,
    this.onFieldSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: (String? value) {
        if(value == null || value.isEmpty) {
          return "Enter $hintText";
        }
        return null;
      },
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style,
      obscureText: obscureText,
      autocorrect: false,
      minLines: 1,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        filled: filled,
        fillColor: fillColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: lerror)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: lprimaryContainer)
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: lerror)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.grey)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: lprimary)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: lprimary)
        ),
      ),
    );
  }
}
