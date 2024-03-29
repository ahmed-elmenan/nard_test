import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nard_test/core/commons/widgets/action_button.dart';
import 'package:nard_test/core/commons/widgets/theme_switcher.dart';
import 'package:nard_test/core/consts/record_consts.dart';
import 'package:nard_test/core/theme/theme_helper.dart';
import 'package:nard_test/features/auth/views/register_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends ConsumerWidget {
  OnBoarding({super.key});

  final controller = PageController(initialPage: 0);

  void _didTapNext(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterView()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const ThemeSwither(),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ActionButton(
              callback: () => _didTapNext(context),
              text: 'Next',
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500,
                child: PageView.builder(
                    padEnds: false,
                    controller: controller,
                    itemBuilder: (context, index) {
                      final i = index % 3;
                      return OnBoaridngItem(
                        assetName: kOnboaridngInfo[i].assetName,
                        text: kOnboaridngInfo[i].text,
                      );
                    }),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: const Color(0xFFFF5D21),
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: ref.read(themeProvider).indicatorDotColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoaridngItem extends StatelessWidget {
  final String assetName;
  final String text;

  const OnBoaridngItem(
      {super.key, required this.assetName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName,
              height: 282,
              width: 252,
              semanticsLabel: 'image desc' // used also to improve ASO
              ),
          const SizedBox(
            height: 30,
          ),
          Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Khebrat',
                fontSize: 30,
              ))
        ],
      ),
    );
  }
}
