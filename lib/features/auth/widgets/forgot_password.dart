import 'package:flutter/material.dart';
import 'package:nard_test/core/theme/styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password',
            style: Styles.inlineTextStyle,
          )),
    );
  }
}
