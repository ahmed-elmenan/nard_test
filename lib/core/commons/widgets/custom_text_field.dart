import 'package:flutter/material.dart';
import 'package:nard_test/core/helpers/widget_helper.dart';
import 'package:nard_test/core/theme/styles.dart';

class CustomTextField extends StatelessWidget {
  // bool isObscured = true;

  final TextEditingController? controller;

  final String textHint;
  final String? label;
  final Widget? icon;
  final bool isNumber;
  final bool isPassword;
  final bool isMandatory;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.textHint,
      this.icon,
      this.onChanged,
      this.controller,
      this.isNumber = false,
      this.isPassword = false,
      this.isMandatory = true,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          ...WidgetHelper.buildTextFieldLabel(label, isMandatory),
        SizedBox(
          height: 50,
          child: TextFormField(
              // validator: (value/) {},
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              // obscureText: isPassword ? isObscured : false,
              controller: controller,
              maxLength: isNumber ? 7 : null,
              autocorrect: false,
              style: const TextStyle(
                  // color: ColorHelper.kPrimaryColor, fontWeight: FontWeight.bold
                  ),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                // focusColor: ColorHelper.kPrimaryColor,
                // contentPadding:
                //     isNumber ? EdgeInsets.only(top: 15, left: 10) : null,
                counterText: "",
                focusedBorder: Styles.focusedTextFieldBorderStyle,
                prefixIcon: icon,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          // setState(() {
                          //   isObscured = !isObscured;
                          // });
                        },
                        icon: Icon(
                            // isObscured
                            //     ? Icons.visibility_off_outlined
                            //     :
                            Icons.visibility_outlined,
                            color: Colors.red))
                    : null,
                hintStyle: Styles.hintTextStyle,
                hintText: textHint,
                enabledBorder: Styles.textFieldBorderStyle,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                labelStyle: const TextStyle(color: Colors.green),
              ),
              onChanged: onChanged),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
