import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/nav_bar_screens/home_screen.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class AddNewRestaurants extends StatelessWidget {
  AddNewRestaurants({Key? key}) : super(key: key);
  GlobalKey<FormState> restkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: Consumer<AdminProvider>(
        builder: (context, provider, widget) {
          return Form(
            key: restkey,
            child: ListView(
              children: [
                widget_textAndimage_in_screens('Add New Restaurant'),
                Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text("Add Restaurant Logo"),
                          Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: provider.pickImageRestaurantLogo == null
                                  ? Container(
                                      height: 150,
                                      width: 150,
                                      color: Colors.grey,
                                    )
                                  : Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.file(
                                        provider.pickImageRestaurantLogo!,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                        ],
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
                              provider.pickimageRestaurantLogo();
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
                  provider.restNameController,
                  'Add Name Restaurant',
                  TextInputType.name,
                  const Icon(
                    Icons.drive_file_rename_outline_sharp,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.restTimeController,
                  'Add Times',
                  TextInputType.name,
                  const Icon(
                    Icons.access_time,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text("Add Restaurant"),
                          Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: provider.pickImageRestaurant == null
                                  ? Container(
                                      height: 150,
                                      width: 150,
                                      color: Colors.grey,
                                    )
                                  : Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.file(
                                        provider.pickImageRestaurant!,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                        ],
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
                              provider.pickimageRestaurant();
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
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.restDescriptionController,
                  'Add Description',
                  TextInputType.name,
                  const Icon(
                    Icons.description,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.restphoneNumberController,
                  'Add phoneNumber',
                  TextInputType.name,
                  const Icon(
                    Icons.phone,
                    color: Colors.tealAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      bool isValidate = restkey.currentState!.validate();
                      if (isValidate) {
                        provider.createNewRestaurantAll();
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
                      'Create New Restaurant',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       bool isValidate = restkey.currentState!.validate();
                //       if (isValidate) {
                //         provider.getAllRestaurants();
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
                //       'Get Restaurant',
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

/**       Stack(
    children: [
    Center(
    child: Column(
    children: [
    Text("Add Restaurant Image"),
    Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    ),
    child: provider.pickImage1 == null
    ? Container(
    height: 150,
    width: 150,
    color: Colors.grey,
    )
    : Image.file(provider.pickImage1!),
    ),
    ],
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
    provider.pickRestaurantImage();
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
    SizedBox(
    height: 10,
    ),
    CustomTextField(
    provider.restDescriptionController,
    'Add Description',
    TextInputType.name,
    const Icon(
    Icons.add,
    color: Colors.tealAccent,
    ),
    ),
    SizedBox(
    height: 10,
    ),*/
