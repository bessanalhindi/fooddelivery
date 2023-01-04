import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/widget/favorite_menu_resturant_widget.dart';
import 'package:fooddelivery/widget/favorite_popular_menu_widget.dart';
import 'package:fooddelivery/widget/favorite_restaurant_widget.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFDFF),
        body: ListView(
          children: [
            widget_textAndimage_in_screens('Favorite'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Favorite Restaurant",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BentonSans1',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child:
                  Provider.of<AdminProvider>(context).restaurantAllList! != null
                      ? ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),

                          itemCount: Provider.of<AdminProvider>(context)
                              .restaurantAllList!
                              .where((element) => element.isFavorite!)
                              .length,
                          itemBuilder: (context, index) {
                            return FavoriteRestaurantWidget(
                                Provider.of<AdminProvider>(context)
                                    .restaurantAllList!
                                    .where((element) => element.isFavorite!)
                                    .toList()[index]);
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Favorite Menu Restaurant",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BentonSans1',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child:
                  Provider.of<AdminProvider>(context).detailsRestaurantsList! ==
                          null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: Provider.of<AdminProvider>(context)
                        .detailsRestaurantsList!
                        .where((element) => element.isFavorite)
                        .length,
                    itemBuilder: (context, index) {
                      return FavoriteMenuRestaurantWidget(
                          Provider.of<AdminProvider>(context)
                              .detailsRestaurantsList!
                              .where((element) => element.isFavorite)
                              .toList()[index]);
                    },
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Favorite Popular Menu",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'BentonSans1',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child:
                  Provider.of<AdminProvider>(context).popularMenuList! != null
                      ? ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: Provider.of<AdminProvider>(context)
                              .popularMenuList!
                              .where((element) => element.isFavorite!)
                              .length,
                          itemBuilder: (context, index) {
                            return FavoritePopularMenuWidget(
                                Provider.of<AdminProvider>(context)
                                    .popularMenuList!
                                    .where((element) => element.isFavorite!)
                                    .toList()[index]);
                          },
                        )
                      : Center(child: CircularProgressIndicator()),
            ),
          ],
        ));
  }
}
