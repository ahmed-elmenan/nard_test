import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nard_test/core/consts/record_consts.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/features/auth/views/login_view.dart';
import 'package:nard_test/features/auth/views/register_view.dart';

typedef Prompt = ({String action, String message});

class LoginPrompt extends StatelessWidget {
  final bool isLoginSection;
  late final Prompt prompt;

  LoginPrompt({super.key, this.isLoginSection = true}) {
    prompt = kBuildMessage(isLoginSection);
  }

  void _didTapAction(BuildContext context) {
    final view = isLoginSection ? LoginView() : RegisterView();

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: '${prompt.message} ',
        style: Styles.loginPromptTextStyle,
        children: <InlineSpan>[
          TextSpan(
            text: prompt.action,
            style: Styles.inlineTextStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _didTapAction(context),
          ),
        ]));
  }
}
