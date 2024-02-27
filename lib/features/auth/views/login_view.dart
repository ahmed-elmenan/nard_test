import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/forgot_password.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';
import 'package:nard_test/features/auth/widgets/login_prompt.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldsWrapper(children: [
      Text('Login', style: Styles.headerTextStyle),
      const CustomTextField(label: 'Mobile number', textHint: 'Your Full name'),
      const CustomTextField(label: 'Password', textHint: 'Password'),
      const ForgotPassword(),
      CustomButton(onPressed: () {}, text: 'Login'),
      LoginPrompt(),
    ]);
  }
}
