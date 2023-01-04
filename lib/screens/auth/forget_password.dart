import 'package:flutter/material.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, widget) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget_textAndimage_in_screens(
              'Forgot password?',
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Reset your password using your email'),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              provider.forgetemailEditingController,
              'Email',
              TextInputType.emailAddress,
              const Icon(
                Icons.email,
                color: Colors.tealAccent,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  provider.performForgetPassword();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(157, 57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: const Color(0xFF53E88B),
                ),
                child: const Text(
                  'Reset',
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

// Future<void> _performForgetPassword() async {
//   if (checkData()) {
//     _forgetPassword();
//   }
// }
//
// bool checkData() {
//   if (_emailEditingController.text.isNotEmpty) {
//     return true;
//   }
//   showSnackBar(context, message: 'Enter required data! ', error: true);
//   return false;
// }
//
// Future<void> _forgetPassword() async {
//   FireBaseResponse fireBaseResponse = await AuthController().forgetPassword(
//     email: _emailEditingController.text,
//   );
//   showSnackBar(context,
//       message: fireBaseResponse.message, error: !fireBaseResponse.status);
//   if (fireBaseResponse.status) {
//     AppRouter.goPopScreen();
//   }
// }}
