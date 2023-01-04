import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String suptitle;

  const OnBoardingContent({
    required this.image,
    required this.title,
    required this.suptitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 370,
              child: Image.asset(image)),
          const SizedBox(
            height: 50,
          ),
          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'BentonSans',
              color: Color(0xFF09051C),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            suptitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'BentonSans1',
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
