import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/consts/controllers_consts.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/dialog_helper.dart';
import 'package:nard_test/core/theme/theme_notifier.dart';
import 'package:nard_test/features/auth/views/login_view.dart';
import 'package:nard_test/features/auth/views/otp_view.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';
import 'package:nard_test/core/commons/widgets/phone_number_field.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/login_prompt.dart';

class RegisterView extends ConsumerWidget {
  RegisterView({super.key});

  final formKey = GlobalKey<FormState>();

  void _didTapSignUp(WidgetRef ref) {
    if (formKey.currentState?.validate() ?? false) {
      _redirectToOTP(ref);
    }
  }

  void _redirectToOTP(WidgetRef ref) {
    final bgColor = ref.read(themeProvider).dialogBackgroundColor;
    Navigator.of(ref.context).push(MaterialPageRoute(
        builder: (context) => OTPView(
              title: 'One final step! We need to verify your phone number',
              callback: () => _showOTPAlert(context, bgColor),
            )));
  }

  void _showOTPAlert(BuildContext context, Color bgColor) {
    DialogHelper.showDialog(
        title: 'Mobile successfully verified!',
        subTitle: 'Your mobile was successfully verified',
        assetName: 'assets/images/verified.svg',
        label: 'Ok',
        bgColor: bgColor,
        callback: () {
          _redirectToSignIn(context);
        });
  }

  void _redirectToSignIn(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginView()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: FormFieldsWrapper(isLogin: false, children: [
        Text('Sign up', style: Styles.headerTextStyle),
        CustomTextField(
            controller: nameController,
            label: 'Full name',
            textHint: 'Your Full name',
            type: FieldType.name),
        const PhoneNumberField(),
        CustomTextField(
          controller: passwordController,
          label: 'Password',
          textHint: 'Password',
          type: FieldType.password,
        ),
        CustomTextField(
          controller: confirmPasswordController,
          label: 'Password Confirmation',
          textHint: 'Password',
          type: FieldType.passwordConfirmation,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomButton(
          onPressed: () {
            _didTapSignUp(ref);
          },
          text: 'Sign up',
        ),
        Center(child: LoginPrompt(isLoginSection: false)),
      ]),
    );
  }
}
