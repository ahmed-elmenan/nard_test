import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/consts/record_consts.dart';
import 'package:nard_test/core/theme/styles.dart';
import 'package:nard_test/core/theme/theme_helper.dart';
import 'package:nard_test/features/auth/views/login_view.dart';
import 'package:nard_test/features/auth/views/register_view.dart';

typedef Prompt = ({String action, String message});

class LoginPrompt extends ConsumerWidget {
  final bool isLoginSection;
  late final Prompt prompt;

  LoginPrompt({super.key, this.isLoginSection = true}) {
    prompt = kBuildMessage(isLoginSection);
  }

  void _didTapAction(BuildContext context) {

    final view = isLoginSection ? RegisterView() : LoginView();

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(isDarkMode);

    return Text.rich(TextSpan(
        text: '${prompt.message} ',
        style: Styles.loginPromptTextStyle
            .copyWith(color: ref.read(themeProvider).textColor),
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
