import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petcare_onboarding/constants.dart';
import 'package:petcare_onboarding/gen/assets.gen.dart';
import 'package:petcare_onboarding/screen_size_config.dart';
import 'package:petcare_onboarding/widgets/page_indicator.dart';

double _pagePadding = getScreenWidthPercentage(8.0);

PageController _pageController = PageController();
int _currentIndex = 0;

List<Widget> _pages = const [
  Center(child: Text('Page 1', style: kHeadlineTextStyle)),
  Center(child: Text('Page 2', style: kHeadlineTextStyle)),
  Center(child: Text('Page 3', style: kHeadlineTextStyle)),
];

class ScreenOnboarding extends StatefulWidget {
  const ScreenOnboarding({Key? key}) : super(key: key);

  @override
  State<ScreenOnboarding> createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              controller: _pageController,
              children: _pages,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 40.0,
                  right: _pagePadding,
                ),
                child: const Text(
                  'Skip',
                  style: kSemiboldTextStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 32,
                left: _pagePadding,
                right: _pagePadding,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    PageIndicator__widget(
                      pageIndex: _currentIndex,
                      pageLength: _pages.length,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: kColorSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Assets.images.arrowRight.svg(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
