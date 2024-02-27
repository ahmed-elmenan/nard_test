import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle headerTextStyle =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.w700);

  static TextStyle subHeaderTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle labelTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF2A3E4E));

  static TextStyle hintTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF708DA5));

  static TextStyle loginPromptTextStyle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF2A3E4E));

  static InputBorder textFieldBorderStyle = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffF3F5EE), width: 1.0),
      borderRadius: BorderRadius.circular(10.0));

  static InputBorder focusedTextFieldBorderStyle = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFFF5D21), width: 2.0),
      borderRadius: BorderRadius.circular(10.0));

  static TextStyle inlineTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFFFF5D21),
    decoration: TextDecoration.underline,
    decorationColor: Color(0xFFFF5D21),
  );
}
