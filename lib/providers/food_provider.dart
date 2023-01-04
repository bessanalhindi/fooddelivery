import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';

import 'package:fooddelivery/model/menu.dart';
import 'package:fooddelivery/model/notifications.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/model/voucher_model.dart';
import 'package:fooddelivery/routers/app_router.dart';

class FoodProvider extends ChangeNotifier {
  List<String> search = [];
  TextEditingController searchTextController = TextEditingController();

  // List<Restaurant> dataRestaurant = [
  //   Restaurant('images/image/Restaurant1.png', 'Vegan Resto', '6 Min\'s'),
  //   Restaurant('images/image/Restaurant2.png', 'Healthy Food', '10 Min\'s'),
  //   Restaurant('images/image/Restaurant3.png', 'Good Food', '5 Min\'s'),
  //   Restaurant('images/image/Restaurant4.png', 'Smart Resto', '8 Min\'s'),
  //   Restaurant('images/image/Restaurant5.png', 'Vegan Resto', '10 Min\'s'),
  //   Restaurant('images/image/Restaurant6.png', 'Healthy Food', '12 Min\'s'),
  // ];

  // List<Menu> dataMenu = [
  //   Menu('images/image/HerbalPancakeimage.jpg', 'Herbal Pancake',
  //       'Warung Herbal', '\$7'),
  //   Menu('images/image/FruitSaladImage.jpg', 'Fruit Salad', 'Wijie Resto',
  //       '\$5'),
  //   Menu('images/image/hamburgerImage.jpg', 'Hamburger', 'Noodle Home', '\$15'),
  // ];
  List<Notifications> notification = [
    Notifications(
        image: "images/imagesicons/n1.png",
        title: 'Your order has been taken by the driver',
        time: 'Recently'),
    Notifications(
        image: "images/imagesicons/n2.png",
        title: 'Topup for \$100 was successful',
        time: '10.00 Am'),
    Notifications(
        image: "images/imagesicons/n3.png",
        title: 'Your order has been canceled',
        time: '22 Juny 2022'),
  ];
  List<Voucher> voucherData = [
    Voucher('Special Deal For\nOctober', 'images/image/Icecreamimage.png'),
    Voucher('Special Deal For\nOctober', 'images/image/VoucherImage1.png'),
    Voucher('Special Deal For\nOctober', 'images/image/VoucherImage2.png'),
  ];

  void perfomSaveSearch() {
    if (checkData()) {
      saveSearch();
      notifyListeners();
    }
  }

  bool checkData() {
    if (searchTextController.text.isNotEmpty) {
      return true;
    }
    AppRouter.showSnackBar(message: 'Enter Search data!', error: true);
    return false;
  }

  void saveSearch() {
    if (search.length < 5) {
      search.add(searchTextController.text);
      clearSearch();
    } else {
      AppRouter.showSnackBar(message: 'Limit reached', error: true);
    }
  }

  void clearSearch() {
    searchTextController.text = '';
  }

  isFavorite(PopularMenu popularMenu) {
    popularMenu.isFavorite = !popularMenu.isFavorite!;
    notifyListeners();
  }

// checkUser<StreamSubscription>() {
//   Future.delayed(const Duration(seconds: 2), () {
//     AuthController.authController.checkUserStatus(({required bool loggedIn}) {
//       String route = loggedIn
//           ? AppRouter.goAndReplaceScreen(const MainScreen())
//           : AppRouter.goAndReplaceScreen(const SignUpScreen());
//       AppRouter.goAndNamedScreen(route, '');
//     });
//   });
// }

}
