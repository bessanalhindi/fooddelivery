import 'package:flutter/material.dart';
import 'package:fooddelivery/routers/app_router.dart';

class widget_textAndimage_in_screens extends StatelessWidget {
  String text;

  widget_textAndimage_in_screens(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/image/backgroundimage.png',
          fit: BoxFit.cover,
          color: Colors.grey.shade800,
        ),
        Positioned(
          top: 70,
          left: 25,
          child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFEF6ED),
                boxShadow: const [
                  // BoxShadow(color: Colors.black54),
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFDA6317),
                  size: 25,
                ),
                onPressed: () {
                  AppRouter.goPopScreen();
                },
              )),
        ),
        Positioned(
          top: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'BentonSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
