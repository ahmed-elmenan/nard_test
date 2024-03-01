import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/consts/controllers_consts.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/forgot_password.dart';
import 'package:nard_test/core/commons/widgets/form_fields_wrapper.dart';
import 'package:nard_test/features/auth/widgets/login_prompt.dart';

class LoginView extends ConsumerWidget {
  final bool shouldExit;

  LoginView({super.key, this.shouldExit = false});

  final formKey = GlobalKey<FormState>();

  _didTapLogin() {
    if (formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: FormFieldsWrapper(shouldExist: shouldExit, children: [
        Text('Login', style: Styles.headerTextStyle),
        CustomTextField(
          controller: siginNumberController,
          label: 'Mobile number',
          textHint: 'Mobile number',
          type: FieldType.number,
        ),
        CustomTextField(
          controller: siginPasswordController,
          label: 'Password',
          textHint: 'Password',
          type: FieldType.password,
        ),
        const ForgotPassword(),
        CustomButton(onPressed: _didTapLogin, text: 'Login'),
        LoginPrompt(),
      ]),
    );
  }
}
