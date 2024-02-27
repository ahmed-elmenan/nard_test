import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nard_test/features/onboarding/views/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const NardApp());
}

class NardApp extends StatelessWidget {
  const NardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEDF1F4),
        ),
        colorScheme: ColorScheme.fromSeed(
          background: const Color(0xFFEDF1F4),
          seedColor: Colors.white,
        ),
        fontFamily: 'Inter-Regular',
        useMaterial3: true,
      ),
      home: OnBoarding(),
    );
  }
}
