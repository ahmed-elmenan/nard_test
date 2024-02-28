import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/commons/widgets/title_widget.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/dialog_helper.dart';
import 'package:nard_test/features/auth/views/login_view.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  final formKey = GlobalKey<FormState>();

  void _didTapUpdatePassword(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      DialogHelper.showDialog(
          title: 'Password Updated!',
          subTitle:
              'Your password successfully updated, please sign in with new password',
          assetName: 'assets/images/lock.svg',
          label: 'Sign in',
          callback: () {
            _redirectToSignIn(context);
          });
    }
  }

  void _redirectToSignIn(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginView()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: FormFieldsWrapper(children: [
        const TitlesWidget(
          title: 'Reset your password',
          subTitle: 'Please enter your new password',
        ),
        const CustomTextField(
          textHint: 'Password',
          label: 'Password',
          type: FieldType.password,
        ),
        const CustomTextField(
          textHint: 'Password',
          label: 'Confirm password',
          type: FieldType.passwordConfirmation,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomButton(
            onPressed: () => _didTapUpdatePassword(context),
            text: 'Update password')
      ]),
    );
  }
}