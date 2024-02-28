import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/dialog_helper.dart';
import 'package:nard_test/features/auth/views/otp_view.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';
import 'package:nard_test/core/commons/widgets/phone_number_field.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/login_prompt.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final formKey = GlobalKey<FormState>();

  void _didTapSignUp(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      _redirectToOTP(context);
    }
  }

  void _redirectToOTP(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OTPView(
              title: 'Check your phone',
              callback: _showOTPAlert,
            )));
  }

  void _showOTPAlert() {
    DialogHelper.showDialog(
        title: 'Mobile successfully verified!',
        subTitle: 'Your mobile was successfully verified',
        assetName: 'assets/images/verified.svg',
        label: 'Ok',
        callback: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: FormFieldsWrapper(isLogin: false, children: [
        Text('Sign up', style: Styles.headerTextStyle),
        const CustomTextField(
            label: 'Full name',
            textHint: 'Your Full name',
            type: FieldType.name),
        const PhoneNumberField(),
        const CustomTextField(
          label: 'Password',
          textHint: 'Password',
          type: FieldType.password,
        ),
        const CustomTextField(
          label: 'Password Confirmation',
          textHint: 'Password',
          type: FieldType.passwordConfirmation,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomButton(
          onPressed: () {
            _didTapSignUp(context);
          },
          text: 'Sign up',
        ),
        Center(child: LoginPrompt(isLoginSection: false)),
      ]),
    );
  }
}
