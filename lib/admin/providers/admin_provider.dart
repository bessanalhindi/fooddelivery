import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';
import 'package:fooddelivery/firebase/fb_fire_storage_controller.dart';
import 'package:fooddelivery/firebase/fb_fire_store_controller.dart';
import 'package:fooddelivery/model/user_data.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    getAllRestaurants();
    getAllMenu();
    // getAllDetailsRestaurant(restId);
  }

  TextEditingController menuTitleController = TextEditingController();
  TextEditingController menuSubTitleController = TextEditingController();
  TextEditingController menuPriceController = TextEditingController();
  TextEditingController menuDescriptionController = TextEditingController();
  TextEditingController restNameController = TextEditingController();
  TextEditingController restTimeController = TextEditingController();
  TextEditingController restDescriptionController = TextEditingController();
  TextEditingController restNameRestaurantController = TextEditingController();

  TextEditingController restNameMenuController = TextEditingController();
  TextEditingController restPriceMenuController = TextEditingController();
  TextEditingController restDescriptionMenuController = TextEditingController();

  TextEditingController restphoneNumberController = TextEditingController();

  ////admin process
  File? pickImageRestaurantLogo;
  File? pickImageRestaurant;
  File? pickImageMenuPopularRestaurant;
  File? pickImageMenuRestaurant;
  List<PopularMenu>? popularMenuList;
  List<RestaurantAll>? restaurantAllList;
  List<RestaurantDetails>? detailsRestaurantsList;
  List<RestaurantDetails>? carts;
  List shopping = [];

  Addcounter(RestaurantDetails restaurantDetails) {
    restaurantDetails.number++;
    notifyListeners();
  }

  Removecounter(RestaurantDetails restaurantDetails) {
    restaurantDetails.number--;
    notifyListeners();
  }

  pickimageRestaurantLogo() async {
    XFile? xfileRestaurantLogo =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfileRestaurantLogo != null) {
      pickImageRestaurantLogo = File(xfileRestaurantLogo.path);
      notifyListeners();
    }
  }

  pickimageRestaurant() async {
    XFile? xfileimageRestaurant =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfileimageRestaurant != null) {
      pickImageRestaurant = File(xfileimageRestaurant.path);
      notifyListeners();
    }
  }

  pickimageMenuPopularRestaurant() async {
    XFile? xfileMenuPopular =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfileMenuPopular != null) {
      pickImageMenuPopularRestaurant = File(xfileMenuPopular.path);
      notifyListeners();
    }
  }

  pickimageMenuRestaurant() async {
    XFile? xfileMenuRestaurant =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfileMenuRestaurant != null) {
      pickImageMenuRestaurant = File(xfileMenuRestaurant.path);
      notifyListeners();
    }
  }

  createNewMenu() async {
    if (pickImageMenuPopularRestaurant != null) {
      String imageUrl = await StorageController.storageController
          .uploadImage("menu_image", pickImageMenuPopularRestaurant!);
      PopularMenu popularMenu = PopularMenu(
        image: imageUrl,
        title: menuTitleController.text,
        subTitle: menuSubTitleController.text,
        price: menuPriceController.text,
        description: menuDescriptionController.text,
      );
      String id = await FbFireStoreController.fbFireStoreController
          .createNewMenu(popularMenu);
      popularMenu.id = id;
      popularMenuList!.add(popularMenu);
      pickImageMenuPopularRestaurant == null;
      menuTitleController.clear();
      menuSubTitleController.clear();
      menuPriceController.clear();
      menuDescriptionController.clear();
      notifyListeners();
    }
  }

  getAllMenu() async {
    popularMenuList =
        await FbFireStoreController.fbFireStoreController.getAllMenu();
    notifyListeners();
  }

  /***********************************************/
  createNewRestaurantAll() async {
    if (pickImageRestaurantLogo != null && pickImageRestaurant != null) {
      AppRouter.showLoaderDialog();
      // 2- upload image to firebase storage and get its url
      String imageUrl = await StorageController.storageController
          .uploadImage("Restaurant_Logo_images", pickImageRestaurantLogo!);
      String imageRestaurantUrl = await StorageController.storageController
          .uploadImage("Restaurant_image", pickImageRestaurant!);
      // 3- create category object from image url and textfield
      RestaurantAll restaurantAll = RestaurantAll(
        image: imageUrl,
        name: restNameController.text,
        time: restTimeController.text,
        imageRestaurantUrl: imageRestaurantUrl,
        description: restDescriptionController.text,
        phoneNumber: restphoneNumberController.text,
      );
      // 4- create new category document using category object
      String id = await FbFireStoreController.fbFireStoreController
          .createNewRestaurantAll(restaurantAll);
      restaurantAll.id = id;
      restaurantAllList!.add(restaurantAll);
      pickImageRestaurantLogo = null;
      pickImageRestaurant == null;
      restDescriptionController.clear();
      restNameController.clear();
      restTimeController.clear();
      restphoneNumberController.clear();
      AppRouter.hideLoadingDialoug();
      AppRouter.showCustomDiaoug('The category has been successfully added');
    }
  }

  getAllRestaurants() async {
    restaurantAllList =
        await FbFireStoreController.fbFireStoreController.getAllRestaurants();
    notifyListeners();
  }

/*************************************************************************/

  addNewRestaurantMenu(String restId) async {
    if (pickImageMenuRestaurant != null) {
      String imageMenuUrl = await StorageController.storageController
          .uploadImage("Restaurant_Menu_image", pickImageMenuRestaurant!);
      RestaurantDetails restaurant = RestaurantDetails(
        imageMenu: imageMenuUrl,
        nameMenu: restNameMenuController.text,
        priceMenu: restPriceMenuController.text,
        descriptionMenu: restDescriptionMenuController.text,
        id: restId,
      );
      String id = await FbFireStoreController.fbFireStoreController
          .addNewRestaurantDetails(restaurant);
      restaurant.id = id;
      detailsRestaurantsList?.add(restaurant);
      pickImageMenuRestaurant = null;
      restDescriptionMenuController.clear();
      restNameMenuController.clear();
      restPriceMenuController.clear();
      notifyListeners();
    }
  }

  getAllRestaurantDetails(String restId) async {
    detailsRestaurantsList = await FbFireStoreController.fbFireStoreController
        .getAllRestaurantDetails(restId);
    print(detailsRestaurantsList!.length);
    notifyListeners();
  }

  deleteRestaurant(RestaurantAll restaurantAll) async {
    await FbFireStoreController.fbFireStoreController
        .deleteRestaurant(restaurantAll.id!);
    restaurantAllList!.remove(restaurantAll);
    AppRouter.showCustomDialug('Done!');
    notifyListeners();
  }

/*****************************************************************/
  // addToCart(PopularMenu popularMenu) {
  //   popularMenu.isShopping = !popularMenu.isShopping!;
  //   shopping
  //       .add(popularMenuList!.where((element) => element.isShopping!).toList());
  //   notifyListeners();
  // }

  addToCarts(UserData userData, RestaurantDetails restaurantDetails) async {
    await FbFireStoreController.fbFireStoreController
        .addToCarts(userData, restaurantDetails);
    carts!.add(restaurantDetails);
    notifyListeners();
    AppRouter.hideLoadingDialoug();
    AppRouter.showCustomDialug("Successfully");
  }

  getAllCert(UserData userData) async {
    try {
      carts = await FbFireStoreController.fbFireStoreController
          .getAllCart(userData);
      print(carts!.length.toString());
      notifyListeners();
    } catch (e) {
      print("E:$e");
    }
  }

  deleteCart(UserData userData, RestaurantDetails restaurantDetails) async {
    await FbFireStoreController.fbFireStoreController
        .deleteCart(userData, restaurantDetails);
    carts!.remove(userData);
    AppRouter.showCustomDialug('Done!');
    notifyListeners();
    AppRouter.hideLoadingDialoug();
  }

  sumTotalPrice() {
    var sum = carts!
        .map((e) => int.parse(e.priceMenu.toString()))
        .reduce((value, element) => (value + element));
    var sum2 = carts!
        .map((e) => int.parse(e.number.toString()))
        .reduce((value, element) => value + element);
    var x = sum * sum2;
    return x.toString();
  }

  isFavoriteRestaurant(RestaurantAll restaurantAll) {
    restaurantAll.isFavorite = !restaurantAll.isFavorite!;
    notifyListeners();
  }

  isFavoriteMenu(RestaurantDetails restaurantDetails) {
    restaurantDetails.isFavorite = !restaurantDetails.isFavorite;
    notifyListeners();
  }
}
