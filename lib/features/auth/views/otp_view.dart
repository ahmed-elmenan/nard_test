import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/commons/widgets/custom_button.dart';
import 'package:nard_test/core/commons/widgets/title_widget.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/core/theme/theme_notifier.dart';
import 'package:nard_test/features/auth/widgets/count_down_timer.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';

class OTPView extends ConsumerWidget {
  final String title;
  final VoidCallback callback;

  OTPView({super.key, required this.title, required this.callback});

  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormFieldsWrapper(
      children: [
        TitlesWidget(
          title: title,
          subTitle:
              'Enter 4-digit verification code send to your mobile number',
        ),
        _buildOTPFields(ref),
        _buildResendCode(),
        CustomButton(onPressed: callback, text: 'Verify'),
      ],
    );
  }

  Widget _buildOTPFields(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) => _itemField(index, ref)),
      ),
    );
  }

  Widget _itemField(int index, WidgetRef ref) {
    final theme = ref.read(themeProvider);

    return Flexible(
      child: Container(
        width: 90,
        padding: const EdgeInsets.only(right: 10),
        child: TextFormField(
            controller: otpControllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            autocorrect: false,
            textAlign: TextAlign.center,
            style: TextStyle(color: theme.textColor, fontSize: 25),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              fillColor: theme.textFieldPrimaryColor,
              filled: true,
              counterText: "",
              isDense: true,
              focusedBorder: Styles.focusedTextFieldBorderStyle,
              enabledBorder: Styles.textFieldBorderStyle.copyWith(
                borderSide: BorderSide(color: theme.borderColor, width: 1.0),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              labelStyle: const TextStyle(color: Colors.green),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                focusNodes[index + 1].requestFocus();
              }
            }),
      ),
    );
  }

  Widget _buildResendCode() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
          onTap: () {}, child: const ResendCodeWidget(durationInSeconds: 240)),
    );
  }
}
