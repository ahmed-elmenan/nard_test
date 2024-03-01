import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nard_test/core/theme/styles.dart';

class ResendCodeWidget extends StatefulWidget {
  final int durationInSeconds;

  const ResendCodeWidget({Key? key, required this.durationInSeconds})
      : super(key: key);

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  late int _remainingSeconds;
  late Timer _timer;

  @override
  void initState() {
    _remainingSeconds = widget.durationInSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _initTimer() {
    _timer.cancel();
    _remainingSeconds = widget.durationInSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

   void _updateTimer(Timer timer) {
    setState(() {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
      } else {
        _timer.cancel();
      }
    });
  }

  void _didTapSendOTP() {
    if (_remainingSeconds == 0) {
      _initTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;

    return GestureDetector(
      onTap: _didTapSendOTP,
      child: Text.rich(TextSpan(
          text: 'Resend code ',
          style: Styles.inlineTextStyle,
          children: <InlineSpan>[
            if (_remainingSeconds > 0)
              TextSpan(
                text: 'in: $minutes min $seconds sec',
                style: Styles.inlineTextStyle,
              )
          ])),
    );
  }
}
