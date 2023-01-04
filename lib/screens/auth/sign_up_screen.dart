import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/auth/forget_password.dart';
import 'package:fooddelivery/screens/auth/register_screen.dart';
import 'package:fooddelivery/widget/background_widget_singup_and_singout.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _navRegister;
  }

  void _navRegister() => AppRouter.goToScreen(const RegisterScreen());

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: Consumer<AuthProvider>(
        builder: (context, provider, widget) {
          return ListView(
            children: [
              const BackgroundWidget(),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login To Your Account',
                    style: TextStyle(
                      fontFamily: 'BentonSans',
                      fontSize: 15,
                      color: Color(0xFF09051C),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    provider.loginemailEditingController,
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
                      provider.loginpasswordEditingControllerl,
                      'Password',
                      TextInputType.visiblePassword,
                      const Icon(
                        Icons.lock,
                        color: Colors.tealAccent,
                      ),
                      true,
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.visibility),
                      // ),
                  ),
                  const SizedBox(
                    height:10,
                  ),
                  // const Text(
                  //   'Or Continue With',
                  //   style: TextStyle(
                  //       fontSize: 12,
                  //       fontFamily: 'BentonSans',
                  //       color: Color(0xFF09051C)),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Container(
                  //           width: 150,
                  //           height: 57,
                  //           decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: Colors.black12,
                  //             ),
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.white,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               CircleAvatar(
                  //                 radius: 15,
                  //                 child: Image.asset(
                  //                     'images/imagesicons/facebook_icon.png'),
                  //               ),
                  //               const SizedBox(
                  //                 width: 10,
                  //               ),
                  //               const Text(
                  //                 'Facebook',
                  //                 style: TextStyle(
                  //                     fontSize: 15, fontFamily: 'BentonSans'),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Container(
                  //           width: 150,
                  //           height: 57,
                  //           decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: Colors.black12,
                  //             ),
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.white,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               CircleAvatar(
                  //                 radius: 15,
                  //                 backgroundColor: Colors.white,
                  //                 child: Image.asset(
                  //                   'images/imagesicons/google_icon.png',
                  //                   fit: BoxFit.fill,
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 width: 10,
                  //               ),
                  //               const Text(
                  //                 'Google',
                  //                 style: TextStyle(
                  //                     fontSize: 15, fontFamily: 'BentonSans'),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: TextButton(
                      child: const Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'BentonSans1',
                          color: Color(0xFF53E88B),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        AppRouter.goToScreen(const ForgetPassword());
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.perfoemlogin();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(157, 57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: const Color(0xFF53E88B),
                    ),
                    child: const Text(
                      'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(
                                color: Color(0xFF9391A4), fontSize: 18)),
                        TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: 'Sign Up',
                            style: const TextStyle(
                              color: Color(0xFF53E88B),
                              fontSize: 20,
                            )),
                      ],
                    )),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   late TapGestureRecognizer _tapGestureRecognizer;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tapGestureRecognizer = TapGestureRecognizer()..onTap = _navRegister;
//   }
//
//   void _navRegister() => AppRouter.goToScreen(const RegisterScreen());
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFAFDFF),
//       body: Consumer<FoodProvider>(
//         builder: (context, provider, widget) {
//           return ListView(
//             children: [
//               const BackgroundWidget(),
//               const SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Login To Your Account',
//                     style: TextStyle(
//                       fontFamily: 'BentonSans',
//                       fontSize: 15,
//                       color: Color(0xFF09051C),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   CustomTextField(
//                     provider.loginemailEditingController,
//                     'Email',
//                     TextInputType.emailAddress,
//                     const Icon(
//                       Icons.email,
//                       color: Colors.tealAccent,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                       provider.loginpasswordEditingControllerl,
//                       'Password',
//                       TextInputType.visiblePassword,
//                       const Icon(
//                         Icons.lock,
//                         color: Colors.tealAccent,
//                       ),
//                       true,
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.visibility),
//                       )),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     'Or Continue With',
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontFamily: 'BentonSans',
//                         color: Color(0xFF09051C)),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             width: 150,
//                             height: 57,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Colors.black12,
//                               ),
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CircleAvatar(
//                                   radius: 15,
//                                   child: Image.asset(
//                                       'images/imagesicons/facebook_icon.png'),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 const Text(
//                                   'Facebook',
//                                   style: TextStyle(
//                                       fontSize: 15, fontFamily: 'BentonSans'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: 150,
//                             height: 57,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: Colors.black12,
//                               ),
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CircleAvatar(
//                                   radius: 15,
//                                   backgroundColor: Colors.white,
//                                   child: Image.asset(
//                                     'images/imagesicons/google_icon.png',
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 const Text(
//                                   'Google',
//                                   style: TextStyle(
//                                       fontSize: 15, fontFamily: 'BentonSans'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   TextButton(
//                     child: const Text(
//                       'Forgot Your Password?',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontFamily: 'BentonSans1',
//                         color: Color(0xFF53E88B),
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                     onPressed: () {
//                       AppRouter.goToScreen(const ForgetPassword());
//                     },
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       provider.perfoemlogin();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(157, 57),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       primary: const Color(0xFF53E88B),
//                     ),
//                     child: const Text(
//                       'Login',
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Center(
//                     child: RichText(
//                         text: TextSpan(
//                       children: [
//                         const TextSpan(
//                             text: 'Don’t have an account? ',
//                             style: TextStyle(
//                                 color: Color(0xFF9391A4), fontSize: 18)),
//                         TextSpan(
//                             recognizer: _tapGestureRecognizer,
//                             text: 'Sign Up',
//                             style: const TextStyle(
//                               color: Color(0xFF53E88B),
//                               fontSize: 20,
//                             )),
//                       ],
//                     )),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
// // void _perfoemlogin() {
// //   if (_checkData()) {
// //     login();
// //   }
// // }
// //
// // bool _checkData() {
// //   if (_emailEditingController.text.isNotEmpty &&
// //       _passwordEditingControllerl.text.isNotEmpty) {
// //     return true;
// //   }
// //   showSnackBar(context, message: 'Enter required data! ',  );
// //   return false;
// // }
// //
// // void login() async {
// //   FireBaseResponse fireBaseResponse = await AuthController().sinIn(
// //       email: _emailEditingController.text,
// //       password: _passwordEditingControllerl.text);
// //   showSnackBar(context,
// //       message: fireBaseResponse.message, error: !fireBaseResponse.status);
// //   if (fireBaseResponse.status) {
// //     AppRouter.goAndReplaceScreen(const MainScreen());
// //   }
// // }
// }
