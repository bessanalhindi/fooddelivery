import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/widget/show_modal_bottom_sheet_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMenuScreen extends StatelessWidget {
  PopularMenu popularMenu;

  DetailMenuScreen({required this.popularMenu});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
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
                    popularMenu.image!,
                    // provider.detailsRestaurantsList!.first.imageMenu!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 413,
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
                                        provider.isFavorite(popularMenu);
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.red.shade100,
                                        child: popularMenu.isFavorite!
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
                                  popularMenu.title!,
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
                                          "${popularMenu.price!}\$",
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
                                  popularMenu.description!,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
//   Future buildShowModalBottomSheet(
//       BuildContext context, FoodProvider provider) {
//     return showModalBottomSheet(
//         elevation: 1,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//           top: Radius.circular(32),
//         )),
//         backgroundColor: Colors.white,
//         context: context,
//         builder: (context) {
//           return ShowModalBottomSheetWidget(
//             popularMenu: popularMenu,
//           );
//         });
//   }
// }
/**Scaffold(
    body: Stack(
    children: [
    SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Image.network(
    popularMenu.image!,
    fit: BoxFit.cover,
    ),
    ),
    Positioned(
    bottom: 10,
    left: 20,
    right: 20,
    child: ElevatedButton(
    onPressed: () async {
    buildShowModalBottomSheet(context, provider);
    },
    style: ElevatedButton.styleFrom(
    minimumSize: const Size(180, 70),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    primary: const Color(0xFF8BE8B6),
    ),
    child: Text(popularMenu.title!),
    ),
    ),
    ],
    ))*/
