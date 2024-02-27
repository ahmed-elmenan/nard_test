import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';
import 'package:nard_test/core/commons/widgets/phone_number_field.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/login_prompt.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldsWrapper(children: [
      Text('Sign up', style: Styles.headerTextStyle),
      const CustomTextField(label: 'Full name', textHint: 'Your Full name'),
      const PhoneNumberField(),
      const CustomTextField(label: 'Password', textHint: 'Password'),
      const CustomTextField(
          label: 'Password Confirmation', textHint: 'Password'),
      CustomButton(
        onPressed: () {},
        text: 'Sign up',
      ),
      Center(child: LoginPrompt(isLoginSection: false)),
    ]);
  }
}
