import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/theme/theme_notifier.dart';

class ThemeSwither extends ConsumerWidget {
  const ThemeSwither({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: DarlightButton(
        type: Darlights.DarlightFour,
        onChange: (ThemeMode theme) {
          ref.read(themeProvider).switchThemeMode();
        },
      ),
    );
  }
}
