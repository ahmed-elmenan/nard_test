import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nard_test/core/commons/models/text_field_notifier.dart';
import 'package:nard_test/core/consts/text_field_enums.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';

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
  late TextFieldModel textFieldModel;

  @override
  void initState() {
    isObscured = true;
    textFieldModel = ref.read(textFieldProvider(widget.type));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assetName = isObscured ? 'hide' : 'show';

    return Column(
      children: [
        if (widget.label != null)
          ...WidgetHelper.buildTextFieldLabel(widget.label, widget.isMandatory),
        SizedBox(
          // height: 50,
          child: TextFormField(
              validator: textFieldModel.validateField,
              keyboardType: textFieldModel.imputType,
              obscureText: textFieldModel.isPassword ? isObscured : false,
              controller: widget.controller,
              maxLength: textFieldModel.isNumber ? 15 : null,
              autocorrect: false,
              textAlign: TextAlign.left,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp(r'\s')), // Disallows empty spaces
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                fillColor: Colors.white,
                filled: true,
                counterText: "",
                focusedBorder: Styles.focusedTextFieldBorderStyle,
                enabledBorder: Styles.textFieldBorderStyle,
                errorBorder: Styles.errorTextFieldBorderStyle,
                errorStyle: const TextStyle(color: Colors.red),
                suffixIcon: _buildSuffixIcon(assetName),
                hintStyle: Styles.hintTextStyle,
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

  Widget? _buildSuffixIcon(String assetName) => textFieldModel.isPassword
      ? IconButton(
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          icon: SvgPicture.asset('assets/images/$assetName.svg',
              height: 21,
              width: 27,
              semanticsLabel: 'image desc' // used also to improve ASO
              ),
        )
      : null;
}
