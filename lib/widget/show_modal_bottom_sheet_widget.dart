// import 'package:flutter/material.dart';
// import 'package:fooddelivery/admin/models/popularMenu.dart';
// import 'package:fooddelivery/admin/providers/admin_provider.dart';
// import 'package:fooddelivery/firebase/fb_fire_store_controller.dart';
// import 'package:fooddelivery/model/menu.dart';
// import 'package:fooddelivery/providers/food_provider.dart';
// import 'package:fooddelivery/routers/app_router.dart';
// import 'package:fooddelivery/screens/nav_bar_screens/cart_screen.dart';
// import 'package:fooddelivery/widget/testimonials_widget.dart';
// import 'package:provider/provider.dart';
//
// class ShowModalBottomSheetWidget extends StatelessWidget {
//   const ShowModalBottomSheetWidget({
//     Key? key,
//     required this.popularMenu,
//   }) : super(key: key);
//
//   final PopularMenu popularMenu;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FoodProvider>(
//       builder: (context, provider, widget) {
//         return Stack(
//           children: [
//             SizedBox(
//               height: 500,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                 child: Column(
//                   children: [
//                     Center(
//                       child: Container(
//                         width: 100,
//                         height: 3,
//                         color: Colors.black26,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           Row(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () async {},
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: const Size(100, 40),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   primary: Colors.greenAccent.shade100,
//                                 ),
//                                 child: const Text(
//                                   'Popular',
//                                   style: TextStyle(
//                                     color: Color(0xFF15BE77),
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                               const Spacer(),
//                               CircleAvatar(
//                                 radius: 20,
//                                 backgroundColor: Colors.greenAccent.shade100,
//                                 child: const Icon(
//                                   Icons.location_on_rounded,
//                                   color: Color(0xFF15BE77),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   // dataMenu.isFavorite = !dataMenu.isFavorite;
//                                   provider.isFavorite(popularMenu);
//                                   //
//                                   // provider.favorite(dataMenu);
//                                 },
//                                 child: CircleAvatar(
//                                   radius: 20,
//                                   backgroundColor: Colors.red.shade100,
//                                   child: popularMenu.isFavorite!
//                                       ? const Icon(Icons.favorite,
//                                           color: Color(0xFFFF1D1D))
//                                       : const Icon(
//                                           Icons.favorite_outline,
//                                         ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             popularMenu.title!,
//                             style: const TextStyle(
//                               fontSize: 27,
//                               fontFamily: 'BentonSans',
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             children: [
//                               Row(
//                                 children: const [
//                                   Icon(
//                                     Icons.star_half,
//                                     color: Color(0xFF53E88B),
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     '4,8 Rating',
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Row(
//                                 children: const [
//                                   Icon(
//                                     Icons.shopping_bag_outlined,
//                                     color: Color(0xFF53E88B),
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     '2000+ Order',
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             popularMenu.description!,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             'Testimonials',
//                             style: TextStyle(
//                               color: Color(0xFF09051C),
//                               fontSize: 15,
//                               fontFamily: 'BentonSans',
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                               // height: 130,
//                               // width: 400,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.1),
//                                     blurRadius: 30,
//                                     offset: const Offset(0, 10),
//                                   ),
//                                 ],
//                               ),
//                               child: SizedBox(
//                                 height: 500,
//                                 child: ListView.builder(
//                                   physics: NeverScrollableScrollPhysics(),
//                                     itemCount: 5,
//                                     itemBuilder: (context, index) {
//                                       return const TestimonialsWidget();
//                                     }),
//                               )),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               left: 20,
//               right: 20,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   Provider.of<AdminProvider>(context, listen: false)
//                       .addToCart(popularMenu);
//                   AppRouter.showSnackBar(message: 'done successfully to cart');
//                 },
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(180, 70),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     primary: const Color(0xFF8BE8B6)),
//                 child: const Text(
//                   'Add To Chart',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
