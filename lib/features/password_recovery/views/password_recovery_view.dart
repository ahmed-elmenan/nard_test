import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/custom_text_field.dart';
import 'package:nard_test/core/consts/controllers_consts.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/features/otp/views/otp_view.dart';
import 'package:nard_test/features/password_recovery/views/reset_password_view.dart';
import 'package:nard_test/core/commons/widgets/form_fields_wrapper.dart';

class PasswordRecoveryView extends StatelessWidget {
  PasswordRecoveryView({super.key});

  final formKey = GlobalKey<FormState>();

  void _didTapRecoverPassword(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OTPView(
                title: 'Check your phone',
                callback: () => _redirectToResetPassword(context),
              )));
    }
  }

  void _redirectToResetPassword(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ResetPasswordView()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: FormFieldsWrapper(
        children: [
          ...WidgetHelper.buildTitledImage(
              title: 'Password Recovery',
              subTitle: 'Enter your phone to recover password',
              assetName: 'assets/images/recover_password.svg'),
           CustomTextField(
            controller: resetNumberController,
              textHint: 'Mobile number', type: FieldType.number),
          const SizedBox(
            height: 8,
          ),
          CustomButton(
              onPressed: () => _didTapRecoverPassword(context),
              text: 'Recover password')
        ],
      ),
    );
  }
}
