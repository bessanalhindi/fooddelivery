import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/view_more_screens/detail_restaurant_screen.dart';
import 'package:provider/provider.dart';

class RestaurantWidget extends StatelessWidget {
  RestaurantAll restaurantAll;

  RestaurantWidget(this.restaurantAll, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<AdminProvider>(context,listen: false).getAllRestaurantDetails(restaurantAll.id!);
        AppRouter.goToScreen(DetailResturantScreen(restaurantAll));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 140,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(2, 2),
              color: Colors.grey.shade400,
            ),
          ],
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
              child: Image.network(
                restaurantAll.image!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              restaurantAll.name!,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'BentonSans',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              restaurantAll.time!,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
