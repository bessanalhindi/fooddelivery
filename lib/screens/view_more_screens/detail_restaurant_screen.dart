import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/view_more_screens/menu_restaurant_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailResturantScreen extends StatelessWidget {
  RestaurantAll restaurant;

  DetailResturantScreen(this.restaurant, {Key? key}) : super(key: key);

  Future<void> _launchWhatsapp() async {
    var url =
        "whatsapp://send?text=Hello World!&phone=${restaurant.phoneNumber!}";
    await launchUrl(Uri.parse(url));
  }

  Future<void> _launchCall() async {
    // final number = restaurant.phoneNumber!;
    // await FlutterPhoneDirectCaller.callNumber(number);
    var smsUrl = Uri.parse("tel:${restaurant.phoneNumber!}");
    if (await canLaunchUrl(smsUrl)) {
      await launchUrl(smsUrl);
    } else {
      AppRouter.showCustomDialug("The number Null");
    }
  }

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
                  child: restaurant.imageRestaurantUrl != null
                      ? Image.network(
                          restaurant.imageRestaurantUrl!,
                          fit: BoxFit.cover,
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 415,
                    height: 580,
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
                                        _launchCall();
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Colors.greenAccent.shade100,
                                        child: const Icon(
                                          Icons.call,
                                          color: Color(0xFF15BE77),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchWhatsapp();
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Colors.greenAccent.shade100,
                                        child: const Icon(
                                          Icons.whatsapp,
                                          color: Color(0xFF15BE77),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider
                                            .isFavoriteRestaurant(restaurant);
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.red.shade100,
                                        child: restaurant.isFavorite!
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
                                  restaurant.name!,
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
                                  child: Text(
                                    restaurant.description!,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Menu',
                                  style: TextStyle(
                                    color: Color(0xFF09051C),
                                    fontSize: 18,
                                    fontFamily: 'BentonSans',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 1000,
                                  child: provider.detailsRestaurantsList != null
                                      ? provider.detailsRestaurantsList!.isEmpty
                                          ? const Center(
                                              child: const Text('No found'),
                                            )
                                          : GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: provider
                                                  .detailsRestaurantsList!
                                                  .length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 200,
                                              ),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    AppRouter.goToScreen(
                                                        MenuRestaurantScreens(
                                                            provider.detailsRestaurantsList![
                                                                index]));
                                                  },
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                    width: 140,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                      color: Colors.white,
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          provider
                                                              .detailsRestaurantsList![
                                                                  index]
                                                              .imageMenu!,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              2, 2),
                                                          color: Colors
                                                              .grey.shade400,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 3),
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10),
                                                          width: 120,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: Colors.white,
                                                          ),
                                                          child: Center(
                                                            child: Column(
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    provider
                                                                        .detailsRestaurantsList![
                                                                            index]
                                                                        .nameMenu!,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'BentonSans',
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "${provider.detailsRestaurantsList![index].priceMenu!}\$",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade700),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                      : const Center(
                                          child:
                                              const CircularProgressIndicator()),
                                ),
                              ],
                            ),
                          ),
                        ],
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
