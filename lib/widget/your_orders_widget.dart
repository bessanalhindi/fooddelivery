import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class YourOrdersWidget extends StatelessWidget {
  YourOrdersWidget(this.restaurantDetails, {Key? key}) : super(key: key);
  RestaurantDetails restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, widget) {
        return Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(restaurantDetails.imageMenu!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${restaurantDetails.priceMenu!}\$",
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'BentonSans1',
                            color: Color(0xFF8BE8B6)),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: const Color(0xFF53E88B),
                  ),
                  child: const Text('Proccess'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
