import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nard_test/core/models/text_field_validator.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/core/theme/theme_helper.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;

  final String textHint;
  final String? label;
  final bool isMandatory;
  final FieldType type;

  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.textHint,
      this.onChanged,
      this.controller,
      this.isMandatory = true,
      this.label,
      this.type = FieldType.text})
      : super(key: key);

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  late bool isObscured;
  late TextFieldValidator validator;
  late ThemeHelper theme = ref.read(themeProvider);

  @override
  void initState() {
    isObscured = true;
    validator = ref.read(textFieldValidatorProvider(widget.type));
    theme = ref.read(themeProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assetName = isObscured ? 'hide' : 'show';
    final _ = ref.watch(isDarkMode);

    return Column(
      children: [
        if (widget.label != null)
          ...WidgetHelper.buildTextFieldLabel(widget.label, widget.isMandatory),
        SizedBox(
          // height: 50,
          child: TextFormField(
              validator: validator.validateField,
              keyboardType: validator.imputType,
              obscureText: validator.isPassword ? isObscured : false,
              controller: widget.controller,
              maxLength: validator.isNumber ? 15 : null,
              autocorrect: false,
              style: TextStyle(color: theme.textColor),
              textAlign: TextAlign.left,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp(r'\s')), // Disallows empty spaces
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                fillColor: theme.textFieldPrimaryColor,
                filled: true,
                counterText: "",
                focusedBorder: Styles.focusedTextFieldBorderStyle,
                enabledBorder: Styles.textFieldBorderStyle.copyWith(
                  borderSide: BorderSide(color: theme.borderColor, width: 1.0),
                ),
                errorBorder: Styles.errorTextFieldBorderStyle,
                errorStyle: const TextStyle(color: Colors.red),
                suffixIcon: _buildSuffixIcon(assetName),
                hintStyle: Styles.hintTextStyle
                    .copyWith(color: theme.textFieldSeondaryColor),
                hintText: widget.textHint,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                labelStyle: const TextStyle(color: Colors.green),
              )),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget? _buildSuffixIcon(String assetName) => validator.isPassword
      ? IconButton(
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          icon: SvgPicture.asset('assets/images/$assetName.svg',
              colorFilter: ColorFilter.mode(
                  theme.textFieldSeondaryColor, BlendMode.srcIn),
              semanticsLabel: 'image desc' // used also to improve ASO
              ),
        )
      : null;
}
