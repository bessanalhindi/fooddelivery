import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/firebase/fb_fire_store_controller.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/nav_bar_screens/main_screen.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, provider, widget) {
      return Scaffold(
        backgroundColor: const Color(0xFFFAFDFF),
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/image/backgroundimage.png',
                  fit: BoxFit.cover,
                  color: Colors.grey.shade800,
                ),
                Positioned(
                  top: 70,
                  left: 25,
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFEF6ED),
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
                          Icons.arrow_back_ios,
                          color: Color(0xFFDA6317),
                          size: 25,
                        ),
                        onPressed: () {
                          AppRouter.goToScreen(MainScreen());
                        },
                      )),
                ),
                const Positioned(
                  top: 140,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BentonSans',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                controller: provider.searchTextController,
                cursorColor: const Color(0xFFDA6317),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {
                      // provider.perfomSaveSearch();
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
            StreamBuilder<QuerySnapshot>(
              stream: (name != null)
                  ? FirebaseFirestore.instance
                      .collection('restaurantAll').snapshots()
                  : FirebaseFirestore.instance
                      .collection('restaurantAll')
                      .snapshots(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: const CircularProgressIndicator())
                    : SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              return Container(
                                padding: const EdgeInsets.only(top: 16),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        data['name'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          data['imageRestaurantUrl'],
                                        ),
                                      ),
                                      trailing: Text(
                                        data['time'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    )
                                  ],
                                ),
                              );
                            }),
                      );
              },
            ),
          ],
        ),
      );
    });
  }
}
/***/
