import 'package:flutter/material.dart';
import 'package:fooddelivery/firebase/fb_auth_controller.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/auth/sign_up_screen.dart';
import 'package:fooddelivery/screens/view_more_screens/edite_screen.dart';
import 'package:fooddelivery/screens/view_more_screens/favorite_screen.dart';
import 'package:fooddelivery/screens/view_more_screens/voucher_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, widget) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Provider.of<AuthProvider>(context, listen: false)
                            .loggedUserData!
                            .imageUrl !=
                        null
                    ? Image.network(
                        provider.loggedUserData!.imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Center(child:Container(
                  width: double.infinity,
                    height: 300,
                    child: Image.network('https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',fit: BoxFit.contain,)),),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 415,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: 100,
                            height: 3,
                            color: Colors.black26,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.firstName!,
                                    provider.loggedUserData!.firstName!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'BentonSans',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.lastName!,
                                    provider.loggedUserData!.lastName!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'BentonSans',
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      AppRouter.goToScreen(EditeScreen());
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Color(0xFF53E88B),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                // 'anamwp66@gmail.com',
                                // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.email!,
                                provider.loggedUserData!.email!,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Bio",
                                      style: TextStyle(
                                        color: Color(0xFF53E88B),
                                        fontSize: 20,
                                        fontFamily: 'BentonSans',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("Address : " +
                                        provider.loggedUserData!.address!),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("contact number : " +
                                        provider.loggedUserData!.phoneNumber!),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                height: 70,
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset(
                                        'images/imagesicons/VoucherIcon.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      'You Have 3 Voucher',
                                      style: TextStyle(
                                          color: Color(0xFF09051C),
                                          fontSize: 15,
                                          fontFamily: 'BentonSans1',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        AppRouter.goToScreen(
                                            const VoucherScreen());
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF53E88B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                height: 70,
                                width: 380,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 40,
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      'Favorite',
                                      style: TextStyle(
                                          color: Color(0xFF09051C),
                                          fontSize: 15,
                                          fontFamily: 'BentonSans1',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        AppRouter.goToScreen(
                                            const FavoriteScreen());
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF53E88B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  height: 70,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Icon(
                                            Icons.logout,
                                            color: Colors.red,
                                            size: 40,
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        'Logout',
                                        style: TextStyle(
                                            color: Color(0xFF09051C),
                                            fontSize: 15,
                                            fontFamily: 'BentonSans1',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          await AuthController.authController
                                              .signOut();
                                          AppRouter.goToScreen(
                                              const SignUpScreen());
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF53E88B),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        //   Column(
        //   children: [
        //     Container(
        //       height: 170,
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //         borderRadius: const BorderRadius.only(
        //             bottomLeft: Radius.circular(20),
        //             bottomRight: Radius.circular(20)),
        //         color: Color(0xFF53E88B),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.1),
        //             blurRadius: 10,
        //             offset: const Offset(0, 5),
        //           ),
        //         ],
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 25, left: 20),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             provider.loggedUserData!.imageUrl! != null
        //                 ? CircleAvatar(
        //                     radius: 50,
        //                     backgroundImage: NetworkImage(
        //                       // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.imageUrl!
        //                       provider.loggedUserData!.imageUrl!,
        //                     ),
        //                   )
        //                 : const CircularProgressIndicator(),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Text(
        //                       // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.firstName!,
        //                       provider.loggedUserData!.firstName!,
        //                       style: const TextStyle(
        //                         color: Color(0xFFFFFFFF),
        //                         fontSize: 20,
        //                         fontFamily: 'BentonSans',
        //                       ),
        //                     ),
        //                     const SizedBox(
        //                       width: 5,
        //                     ),
        //                     Text(
        //                       // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.lastName!,
        //                       provider.loggedUserData!.lastName!,
        //                       style: const TextStyle(
        //                         color: Color(0xFFFFFFFF),
        //                         fontSize: 20,
        //                         fontFamily: 'BentonSans',
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 const SizedBox(
        //                   height: 5,
        //                 ),
        //                 Text(
        //                   // 'anamwp66@gmail.com',
        //                   // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.email!,
        //                   provider.loggedUserData!.email!,
        //                   style: const TextStyle(
        //                       fontSize: 12, color: Colors.white),
        //                 ),
        //               ],
        //             ),
        //             const Spacer(),
        //             IconButton(
        //               onPressed: () {
        //                 AppRouter.goToScreen( EditeScreen());
        //               },
        //               icon: const Icon(
        //                 Icons.edit,
        //                 color: Color(0xFFFFFFFF),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 30,
        //     ),
        //     Align(
        //       alignment: AlignmentDirectional.topStart,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const Text(
        //               "Bio",
        //               style: TextStyle(
        //                 color: Color(0xFF53E88B),
        //                 fontSize: 20,
        //                 fontFamily: 'BentonSans',
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Text("Address : " + provider.loggedUserData!.address!),
        //             const SizedBox(
        //               height: 5,
        //             ),
        //             Text("contact number : " +
        //                 provider.loggedUserData!.phoneNumber!),
        //           ],
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 30,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: 20,
        //       ),
        //       height: 70,
        //       width: 380,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color: Colors.white,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.1),
        //             blurRadius: 10,
        //             offset: const Offset(0, 5),
        //           ),
        //         ],
        //       ),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SizedBox(
        //             width: 60,
        //             height: 60,
        //             child: Image.asset(
        //               'images/imagesicons/VoucherIcon.png',
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 20,
        //           ),
        //           const Text(
        //             'You Have 3 Voucher',
        //             style: TextStyle(
        //                 color: Color(0xFF09051C),
        //                 fontSize: 15,
        //                 fontFamily: 'BentonSans1',
        //                 fontWeight: FontWeight.bold),
        //           ),
        //           const Spacer(),
        //           IconButton(
        //             onPressed: () {
        //               AppRouter.goToScreen(const VoucherScreen());
        //             },
        //             icon: const Icon(
        //               Icons.arrow_forward_ios,
        //               color: Color(0xFF53E88B),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: 20,
        //       ),
        //       height: 70,
        //       width: 380,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color: Colors.white,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.1),
        //             blurRadius: 10,
        //             offset: const Offset(0, 5),
        //           ),
        //         ],
        //       ),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           const SizedBox(
        //               width: 60,
        //               height: 60,
        //               child: Icon(
        //                 Icons.favorite,
        //                 color: Colors.red,
        //                 size: 40,
        //               )),
        //           const SizedBox(
        //             width: 20,
        //           ),
        //           const Text(
        //             'Favorite',
        //             style: TextStyle(
        //                 color: Color(0xFF09051C),
        //                 fontSize: 15,
        //                 fontFamily: 'BentonSans1',
        //                 fontWeight: FontWeight.bold),
        //           ),
        //           const Spacer(),
        //           IconButton(
        //             onPressed: () {
        //               AppRouter.goToScreen(const FavoriteScreen());
        //             },
        //             icon: const Icon(
        //               Icons.arrow_forward_ios,
        //               color: Color(0xFF53E88B),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: 20,
        //       ),
        //       height: 70,
        //       width: 380,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         color: Colors.white,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.1),
        //             blurRadius: 10,
        //             offset: const Offset(0, 5),
        //           ),
        //         ],
        //       ),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           const SizedBox(
        //               width: 60,
        //               height: 60,
        //               child: Icon(
        //                 Icons.logout,
        //                 color: Colors.red,
        //                 size: 40,
        //               )),
        //           const SizedBox(
        //             width: 20,
        //           ),
        //           const Text(
        //             'Logout',
        //             style: TextStyle(
        //                 color: Color(0xFF09051C),
        //                 fontSize: 15,
        //                 fontFamily: 'BentonSans1',
        //                 fontWeight: FontWeight.bold),
        //           ),
        //           const Spacer(),
        //           IconButton(
        //             onPressed: () async {
        //               await AuthController.authController.signOut();
        //               AppRouter.goToScreen(const SignUpScreen());
        //             },
        //             icon: const Icon(
        //               Icons.arrow_forward_ios,
        //               color: Color(0xFF53E88B),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      },
    );
    //   Consumer<AuthProvider>(
    //   builder: (context, provider, widget) {
    //     return Padding(
    //       padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
    //       child: ListView(
    //         children: [
    //           ListTile(
    //             leading: Container(
    //               width: 60,
    //               height: 60,
    //               decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     image: NetworkImage(
    //                       // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.imageUrl!
    //                       provider.loggedUserData!.imageUrl!,
    //                     ),
    //                     fit: BoxFit.cover),
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //             ),
    //             title: Row(
    //               children: [
    //                 Text(
    //                   // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.firstName!,
    //                   provider.loggedUserData!.firstName!,
    //                   style: const TextStyle(
    //                     color: Color(0xFF09051C),
    //                     fontSize: 20,
    //                     fontFamily: 'BentonSans',
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(
    //                   // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.lastName!,
    //                   provider.loggedUserData!.lastName!,
    //                   style: const TextStyle(
    //                     color: Color(0xFF09051C),
    //                     fontSize: 20,
    //                     fontFamily: 'BentonSans',
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             subtitle: Text(
    //               // 'anamwp66@gmail.com',
    //               // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.email!,
    //                 provider.loggedUserData!.email!,
    //               style: const TextStyle(fontSize: 12, color: Colors.grey),
    //
    //             ),
    //             trailing: IconButton(
    //               onPressed: () {},
    //               icon: const Icon(
    //                 Icons.edit,
    //                 color: Color(0xFF53E88B),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 20,
    //             ),
    //             height: 70,
    //             width: 380,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20),
    //               color: Colors.white,
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.black.withOpacity(0.1),
    //                   blurRadius: 10,
    //                   offset: const Offset(0, 5),
    //                 ),
    //               ],
    //             ),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 SizedBox(
    //                   width: 60,
    //                   height: 60,
    //                   child: Image.asset(
    //                     'images/imagesicons/VoucherIcon.png',
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 20,
    //                 ),
    //                 const Text(
    //                   'You Have 3 Voucher',
    //                   style: TextStyle(
    //                       color: Color(0xFF09051C),
    //                       fontSize: 15,
    //                       fontFamily: 'BentonSans1',
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           const Text(
    //             'Favorite',
    //             style: TextStyle(
    //               color: Color(0xFF09051C),
    //               fontSize: 20,
    //               fontFamily: 'BentonSans',
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           SizedBox(
    //             width: double.infinity,
    //             height: 400,
    //             child: ListView.builder(
    //               itemCount: Provider.of<FoodProvider>(context)
    //                   .dataMenu
    //                   .where((element) => element.isFavorite)
    //                   .length,
    //               itemBuilder: (context, index) {
    //                 return FavoriteWidget(Provider.of<FoodProvider>(context)
    //                     .dataMenu
    //                     .where((element) => element.isFavorite)
    //                     .toList()[index]);
    //               },
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

/**              Container(
    height: 100,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 10,
    offset: const Offset(0, 5),
    ),
    ],
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const Spacer(),

    Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
    image: const DecorationImage(
    image: AssetImage('images/image/Profile.png'),
    fit: BoxFit.cover),
    borderRadius: BorderRadius.circular(20),
    ),
    ),
    const SizedBox(width: 10,),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
    Text(
    'Spacy fresh crab',
    style: TextStyle(
    color: Color(0xFF09051C),
    fontSize: 18,
    fontFamily: 'BentonSans',
    ),
    ),
    Text(
    'Waroenk kita',
    style: TextStyle(
    fontSize: 15,
    fontFamily: 'BentonSans1',
    ),
    ),
    SizedBox(
    height: 10,
    ),
    Text(
    '\$35',
    style: TextStyle(
    fontSize: 20,
    fontFamily: 'BentonSans1',
    color: Color(0xFF8BE8B6)),
    ),
    ],
    ),
    const Spacer(),
    ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
    minimumSize: const Size(80, 40),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    primary: const Color(0xFF53E88B),
    ),
    child: const Text('Buy Again'),
    ),

    ],
    ),
    ),
 */
