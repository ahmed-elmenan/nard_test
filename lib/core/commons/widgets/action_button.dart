import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const ActionButton({super.key, required this.callback, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const Icon(
          Icons.chevron_right,
          color: Color(0xFFFF5D21),
        )
      ],
    );
  }
}
