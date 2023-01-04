import 'package:flutter/material.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/view_more_screens/notification.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FoodProvider>(
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
                                onPressed: () {
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
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
                      borderSide: const BorderSide(color: Color(0xFFFEF6ED)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFFEF6ED)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: provider.search.map((text) {
                    return Chip(
                      label: Text(
                        text,
                        style: const TextStyle(color: Color(0xFFDA6317)),
                      ),
                      elevation: 1,
                      padding: const EdgeInsets.all(15),
                      backgroundColor: const Color(0xFFFEF6ED),
                      deleteIcon: const Icon(Icons.close),
                      deleteIconColor: const Color(0xFFDA6317),
                      onDeleted: () {
                        provider.notifyListeners();
                        provider.search.removeWhere((element) {
                          return element == text;
                        });
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
            ],
          );
        },
      ),
    );
  }
}
