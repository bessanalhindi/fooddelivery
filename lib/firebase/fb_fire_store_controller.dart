import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/models/detail_restaurant_model.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';
import 'package:fooddelivery/model/user_data.dart';
import 'package:fooddelivery/routers/app_router.dart';

class FbFireStoreController {
  FbFireStoreController._();

  static FbFireStoreController fbFireStoreController =
      FbFireStoreController._();
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  //جبنا انستنس من الفيراستور

  createNewUser(UserData userData) async {
    await _instance.collection("Users").doc(userData.id).set(userData.toMap());
  }

  Future<UserData> getUserFromFireStore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await _instance.collection("Users").doc(id).get();
    Map<String, dynamic>? data = document.data();
    UserData userData = UserData.fromMap(data!);
    print("this is data user$data");
    return userData;
  }

  updateUserInfo(UserData userData) async {
    await _instance
        .collection("Users")
        .doc(userData.id)
        .update(userData.toMap());
  }

////admin Functions
  createNewMenu(PopularMenu popularMenu) async {
    DocumentReference<Map<String, dynamic>> document =
        await _instance.collection('popularMenu').add(popularMenu.toMap());
    return document.id;
  }

  Future<List<PopularMenu>> getAllMenu() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _instance.collection('popularMenu').get();
    List<PopularMenu> popularMenu = querySnapshot.docs.map((docs) {
      PopularMenu popularMenu = PopularMenu.fromMap(docs.data());
      popularMenu.id = docs.id;
      return popularMenu;
    }).toList();
    print(popularMenu.length.toString());
    return popularMenu;
  }

  Future<String> createNewRestaurantAll(RestaurantAll restaurantAll) async {
    DocumentReference<Map<String, dynamic>> document =
        await _instance.collection('restaurantAll').add(restaurantAll.toMap());
    return document.id;
  }

  Future<List<RestaurantAll>> getAllRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _instance.collection('restaurantAll').get();
    List<RestaurantAll> restaurantAll = querySnapshot.docs.map((docs) {
      RestaurantAll restaurantAll = RestaurantAll.fromMap(docs.data());
      restaurantAll.id = docs.id;
      return restaurantAll;
    }).toList();
    return restaurantAll;
  }

  deleteRestaurant(String id) async {
    await _instance.collection('restaurantAll').doc(id).delete();
  }

//addnewdetailsrestaurant
  Future<String> addNewRestaurantDetails(
      RestaurantDetails restaurantDetails) async {
    DocumentReference<Map<String, dynamic>> documentReference = await _instance
        .collection('restaurantAll')
        .doc(restaurantDetails.id)
        .collection('RestaurantDetails')
        .add(restaurantDetails.toMap());
    return documentReference.id;
  }

  Future<List<RestaurantDetails>> getAllRestaurantDetails(String restId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _instance
        .collection('restaurantAll')
        .doc(restId)
        .collection('RestaurantDetails')
        .get();
    return querySnapshot.docs.map((e) {
      RestaurantDetails restaurantDetails = RestaurantDetails.fromMap(e.data());
      restaurantDetails.id = e.id;
      return restaurantDetails;
    }).toList();
  }

    addToCarts(
      UserData userData, RestaurantDetails restaurantDetails) async {
         await _instance
        .collection("Users")
        .doc(userData.id)
        .collection('carts')
        .doc(restaurantDetails.id).set(restaurantDetails.toMap());

  }

  Future<List<RestaurantDetails>?> getAllCart(UserData userData) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _instance
          .collection("Users")
          .doc(userData.id)
          .collection("carts")
          .get();
      List<RestaurantDetails> list = [];
      list = querySnapshot.docs
          .map((e) {
            RestaurantDetails restaurantDetails =
                RestaurantDetails.fromMap(e.data());
            return restaurantDetails;
          }).toList();
      return list;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  deleteCart(UserData userData, RestaurantDetails restaurantDetails) async {
    await _instance
        .collection("Users")
        .doc(userData.id)
        .collection("carts")
        .doc(restaurantDetails.id)
        .delete();
    print('id ${restaurantDetails.id}');
    print('id ${userData.id}');
   // AppRouter.hideLoadingDialoug();

  }
// Future<List<Categorys>> getAllCategoris() {}

// Future<bool> createNewUser({required UserData userData}) async {
//   return await _instance
//       .collection('UserData')
//       .add((userData.toMap()))
//       .then((DocumentReference value) => true)
//       .catchError((error) => false);
//   // ضفنا الداتا على كولكشن زي كانها جدول
// }
}
