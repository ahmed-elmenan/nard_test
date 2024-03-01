import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nard_test/core/services/navigation_service.dart';
import 'package:nard_test/core/theme/theme_data.dart';
import 'package:nard_test/core/theme/theme_notifier.dart';
import 'package:nard_test/features/onboarding/views/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  GetIt.instance.registerLazySingleton(() => NavigationService());
  runApp(const ProviderScope(child: NardApp()));
}

class NardApp extends ConsumerWidget {
  const NardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ref.watch(isDarkMode)
          ? AppThemeData.darkTheme
          : AppThemeData.lightTheme,
      home: OnBoarding(),
    );
  }
}
