import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/screens/add_new_menu.dart';
import 'package:fooddelivery/firebase/fb_auth_controller.dart';
import 'package:fooddelivery/firebase/fb_fire_storage_controller.dart';
import 'package:fooddelivery/firebase/fb_fire_store_controller.dart';
import 'package:fooddelivery/model/fb_response.dart';
import 'package:fooddelivery/model/user_data.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/auth/sign_up_screen.dart';
import 'package:fooddelivery/screens/nav_bar_screens/main_screen.dart';
import 'package:fooddelivery/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    checkUser();
  }

  TextEditingController loginemailEditingController = TextEditingController();
  TextEditingController loginpasswordEditingControllerl =
      TextEditingController();
  TextEditingController registeremailEditingController =
      TextEditingController();
  TextEditingController registerpasswordEditingControllerl =
      TextEditingController();
  TextEditingController registerAdminEditingControllerl =
      TextEditingController();
  TextEditingController imageUrlEditingController = TextEditingController();
  TextEditingController forgetemailEditingController = TextEditingController();
  TextEditingController firstnameEditingControllerl = TextEditingController();
  TextEditingController lastnameEditingControllerl = TextEditingController();
  TextEditingController phonenumberEditingControllerl = TextEditingController();
  TextEditingController addressEditingControllerl = TextEditingController();
  TextEditingController profileUserFNameController = TextEditingController();
  TextEditingController profileUserLNameController = TextEditingController();
  TextEditingController profileUserPhoneController = TextEditingController();
  TextEditingController profileUserAddressController = TextEditingController();

  late User loggedUser;

  UserData? loggedUserData;

  // late UserData loggedUserData;

  void perfoemlogin() {
    if (_checkData()) {
      login();
    }
  }

  bool _checkData() {
    if (loginemailEditingController.text.isNotEmpty &&
        loginpasswordEditingControllerl.text.isNotEmpty) {
      return true;
    }
    AppRouter.showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  void login() async {
    FireBaseAuthResponse fireBaseAuthResponse =
        await AuthController.authController.sinIn(
            email: loginemailEditingController.text,
            password: loginpasswordEditingControllerl.text);
    AppRouter.showSnackBar(
        message: fireBaseAuthResponse.message,
        error: !fireBaseAuthResponse.status);
    if (fireBaseAuthResponse.status) {
      print("Print The Id User ${fireBaseAuthResponse.id!}");
      getUserFromFireStore(fireBaseAuthResponse.id!);
      AppRouter.goAndReplaceScreen(const MainScreen());
    }
  }

  getUserFromFireStore(String id) async {
    loggedUserData = await FbFireStoreController.fbFireStoreController
        .getUserFromFireStore(id);
    loggedUserData!.id = id;
    profileUserFNameController.text = loggedUserData!.firstName ?? '';
    profileUserLNameController.text = loggedUserData!.lastName ?? '';
    profileUserPhoneController.text = loggedUserData!.phoneNumber ?? '';
    profileUserAddressController.text = loggedUserData!.address ?? '';
    notifyListeners();
  }

  void perfoemregister() {
    if (_checkDataRegister()) {
      register();
    }
  }

  bool _checkDataRegister() {
    if (registeremailEditingController.text.isNotEmpty &&
        registerpasswordEditingControllerl.text.isNotEmpty) {
      return true;
    }
    AppRouter.showSnackBar(message: 'Enter required data!', error: true);

    return false;
  }

  void register() async {
    FireBaseAuthResponse fireBaseAuthResponse =
        await AuthController.authController.createAccount(
            email: registeremailEditingController.text,
            password: registerpasswordEditingControllerl.text);
    AppRouter.showSnackBar(
        message: fireBaseAuthResponse.message,
        error: !fireBaseAuthResponse.status);
    if (fireBaseAuthResponse.status) {
      getUserFromAuth();
      UserData userData = UserData(
        loggedUser.uid,
        firstnameEditingControllerl.text,
        lastnameEditingControllerl.text,
        loggedUser.email,
        phonenumberEditingControllerl.text,
        addressEditingControllerl.text,
        registerAdminEditingControllerl.hasListeners,
      );
      FbFireStoreController.fbFireStoreController.createNewUser(userData);
      AppRouter.goPopScreen();
    }
  }

  getUserFromAuth() {
    loggedUser = AuthController.authController.checkUser()!;
  }

  Future<void> performForgetPassword() async {
    if (checkDataForgetPassword()) {
      _forgetPassword();
    }
  }

  bool checkDataForgetPassword() {
    if (forgetemailEditingController.text.isNotEmpty) {
      return true;
    }
    AppRouter.showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _forgetPassword() async {
    FireBaseAuthResponse fireBaseAuthResponse =
        await AuthController.authController.forgetPassword(
      email: forgetemailEditingController.text,
    );
    AppRouter.showSnackBar(
        message: fireBaseAuthResponse.message,
        error: !fireBaseAuthResponse.status);
    if (fireBaseAuthResponse.status) {
      AppRouter.goPopScreen();
    }
  }

  checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    AppRouter.goAndReplaceScreen(OnBoardingScreen());
  }

  updateUserImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String imageUrl = await StorageController.storageController
          .uploadImage("/profile_image", file);
      loggedUserData!.imageUrl = imageUrl;
      FbFireStoreController.fbFireStoreController
          .updateUserInfo(loggedUserData!);
      getUserFromFireStore(loggedUserData!.id!);
    }
  }

  updateUserInfo2() async {
    loggedUserData!.firstName = profileUserFNameController.text;
    loggedUserData!.lastName = profileUserLNameController.text;
    loggedUserData!.phoneNumber = profileUserPhoneController.text;
    loggedUserData!.address = profileUserAddressController.text;
    FbFireStoreController.fbFireStoreController.updateUserInfo(loggedUserData!);
    getUserFromFireStore(loggedUserData!.id!);
  }
}
