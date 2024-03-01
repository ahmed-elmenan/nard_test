import 'package:extended_phone_number_input/extended_phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/models/text_field_validator.dart';
import 'package:nard_test/core/consts/controllers_consts.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/core/theme/theme_helper.dart';

class PhoneNumberField extends ConsumerWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldModel =
        ref.read(textFieldValidatorProvider(FieldType.number));
    final theme = ref.read(themeProvider);

    return Column(
      children: [
        ...WidgetHelper.buildTextFieldLabel('Mobile number', true),
        Center(
          child: Theme(
            data: ThemeData(hintColor: Colors.red),
            child: PhoneNumberInput(
              bgColor: ref.read(themeProvider).textFieldPrimaryColor,
              validator: textFieldModel.validateField,
              initialCountry: 'SA',
              locale: 'en',
              controller: numberController,
              countryListMode: CountryListMode.dialog,
              allowPickFromContacts: false,
              border: InputBorder.none,
              textColor: theme.textColor,
              hint: "(000)-000-00-00",
              hintStyle: Styles.hintTextStyle
                  .copyWith(color: theme.textFieldSeondaryColor),
              enabledBorder: Styles.textFieldBorderStyle.copyWith(
                borderSide: BorderSide(color: theme.borderColor, width: 1.0),
              ),
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
