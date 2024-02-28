import 'package:flutter/material.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';

class TitlesWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitlesWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        WidgetHelper.buildTitle(
          title: title,
          style: Styles.headerTextStyle,
          paddingValue: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 7),
          child: WidgetHelper.buildTitle(
              title: subTitle,
              style: Styles.subHeaderTextStyle,
              paddingValue: 25),
        )
      ],
    );
  }
}
