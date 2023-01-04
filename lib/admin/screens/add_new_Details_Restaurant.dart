import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/detail_restaurant_model.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class AddNewDetailsRestaurant extends StatelessWidget {
  String restId;

  AddNewDetailsRestaurant(this.restId, {Key? key}) : super(key: key);
  GlobalKey<FormState> restDetails = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: Consumer<AdminProvider>(
        builder: (context, provider, widget) {
          return Form(
            key: restDetails,
            child: ListView(
              children: [
                widget_textAndimage_in_screens('Add Details Restaurant'),
                CustomTextField(
                  provider.restNameMenuController,
                  'Add The name Menu',
                  TextInputType.name,
                  const Icon(
                    Icons.add,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.restPriceMenuController,
                  'Add The Price',
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
                  provider.restDescriptionMenuController,
                  'Add The description',
                  TextInputType.name,
                  const Icon(
                    Icons.add,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text("Add Menu Image"),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: provider.pickImageMenuRestaurant == null
                                ? Container(
                                    height: 150,
                                    width: 150,
                                    color: Colors.grey,
                                  )
                                : Image.file(provider.pickImageMenuRestaurant!),
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
                              provider.pickimageMenuRestaurant();
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
                  height: 10,
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      bool isValidate = restDetails.currentState!.validate();
                      if (isValidate) {
                        provider.addNewRestaurantMenu(restId);
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
                      'Add New Details Restaurant',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       bool isValidate = restDetails.currentState!.validate();
                //       if (isValidate) {
                //         provider.getAllRestaurantDetails(restId);
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
                //       'get Details Restaurant',
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
