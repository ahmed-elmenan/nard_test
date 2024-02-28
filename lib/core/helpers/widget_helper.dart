import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  static List<Widget> buildTitledImage({
    required String title,
    required String subTitle,
    required assetName,
  }) =>
      [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SvgPicture.asset(assetName,
              semanticsLabel: 'image desc' // used also to improve ASO
              ),
        ),
        buildTitle(
            title: title, style: Styles.headerTextStyle, paddingValue: 15),
        buildTitle(
            title: subTitle,
            style: Styles.subHeaderTextStyle,
            paddingValue: 15),
      ];

  static Widget buildTitle(
      {required String title,
      required TextStyle style,
      required double paddingValue}) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingValue),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
