import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/forgot_password.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';
import 'package:nard_test/features/auth/widgets/login_prompt.dart';

class LoginView extends StatelessWidget {
  final bool shouldExit;

  LoginView({super.key, this.shouldExit = false});

  final formKey = GlobalKey<FormState>();

  _didTapLogin() {
    if (formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: FormFieldsWrapper(shouldExist: shouldExit, children: [
        Text('Login', style: Styles.headerTextStyle),
        const CustomTextField(
          label: 'Mobile number',
          textHint: 'Your Full name',
          type: FieldType.number,
        ),
        const CustomTextField(label: 'Password', textHint: 'Password'),
        const ForgotPassword(),
        CustomButton(onPressed: _didTapLogin, text: 'Login'),
        LoginPrompt(),
      ]),
    );
  }
}
