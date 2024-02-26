import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nard_test/core/commons/widgets/action_button.dart';
import 'package:nard_test/core/consts/consts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ActionButton(
              callback: () {},
              text: 'Next',
            ),
          )
        ],
      ),
      body: Column(
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
                    assetName: onboaridngInfo[i].assetName,
                    text: onboaridngInfo[i].text,
                  );
                }),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xFFFF5D21),
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Color(0xFF87a0b3)),
          ),
        ],
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
                  fontFamily: 'Inter-Regular',
                  fontSize: 30,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
