import 'package:flutter/material.dart';

import '../constants.dart';

const _isActive = false;
int _currentIndex = 0;

class PageIndicator__widget extends StatelessWidget {
  const PageIndicator__widget({
    Key? key,
    required this.pageIndex,
    required this.pageLength,
  }) : super(key: key);
  @override
  final pageIndex;
  final int pageLength;

  Widget build(BuildContext context) {
    return Row(
      children: List.generate(pageLength, (index) {
        if (pageIndex == index) {
          return const SingleIndicator__widget(isActive: true);
        } else {
          return const SingleIndicator__widget(isActive: false);
        }
      }),
    );
  }
}

class SingleIndicator__widget extends StatelessWidget {
  const SingleIndicator__widget({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.all(4.0),
      width: isActive ? 30 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? kColorSecondary : kColorSecondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
