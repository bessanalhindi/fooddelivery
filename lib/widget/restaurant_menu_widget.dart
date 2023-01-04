import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/detail_restaurant_model.dart';

class RestaurantMenuWidget extends StatelessWidget {
  MenuRestaurant menuRestaurant;

  RestaurantMenuWidget(this.menuRestaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
              child: Image.asset(
                menuRestaurant.imageMenu!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              menuRestaurant.nameMenu!,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'BentonSans',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              menuRestaurant.priceMenu!,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
