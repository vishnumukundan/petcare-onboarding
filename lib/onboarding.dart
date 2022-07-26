import 'package:flutter/material.dart';
import 'package:petcare_onboarding/constants.dart';
import 'package:petcare_onboarding/gen/assets.gen.dart';
import 'package:petcare_onboarding/screen_size_config.dart';
import 'package:petcare_onboarding/widgets/content.dart';
import 'package:petcare_onboarding/widgets/page_indicator.dart';

double _pagePadding = getScreenWidthPercentage(10.0);

PageController _pageController = PageController(initialPage: 0);
int _currentIndex = 0;

List<Widget> _pages = [
  Content__widget(
    imagePath: Assets.images.image1.path,
    title: 'Find petcare around your location',
    description:
        'Just turn on your location and you will find \n the nearest pet care you wish.',
  ),
  Content__widget(
    imagePath: Assets.images.image2.path,
    title: 'Let us give the best treatment',
    description: 'Get the best treatment for your \n animal with us.',
  ),
  Content__widget(
    imagePath: Assets.images.image3.path,
    title: 'Book appointment \n with us!',
    description: 'What do you think? book our \n veterinarians now',
  ),
];

class ScreenOnboarding extends StatefulWidget {
  const ScreenOnboarding({Key? key}) : super(key: key);

  @override
  State<ScreenOnboarding> createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
            Visibility(
              visible: _pages.length - 1 == _currentIndex ? false : true,
              child: GestureDetector(
                onTap: () => setState(() {
                  _pageController.animateToPage(
                    _pages.length - 1,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                }),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 40.0,
                      right: _pagePadding,
                    ),
                    child: const Text('Skip', style: kSemiboldTextStyle),
                  ),
                ),
              ),
            ),
            buttonSwap(),
          ],
        ),
      ),
    );
  }
}

buttonSwap() {
  if (_currentIndex < _pages.length - 1) {
    return Padding(
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
            GestureDetector(
              onTap: () => buttonFunction(_pageController),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: kColorSecondary,
                  shape: BoxShape.circle,
                ),
                child: Assets.images.arrowRight.svg(),
              ),
            )
          ],
        ),
      ),
    );
  }
  if (_currentIndex == _pages.length - 1) {
    return Padding(
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
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(23.0),
                decoration: BoxDecoration(
                  color: kColorSecondary,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Text('Get Started', style: kButtonTextStyle),
              ),
            )
          ],
        ),
      ),
    );
  }
}

buttonFunction(PageController controller) {
  if (_currentIndex < _pages.length - 1) {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
