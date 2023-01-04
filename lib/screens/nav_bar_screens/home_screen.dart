import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/admin/widget/restaurantall_widget.dart';
import 'package:fooddelivery/firebase/fb_auth_controller.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/auth/sign_up_screen.dart';
import 'package:fooddelivery/screens/view_more_screens/filters.dart';
import 'package:fooddelivery/screens/view_more_screens/notification.dart';
import 'package:fooddelivery/screens/view_more_screens/search_screen.dart';
import 'package:fooddelivery/screens/view_more_screens/voucher_screen.dart';
import 'package:fooddelivery/widget/menuwidget.dart';
import 'package:fooddelivery/widget/restaurantwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  String name = "";

  // int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
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
                  top: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Text(
                          'Find Your\nFavorite Food',
                          style: TextStyle(
                            fontSize: 31,
                            fontFamily: 'BentonSans',
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFFAFDFF),
                              boxShadow: const [
                                // BoxShadow(color: Colors.black54),
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.grey,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.notifications,
                                color: Color(0xFF53E88B),
                                size: 30,
                              ),
                              onPressed: () async {
                                // await AuthController.authController
                                //     .signOut();
                                // AppRouter.goToScreen(
                                //     const SignUpScreen());
                                AppRouter.goToScreen(
                                    const NotificationScreen());
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        AppRouter.goAndReplaceScreen(SearchScreen());
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFEF6ED),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // provider.perfomSaveSearch();
                              },
                              icon: const Icon(Icons.search,
                                  color: Color(0xFFDA6317), size: 35),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'What do you want to order?',
                              style: TextStyle(
                                color: Color(0xFFDA6317),
                                fontSize: 14,
                                fontFamily: 'BentonSans1',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /**TextField(
                      onChanged: (value) {
                      name = value;
                      },
                      controller: provider.searchTextController,
                      cursorColor: const Color(0xFFDA6317),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                      prefixIcon: IconButton(
                      onPressed: () {
                      provider.perfomSaveSearch();
                      },
                      icon: const Icon(Icons.search,
                      color: Color(0xFFDA6317), size: 35),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFEF6ED),
                      hintText: 'What do you want to order?',
                      hintStyle: const TextStyle(
                      color: Color(0xFFDA6317),
                      fontSize: 14,
                      fontFamily: 'BentonSans1',
                      ),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      const BorderSide(color: Color(0xFFFEF6ED)),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      const BorderSide(color: Color(0xFFFEF6ED)),
                      ),
                      ),
                      ),*/
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFEF6ED),
                      ),
                      child: IconButton(
                        icon: const ImageIcon(
                          AssetImage('images/imagesicons/Filter.png'),
                          color: Color(0xFFDA6317),
                        ),
                        onPressed: () {
                          AppRouter.goToScreen(Filter());
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 850,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: 370,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFF53E88B),
                            ),
                            child: Image.asset(
                              'images/image/Pattern.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: SizedBox(
                                height: 150,
                                child: Image.asset(
                                  'images/image/Icecreamimage.png',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            right: 35,
                            top: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Special Deal For\nOctober',
                                  style: TextStyle(
                                    fontFamily: 'BentonSans',
                                    fontSize: 20,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    AppRouter.goToScreen(const VoucherScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFFFFFFFF),
                                    minimumSize: const Size(100, 40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      fontFamily: 'BentonSans',
                                      // fontSize: 15,
                                      color: Color(0xFF53E88B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Text(
                              'Nearest Restaurant',
                              style: TextStyle(
                                color: Color(0xFF09051C),
                                fontSize: 18,
                                fontFamily: 'BentonSans',
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              child: const Text(
                                'View More',
                                style: TextStyle(
                                  color: Color(0xFFFF7C32),
                                  fontSize: 14,
                                  fontFamily: 'BentonSans1',
                                ),
                              ),
                              onPressed: () {
                                _pageController.jumpToPage(1);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        child: Provider.of<AdminProvider>(context)
                                    .restaurantAllList !=
                                null
                            ? Provider.of<AdminProvider>(context)
                                    .restaurantAllList!
                                    .isEmpty
                                ? Center(
                                    child: Text('No meals found'),
                                  )
                                : GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        Provider.of<AdminProvider>(context)
                                            .restaurantAllList!
                                            .length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisExtent: 200,
                                    ),
                                    itemBuilder: (context, index) {
                                      return RestaurantWidget(
                                          Provider.of<AdminProvider>(context)
                                              .restaurantAllList![index]);
                                    },
                                  )
                            : Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Text(
                              'Popular Menu',
                              style: TextStyle(
                                color: Color(0xFF09051C),
                                fontSize: 18,
                                fontFamily: 'BentonSans',
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              child: const Text(
                                'View More',
                                style: TextStyle(
                                  color: Color(0xFFFF7C32),
                                  fontSize: 14,
                                  fontFamily: 'BentonSans1',
                                ),
                              ),
                              onPressed: () {
                                _pageController.jumpToPage(2);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: Provider.of<AdminProvider>(context)
                                    .popularMenuList !=
                                null
                            ? Provider.of<AdminProvider>(context)
                                    .popularMenuList!
                                    .isEmpty
                                ? Center(
                                    child: Text('No meals found'),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        Provider.of<AdminProvider>(context)
                                            .popularMenuList!
                                            .length,
                                    itemBuilder: (context, index) {
                                      return MenuWidget(
                                        // provider.[index],
                                        Provider.of<AdminProvider>(context)
                                            .popularMenuList![index],
                                      );
                                    })
                            : Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: provider.search.map((s) {
                            return Chip(
                              label: Text(
                                s,
                                style: const TextStyle(
                                    color: const Color(0xFFDA6317)),
                              ),
                              elevation: 1,
                              padding: const EdgeInsets.all(15),
                              backgroundColor: const Color(0xFFFEF6ED),
                              deleteIcon: const Icon(Icons.close),
                              deleteIconColor: const Color(0xFFDA6317),
                              onDeleted: () {
                                provider.search
                                    .removeWhere((element) => element == s);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color(0xFFFEF6ED),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          'Nearest Restaurant',
                          style: TextStyle(
                            color: Color(0xFF09051C),
                            fontSize: 18,
                            fontFamily: 'BentonSans',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Provider.of<AdminProvider>(context)
                                      .restaurantAllList !=
                                  null
                              ? Provider.of<AdminProvider>(context)
                                      .restaurantAllList!
                                      .isEmpty
                                  ? Center(
                                      child: Text('No meals found'),
                                    )
                                  : GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          Provider.of<AdminProvider>(context)
                                              .restaurantAllList!
                                              .length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 200,
                                      ),
                                      itemBuilder: (context, index) {
                                        return RestaurantWidget(
                                          Provider.of<AdminProvider>(context)
                                              .restaurantAllList![index],
                                        );
                                      },
                                    )
                              : CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          'Popular Menu',
                          style: TextStyle(
                            color: Color(0xFF09051C),
                            fontSize: 18,
                            fontFamily: 'BentonSans',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Provider.of<AdminProvider>(context)
                                    .popularMenuList !=
                                null
                            ? Provider.of<AdminProvider>(context)
                                    .popularMenuList!
                                    .isEmpty
                                ? Center(
                                    child: Text('No meals found'),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        Provider.of<AdminProvider>(context)
                                            .popularMenuList!
                                            .length,
                                    itemBuilder: (context, index) {
                                      return MenuWidget(
                                        // provider.[index],
                                        Provider.of<AdminProvider>(context)
                                            .popularMenuList![index],
                                      );
                                    })
                            : CircularProgressIndicator(),
                      ),
                    ],
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
