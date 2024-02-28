import 'package:extended_phone_number_input/extended_phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/commons/models/text_field_notifier.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';

class PhoneNumberField extends ConsumerWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldModel = ref.read(textFieldProvider(FieldType.number));

    return Column(
      children: [
        ...WidgetHelper.buildTextFieldLabel('Mobile number', true),
        Center(
          child: Theme(
            data: ThemeData(hintColor: Colors.red),
            child: PhoneNumberInput(
              validator: textFieldModel.validateField,
              initialCountry: 'SA',
              locale: 'en',
              countryListMode: CountryListMode.dialog,
              allowPickFromContacts: false,
              border: InputBorder.none,
              hint: "(000)-000-00-00",
              hintStyle: Styles.hintTextStyle,
              enabledBorder: Styles.textFieldBorderStyle,
              focusedBorder: Styles.focusedTextFieldBorderStyle,
              errorBorder: Styles.errorTextFieldBorderStyle,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
