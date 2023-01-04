import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/admin/screens/add_new_restaurant.dart';
import 'package:fooddelivery/admin/widget/restaurantall_widget.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class RestaurantAllScreen extends StatelessWidget {
  const RestaurantAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            widget_textAndimage_in_screens('Add New Restaurant'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent),
              child: Row(
                children: [
                  Text("Add New Restaurants"),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        AppRouter.goToScreen(AddNewRestaurants());
                      },
                      icon: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: Provider.of<AdminProvider>(context)
                    .restaurantAllList!
                    .length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return RestaurantAllWidget(
                    Provider.of<AdminProvider>(context)
                        .restaurantAllList![index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
