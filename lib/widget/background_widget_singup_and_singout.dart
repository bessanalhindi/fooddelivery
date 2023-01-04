import 'package:flutter/material.dart';
class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: Image.asset(
            'images/image/launch_image.png',
            fit: BoxFit.cover,
            color: Colors.greenAccent.shade200,
          ),
        ),
        Positioned(
          top: 55,
          left: 120,
          child: SizedBox(
              width: 188,
              height: 205,
              child: Column(
                children: [
                  Image.asset(
                    'images/image/Logo_image.png',
                    fit: BoxFit.cover,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
