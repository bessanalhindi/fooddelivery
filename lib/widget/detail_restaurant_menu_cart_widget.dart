import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class OrderCatrsDetailsWidget extends StatelessWidget {
  RestaurantDetails restaurantDetails;

  OrderCatrsDetailsWidget(
    this.restaurantDetails, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AdminProvider, AuthProvider>(
      builder: (context, provider, provider2, widget) {
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
                            color: const Color(0xFF8BE8B6)),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          // provider.delete(popularMenu);
                          provider.deleteCart(
                              provider2.loggedUserData!, restaurantDetails);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFF8BE8B6),
                          size: 25,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Provider.of<AdminProvider>(context, listen: false)
                                  .Removecounter(restaurantDetails);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFFD7EFE2),
                              foregroundColor: Color(0xFF66DBA2),
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Spacer(),
                          Text(
                            "${restaurantDetails.number.toString()}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          // Spacer(),
                          SizedBox(
                            width: 5,
                          ),

                          InkWell(
                            onTap: () {
                              Provider.of<AdminProvider>(context, listen: false)
                                  .Addcounter(restaurantDetails);
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFF66DBA2),
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.add,
                                // color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
