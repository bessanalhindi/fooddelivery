import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/nav_bar_screens/home_screen.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class AddNewMenu extends StatelessWidget {
  AddNewMenu({Key? key}) : super(key: key);
  GlobalKey<FormState> menukey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: Consumer<AdminProvider>(
        builder: (context, provider, widget) {
          return Form(
            key: menukey,
            child: ListView(
              children: [
                widget_textAndimage_in_screens('Add New Menu'),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: provider.pickImageMenuPopularRestaurant == null
                            ? Container(
                                height: 150,
                                width: 150,
                                color: Colors.grey,
                              )
                            : Image.file(provider.pickImageMenuPopularRestaurant!),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Positioned(
                      top: 40,
                      left: 250,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.tealAccent),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              provider.pickimageMenuPopularRestaurant();
                            },
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  provider.menuTitleController,
                  'Add Title',
                  TextInputType.name,
                  const Icon(
                    Icons.add,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.menuSubTitleController,
                  'Add SubTitle',
                  TextInputType.name,
                  const Icon(
                    Icons.add,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.menuDescriptionController,
                  'Add Description',
                  TextInputType.name,
                  const Icon(
                    Icons.add,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.menuPriceController,
                  'Add Price',
                  TextInputType.name,
                  const Icon(
                    Icons.add,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      bool isValidate = menukey.currentState!.validate();
                      if (isValidate) {
                        provider.createNewMenu();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(250, 57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: const Color(0xFF53E88B),
                    ),
                    child: const Text(
                      'Create New Menu',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       bool isValidate = menukey.currentState!.validate();
                //       if (isValidate) {
                //         provider.getAllMenu();
                //         AppRouter.showSnackBar(message: 'done successfully');
                //         AppRouter.goPopScreen();
                //       }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       minimumSize: const Size(250, 57),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       primary: const Color(0xFF53E88B),
                //     ),
                //     child: const Text(
                //       'Get Menu',
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
