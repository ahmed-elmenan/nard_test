import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nard_test/core/theme/theme_notifier.dart';

class ImageBuilder extends ConsumerWidget {
  final String assetName;

  const ImageBuilder(this.assetName, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return SvgPicture.asset(assetName,
        colorFilter: isDark
            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            : null,
        semanticsLabel: 'image desc' // used also to improve ASO
        );
  }
}
