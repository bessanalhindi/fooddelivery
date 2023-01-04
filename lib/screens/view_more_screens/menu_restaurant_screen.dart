import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';
import 'package:fooddelivery/admin/models/restaurant_details_model.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:provider/provider.dart';

class MenuRestaurantScreens extends StatelessWidget {
  RestaurantDetails restaurantDetails;

  MenuRestaurantScreens(this.restaurantDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, widget) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    restaurantDetails.imageMenu!,
                    // provider.detailsRestaurantsList!.first.imageMenu!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 415,
                    height: 610,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 100,
                              height: 3,
                              color: Colors.black26,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(100, 40),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        primary: Colors.greenAccent.shade100,
                                      ),
                                      child: const Text(
                                        'Popular',
                                        style: TextStyle(
                                          color: Color(0xFF15BE77),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        provider
                                            .isFavoriteMenu(restaurantDetails);
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.red.shade100,
                                        child: restaurantDetails.isFavorite
                                            ? const Icon(Icons.favorite,
                                                color: Color(0xFFFF1D1D))
                                            : const Icon(
                                                Icons.favorite_outline,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  restaurantDetails.nameMenu!,
                                  // provider.detailsRestaurantsList!.first.nameMenu!,
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontFamily: 'BentonSans',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.star_half,
                                          color: Color(0xFF53E88B),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '4,8 Rating',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Color(0xFF53E88B),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '2000+ Order',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 400,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.greenAccent.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Price",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${restaurantDetails.priceMenu!}\$",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    color: Color(0xFF09051C),
                                    fontSize: 18,
                                    fontFamily: 'BentonSans',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  restaurantDetails.descriptionMenu!,
                                  style: TextStyle(
                                    color: Color(0xFF09051C),
                                    fontSize: 15,
                                    fontFamily: 'BentonSans1',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () async {
                      Provider.of<AdminProvider>(context, listen: false)
                          .addToCarts(
                              Provider.of<AuthProvider>(context, listen: false)
                                  .loggedUserData!,
                              restaurantDetails);

                      Provider.of<AdminProvider>(context, listen: false)
                          .getAllCert(
                              Provider.of<AuthProvider>(context, listen: false)
                                  .loggedUserData!);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(180, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: const Color(0xFF8BE8B6)),
                    child: const Text(
                      'Add To Chart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Stack(
    //   children: [
    //     Container(
    //       height: 250,
    //       width: double.infinity,
    //       color: Colors.black,
    //     ),
    //     Positioned(
    //       top: 500,
    //       bottom: 0,
    //       child: Container(
    //         width: double.infinity,
    //         height: 1000,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(20),
    //               topLeft: Radius.circular(20),
    //             ),
    //             color: Colors.red),
    //       ),
    //     ),
    //   ],
    // );
  }
}
