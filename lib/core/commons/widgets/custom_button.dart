import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/theme/theme_helper.dart';

class CustomButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeProvider);
    final _ = ref.watch(isDarkMode);

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: CupertinoButton(
        onPressed: onPressed,
        color: theme.primirayColor,
        child: Text(
          text,
          style: TextStyle(
            color: theme.buttonLabelColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
