import 'package:extended_phone_number_input/extended_phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PhoneNumberInputController(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ...WidgetHelper.buildTextFieldLabel('Mobile number', true),
          Center(
            child: Theme(
              data: ThemeData(hintColor: Colors.red),
              child: PhoneNumberInput(
                  controller: controller,
                  initialCountry: 'SA',
                  locale: 'en',
                  countryListMode: CountryListMode.dialog,
                  allowPickFromContacts: false,
                  border: InputBorder.none,
                  hint: "(000)-000-00-00",
                  hintStyle: Styles.hintTextStyle,
                  enabledBorder: Styles.textFieldBorderStyle,
                  focusedBorder: Styles.textFieldBorderStyle),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
