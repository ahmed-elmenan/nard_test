import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/custom_button.dart';
import 'package:nard_test/core/commons/widgets/title_widget.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/widgets/count_down_timer.dart';
import 'package:nard_test/features/auth/widgets/form_fields_wrapper.dart';

class OTPView extends StatelessWidget {
  OTPView({super.key});

  final List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void _didTapResendCode() {}

  @override
  Widget build(BuildContext context) {
    return FormFieldsWrapper(
      children: [
        const TitlesWidget(),
        _buildOTPFields(),
        _buildResendCode(),
        CustomButton(onPressed: () {}, text: 'Verify'),
      ],
    );
  }

  Widget _buildOTPFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) => _itemField(index)),
      ),
    );
  }

  Widget _itemField(int index) {
    return Flexible(
      child: Container(
        width: 90,
        padding: const EdgeInsets.only(right: 10),
        child: TextFormField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            autocorrect: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              fillColor: Colors.white,
              filled: true,
              counterText: "",
              isDense: true,
              focusedBorder: Styles.focusedTextFieldBorderStyle,
              enabledBorder: Styles.textFieldBorderStyle,
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
