import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nard_test/core/theme/theme_helper.dart';

class ActionButton extends ConsumerWidget {
  final VoidCallback callback;
  final String text;
  final bool isNext;

  const ActionButton(
      {super.key,
      required this.callback,
      required this.text,
      this.isNext = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = ref.read(themeProvider).primirayColor;

    return GestureDetector(
      onTap: callback,
      child: Row(
        children: [
          if (!isNext) _actionIcon(Icons.chevron_left, iconColor),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          if (isNext) _actionIcon(Icons.chevron_right, iconColor),
        ],
      ),
    );
  }

  Widget _actionIcon(IconData icon, Color color) => Icon(
        icon,
        color: color,
      );
}
