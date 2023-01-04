import 'package:flutter/material.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, widget) {
        return Scaffold(
          backgroundColor: const Color(0xFFFAFDFF),
          body: Column(
            children: [
              SizedBox(
                height: 370,
                child: Image.asset(
                  'images/image/launch_image.png',
                  fit: BoxFit.cover,
                  color: Colors.greenAccent.shade200,
                ),
              ),
              Center(
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
          ),
        );
      },
    );
  }
}

//
// class LaunchScreen extends StatefulWidget {
//   const LaunchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LaunchScreen> createState() => _LaunchScreenState();
// }
//
// class _LaunchScreenState extends State<LaunchScreen> {
//   late StreamSubscription _streamSubscription;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       _streamSubscription =
//           AuthController().checkUserStatus(({required bool loggedIn}) {
//         String route = loggedIn
//             ? AppRouter.goAndReplaceScreen(const MainScreen())
//             : AppRouter.goAndReplaceScreen(const SignUpScreen());
//         Navigator.pushReplacementNamed(context, route);
//       });
//       // String route = SharedPrefController().loggedIn
//       //     ? AppRouter.goToScreen(MainScreen())
//       //     : AppRouter.goToScreen(SignUpScreen());
//       // Navigator.pushReplacementNamed(context, route);
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _streamSubscription.cancel();
//     //لازم نغلقها بعد ما يسجل دخول
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFAFDFF),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 370,
//             child: Image.asset(
//               'images/image/launch_image.png',
//               fit: BoxFit.cover,
//               color: Colors.greenAccent.shade200,
//             ),
//           ),
//           Center(
//             child: SizedBox(
//                 width: 188,
//                 height: 205,
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'images/image/Logo_image.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
