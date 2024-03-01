import 'package:flutter/material.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/password_recovery/views/password_recovery_view.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  void _didTapForgotPassword(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PasswordRecoveryView()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _didTapForgotPassword(context);
      },
      child: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(bottom: 25),
        child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password',
              style: Styles.inlineTextStyle,
            )),
      ),
    );
  }
}
