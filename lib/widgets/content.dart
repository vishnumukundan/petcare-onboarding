import 'package:flutter/material.dart';
import 'package:petcare_onboarding/constants.dart';
import 'package:petcare_onboarding/screen_size_config.dart';

class Content__widget extends StatelessWidget {
  const Content__widget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imagePath;
  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidthPercentage(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: getScreenHeightPercentage(40.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: getScreenWidthPercentage(30.0)),
                  height: 50,
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: kColorShadow.withOpacity(0.1),
                      spreadRadius: 100,
                      blurRadius: 100,
                      offset: const Offset(0, 0),
                    )
                  ]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: kHeadlineTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: kBodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
