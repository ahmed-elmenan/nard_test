import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/consts/regex_source_consts.dart';
import 'package:nard_test/core/consts/string_const.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';

final passwordToMatch = StateProvider.autoDispose<String>((ref) => '');

class TextFieldValidator {
  final Ref ref;
  final FieldType type;
  TextFieldValidator(this.ref, this.type);

  bool get isPassword =>
      [FieldType.password, FieldType.passwordConfirmation].contains(type);

  TextInputType get imputType =>
      isNumber ? TextInputType.number : TextInputType.text;

  bool get isNumber => type == FieldType.number;

  String get _password => ref.read(passwordToMatch);

// validator region

  String? validateField(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return kEmptyFormError;
    }

    switch (type) {
      case FieldType.name:
        return value.length < 4 ? kNameLengthError : null;
      case FieldType.number:
        return value.length < 7 ? kPhoneNumberLengthError : null;
      case FieldType.email:
        return _validateEmail(value);
      case FieldType.password:
        return _validatePassword(value);
      case FieldType.passwordConfirmation:
        return value.compareTo(_password) != 0
            ? kPasswordNotMatchedError
            : null;
      default:
    }
    return null;
  }

  String? _validatePassword(String value) {
    final digitPattern = RegExp(kDigitSource);
    final alphabetPattern = RegExp(kAlphabetSource);
    final specialCharPattern = RegExp(kSpecialCharSource);

    if (value.length < 8) {
      return kPasswordLengthError;
    } else if (!digitPattern.hasMatch(value)) {
      return kMissingNumberError;
    } else if (!alphabetPattern.hasMatch(value)) {
      return kMissingAlphabetError;
    } else if (!specialCharPattern.hasMatch(value)) {
      return kMissingSpecialCharError;
    }

    ref.read(passwordToMatch.notifier).state = value;

    return null;
  }

  String? _validateEmail(String value) {
    RegExp emailFormRegex = RegExp(kEmailFormSource);

    if (!emailFormRegex.hasMatch(value)) {
      return kInvalidEmailError;
    }

    return null;
  }

  // end region
}

final textFieldValidatorProvider =
    Provider.autoDispose.family<TextFieldValidator, FieldType>((ref, type) {
  return TextFieldValidator(ref, type);
});
