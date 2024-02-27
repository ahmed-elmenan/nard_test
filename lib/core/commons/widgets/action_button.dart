import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final bool isNext;

  const ActionButton(
      {super.key,
      required this.callback,
      required this.text,
      this.isNext = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        children: [
          if (!isNext) _actionIcon(Icons.chevron_left),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          if (isNext) _actionIcon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _actionIcon(IconData icon) => Icon(
        icon,
        color: const Color(0xFFFF5D21),
      );
}
