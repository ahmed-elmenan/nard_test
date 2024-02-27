import 'package:flutter/material.dart';
import 'package:nard_test/core/theme/styles.dart';

class TitlesWidget extends StatelessWidget {
  const TitlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        _buildTitle(
          title: 'One final step! We need to verify your phone number',
          style: Styles.headerTextStyle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 7),
          child: _buildTitle(
              title:
                  'Enter 4-digit verification code send to your mobile number',
              style: Styles.subHeaderTextStyle),
        )
      ],
    );
  }

  Widget _buildTitle({required String title, required style}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
