import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/model/menu.dart';

class FavoriteMenuRestaurantWidget extends StatelessWidget {
  RestaurantDetails restaurantDetails;

  FavoriteMenuRestaurantWidget(
    this.restaurantDetails, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(restaurantDetails.imageMenu!),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              restaurantDetails.nameMenu!,
              style: const TextStyle(
                color: Color(0xFF09051C),
                fontSize: 14,
                fontFamily: 'BentonSans',
              ),
            ),
          ),
          subtitle: Text(
            "${restaurantDetails.priceMenu!}\$",
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'BentonSans1',
                color: Color(0xFF8BE8B6)),
          ),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(80, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: const Color(0xFF53E88B),
            ),
            child: const Text('Buy Again'),
          )),
    );
  }
}
