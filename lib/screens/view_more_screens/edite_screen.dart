import 'package:flutter/material.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/widget/custom_textfield.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class EditeScreen extends StatelessWidget {
  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: Consumer<AuthProvider>(
        builder: (context, provider, widget) {
          return Form(
            key: fromKey,
            child: ListView(
              children: [
                widget_textAndimage_in_screens('Edite Profile'),
                Stack(
                  children: [
                    Center(
                      child: Provider.of<AuthProvider>(context, listen: false)
                                  .loggedUserData!
                                  .imageUrl !=
                              null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                // Provider.of<AuthProvider>(context, listen: false).loggedUserData!.imageUrl!
                                provider.loggedUserData!.imageUrl!,
                              ),
                            )
                          : CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.grey,
                            ),
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
                              provider.updateUserImage();
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
                  provider.profileUserFNameController,
                  'First Name',
                  TextInputType.name,
                  const Icon(
                    Icons.person,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.profileUserLNameController,
                  'Last Name',
                  TextInputType.name,
                  const Icon(
                    Icons.person_outline,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.profileUserPhoneController,
                  'Phone Number',
                  TextInputType.phone,
                  const Icon(
                    Icons.phone,
                    color: Colors.tealAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  provider.profileUserAddressController,
                  'Address',
                  TextInputType.text,
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
                      bool isValidate = fromKey.currentState!.validate();
                      if (isValidate) {
                        provider.updateUserInfo2();
                        AppRouter.goPopScreen();
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
                      'Update Save',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
