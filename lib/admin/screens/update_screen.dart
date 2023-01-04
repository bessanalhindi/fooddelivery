// import 'package:flutter/material.dart';
// import 'package:fooddelivery/admin/models/popularMenu.dart';
// import 'package:fooddelivery/admin/providers/admin_provider.dart';
// import 'package:fooddelivery/routers/app_router.dart';
// import 'package:fooddelivery/widget/custom_textfield.dart';
// import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
// import 'package:provider/provider.dart';
//
// class UpDateScreen extends StatelessWidget {
//   PopularMenu popularMenu;
//
//   UpDateScreen(this.popularMenu, {Key? key}) : super(key: key);
//   GlobalKey<FormState> upDateKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFAFDFF),
//       body: Consumer<AdminProvider>(
//         builder: (context, provider, widget) {
//           return Form(
//             key: upDateKey,
//             child: ListView(
//               children: [
//                 widget_textAndimage_in_screens('UpDate'),
//                 Stack(
//                   children: [
//                     Center(
//                       child: Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: provider.pickImage == null
//                             ? Image.network(
//                                 popularMenu.image!,
//                           fit: BoxFit.cover,
//                               )
//                             : Image.file(provider.pickImage!),
//                       ),
//                     ),
//                     // Center(
//                     //   child: CircleAvatar(
//                     //     radius: 70,
//                     //     // backgroundImage: FileImage(provider.pickImage!),
//                     //     backgroundColor: Colors.grey,
//                     //   ),
//                     // ),
//
//                     // Center(
//                     //   child: provider.pickImage! == null
//                     //       ? Container(
//                     //           width: 150,
//                     //           height: 150,
//                     //           decoration: BoxDecoration(
//                     //             borderRadius: BorderRadius.circular(50),
//                     //             color: Colors.red,
//                     //             image: DecorationImage(
//                     //               image: FileImage(provider.pickImage!),
//                     //             ),
//                     //           ),
//                     //           // child: provider.pickImage != null
//                     //           //     ? Image.file(provider.pickImage!)
//                     //           //     : Text('null Image'),
//                     //         )
//                     //       : Container(
//                     //           width: 150,
//                     //           height: 150,
//                     //           decoration: BoxDecoration(
//                     //             borderRadius: BorderRadius.circular(50),
//                     //             color: Colors.grey,
//                     //           ),
//                     //         ),
//                     //   // child: provider.pickImage != null
//                     //   //     ? Image.file(provider.pickImage!)
//                     //   //     : Text('null Image'),
//                     // ),
//                     SizedBox(
//                       height: 20,
//                     ),
//
//                     Positioned(
//                       top: 40,
//                       left: 250,
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.tealAccent),
//                         child: Center(
//                           child: IconButton(
//                             onPressed: () {
//                               // provider.pickCategoryImage();
//                             },
//                             icon: const Icon(
//                               Icons.camera,
//                               color: Colors.white,
//                               size: 35,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   provider.menuTitleController,
//                   'Add Title',
//                   TextInputType.name,
//                   const Icon(
//                     Icons.add,
//                     color: Colors.tealAccent,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   provider.menuSubTitleController,
//                   'Add SubTitle',
//                   TextInputType.name,
//                   const Icon(
//                     Icons.add,
//                     color: Colors.tealAccent,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   provider.menuPriceController,
//                   'Add Price',
//                   TextInputType.name,
//                   const Icon(
//                     Icons.add,
//                     color: Colors.tealAccent,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       bool isValidate = upDateKey.currentState!.validate();
//                       if (isValidate) {
//                         // provider.createNewCategorys();
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(250, 57),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       primary: const Color(0xFF53E88B),
//                     ),
//                     child: const Text(
//                       'Create New Category',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       bool isValidate = upDateKey.currentState!.validate();
//                       if (isValidate) {
//                         // provider.getAllCategory();
//                         AppRouter.showCustomDialug('Sucsses');
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(250, 57),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       primary: const Color(0xFF53E88B),
//                     ),
//                     child: const Text(
//                       'Get Category',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
