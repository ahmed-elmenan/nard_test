import 'package:flutter/material.dart';
import 'package:nard_test/core/theme/styles.dart';

abstract class WidgetHelper {
  static List<Widget> buildTextFieldLabel(String? label, bool isMandatory) {
    final style = Styles.labelTextStyle;

    return [
      Align(
        alignment: Alignment.centerLeft,
        child: Text.rich(
            TextSpan(text: label, style: style, children: <InlineSpan>[
          TextSpan(
            text: isMandatory ? '*' : '',
            style: style.copyWith(color: const Color(0xFFFF5D21)),
          )
        ])),
      ),
      const SizedBox(height: 10)
    ];
  }
}
