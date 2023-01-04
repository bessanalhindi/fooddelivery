import 'package:flutter/material.dart';
import 'package:fooddelivery/firebase/fb_auth_controller.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/auth/sign_up_screen.dart';
import 'package:fooddelivery/widget/chat_widgets.dart';

class CharScreen extends StatelessWidget {
  const CharScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'images/image/backgroundimage.png',
              fit: BoxFit.cover,
              color: Colors.greenAccent.shade700,
            ),
            const Positioned(
              top: 140,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Chat',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'BentonSans',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ChatWidgets();
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     const Text(
        //       'LogOut',
        //       style: TextStyle(
        //         color: Color(0xFF09051C),
        //         fontSize: 15,
        //         fontFamily: 'BentonSans',
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () async {
        //         await AuthController.authController.signOut();
        //         AppRouter.goToScreen(const SignUpScreen());
        //       },
        //       style: ElevatedButton.styleFrom(
        //         minimumSize: const Size(80, 40),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20),
        //         ),
        //         primary: Colors.red,
        //       ),
        //       child: Row(
        //         children: const [
        //           Text('LogOut'),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           Icon(
        //             Icons.logout,
        //             size: 20,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
