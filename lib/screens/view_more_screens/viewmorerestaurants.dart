import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/admin/widget/restaurantall_widget.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/widget/restaurantwidget.dart';
import 'package:provider/provider.dart';

class ViewMoreRestaurant extends StatelessWidget {
  const ViewMoreRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      appBar: AppBar(),
      body: SizedBox(
        height: 1000,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<FoodProvider>(builder: (context, provider, widget) {
            return GridView.builder(
              itemCount:  Provider.of<AdminProvider>(context).restaurantAllList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return RestaurantAllWidget(
                  Provider
                      .of<AdminProvider>(context)
                      .restaurantAllList![index],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
