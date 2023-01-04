import 'package:flutter/material.dart';
import 'package:fooddelivery/providers/auth_provider.dart';


import 'package:fooddelivery/widget/background_widget_singup_and_singout.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, provider, widget) {
          return ListView(
            children: [
              const BackgroundWidget(),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                provider.registeremailEditingController,
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
              CustomTextField(
                  provider.registerpasswordEditingControllerl,
                  'Password',
                  TextInputType.visiblePassword,
                  const Icon(
                    Icons.lock,
                    color: Colors.tealAccent,
                  ),
                  true,
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.tealAccent,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                provider.firstnameEditingControllerl,
                'First Name',
                TextInputType.emailAddress,
                const Icon(
                  Icons.person,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                provider.lastnameEditingControllerl,
                'Last Name',
                TextInputType.visiblePassword,
                const Icon(
                  Icons.person_outline,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                provider.phonenumberEditingControllerl,
                'Phone Number',
                TextInputType.emailAddress,
                const Icon(
                  Icons.phone,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                provider.addressEditingControllerl,
                'Address',
                TextInputType.visiblePassword,
                const Icon(
                  Icons.location_city,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    provider.perfoemregister();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(157, 57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: const Color(0xFF53E88B),
                  ),
                  child: const Text(
                    'Register',
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          );
        },
      ),
    );
  }
}

// void _perfoemregister() {
//   if (_checkData()) {
//     register();
//   }
// }
//
// bool _checkData() {
//   if (_emailEditingController.text.isNotEmpty &&
//       _passwordEditingControllerl.text.isNotEmpty) {
//     return true;
//   }
//   showSnackBar(context, message: 'Enter required data! ', error: true);
//   return false;
// }
//
// void register() async {
//   FireBaseResponse fireBaseResponse = await AuthController().createAccount(
//       email: _emailEditingController.text,
//       password: _passwordEditingControllerl.text);
//   showSnackBar(context,
//       message: fireBaseResponse.message, error: !fireBaseResponse.status);
//   if (fireBaseResponse.status) {
//     // AppRouter.goAndReplaceScreen(const SignUpScreen());
//     getUserFromAuth();
//     UserData userData = UserData(
//       loggedUser.id,
//       _firstnameEditingControllerl.text,
//       _lastnameEditingControllerl.text,
//       _phonenumberEditingControllerl.text,
//       _addressEditingControllerl.text,
//     );
//     FbFireStoreController.fbFireStoreController.createNewUser(userData);
//     // AppRouter.goPopScreen();
//   }
// }
//
// getUserFromAuth() {}
