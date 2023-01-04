import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/admin/screens/add_new_Details_Restaurant.dart';
import 'package:fooddelivery/admin/screens/add_new_menu.dart';
import 'package:fooddelivery/admin/screens/add_new_restaurant.dart';
import 'package:fooddelivery/admin/screens/restaurantAll_screen.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/widget/testimonials_widget.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, widget) {
        return ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/image/backgroundimage.png',
                  fit: BoxFit.cover,
                  color: Colors.grey.shade800,
                ),
                Positioned(
                  top: 140,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BentonSans',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 70,
              width: 380,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      'images/imagesicons/cutlery.png',
                      fit: BoxFit.cover,
                      color: const Color(0xFF8BE8B6),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Add Restaurant',
                    style: TextStyle(
                        color: Color(0xFF09051C),
                        fontSize: 15,
                        fontFamily: 'BentonSans1',
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      AppRouter.goToScreen(RestaurantAllScreen());
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF53E88B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 70,
              width: 380,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      'images/imagesicons/menu.png',
                      fit: BoxFit.cover,
                      color: const Color(0xFF8BE8B6),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Add Menu',
                    style: TextStyle(
                        color: Color(0xFF09051C),
                        fontSize: 15,
                        fontFamily: 'BentonSans1',
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      AppRouter.goToScreen(AddNewMenu());
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF53E88B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
