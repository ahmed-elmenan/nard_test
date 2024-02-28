import 'package:flutter/material.dart';
import 'package:nard_test/core/commons/widgets/action_button.dart';
import 'package:nard_test/core/commons/widgets/custom_app_bar.dart';

class FormFieldsWrapper extends StatelessWidget {
  final bool isLogin;
  final List<Widget> children;
  const FormFieldsWrapper(
      {super.key, required this.children, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final divider = isLogin ? 5 : 9;

    return Scaffold(
      appBar: CustomAppBar(
        leading: ActionButton(
          callback: () => Navigator.of(context).pop(),
          text: 'Back',
          isNext: false,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: Column(children: [
                  SizedBox(height: height / divider),
                  ...children
                ]),
              ))),
    );
  }
}
