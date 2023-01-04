import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/firebase/fb_auth_controller.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/auth/sign_up_screen.dart';
import 'package:fooddelivery/screens/nav_bar_screens/main_screen.dart';
import 'package:fooddelivery/widget/on_boarding_content.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnBoardingContent(
                    image: 'images/image/on_boarding1.png',
                    title: 'Find your  Comfort\n Food here',
                    suptitle:
                        'Here You Can find a chef or dish for every\n taste and color. Enjoy!',
                  ),
                  OnBoardingContent(
                    image: 'images/image/on_boarding2.png',
                    title: 'Food Ninja is Where Your Comfort Food Lives',
                    suptitle:
                        'Enjoy a fast and smooth food delivery at\n your doorstep',
                  ),
                ],
              ),
            ),
            Visibility(
              // maintainAnimation: true,
              // maintainSize: true,
              // maintainState: true,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 1) {
                    _pageController.animateToPage(1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInCirc);
                  }
                  if (_currentPage == 1) {
                    User? user = AuthController.authController.checkUser();
                    if (user == null) {
                      AppRouter.goAndReplaceScreen(const SignUpScreen());
                    } else {
                      print("Print The user Id Check" + user.uid);
                      Provider.of<AuthProvider>(context,listen: false)
                          .getUserFromFireStore(user.uid);
                      AppRouter.goAndReplaceScreen(const MainScreen());
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(157, 57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: const Color(0xFF53E88B),
                ),
                child: const Text(
                  'Next',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
