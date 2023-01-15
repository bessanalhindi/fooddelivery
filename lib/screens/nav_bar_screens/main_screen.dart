import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/screens/add_new_menu.dart';
import 'package:fooddelivery/admin/screens/admin_screen.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/nav_bar_screens/chat_screen.dart';
import 'package:fooddelivery/screens/nav_bar_screens/home_screen.dart';
import 'package:fooddelivery/screens/nav_bar_screens/cart_screen.dart';
import 'package:fooddelivery/screens/nav_bar_screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../model/navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<NavigationBarModel> _tabs = [
    NavigationBarModel(
        title: 'Home', widget: const HomeScreen(), icon: Icons.home),
    NavigationBarModel(
      title: 'Profile',
      widget: const ProfileScreen(),
      icon: Icons.person,
    ),
    NavigationBarModel(
        title: 'Cart',
        widget: const CartScreen(),
        icon: Icons.shopping_cart_rounded),
    if (Provider.of<AuthProvider>(AppRouter.navKey.currentContext!)
            .loggedUserData!
            .isAdmin !=
        false)
      NavigationBarModel(
          title: 'Admin', widget: AdminScreen(), icon: Icons.add),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFDFF),
        body: _tabs[_selectedIndex].widget == null
            ? CircularProgressIndicator()
            : _tabs[_selectedIndex].widget,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BottomNavigationBar(
              selectedFontSize: 16,
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.green,
              selectedIconTheme: const IconThemeData(color: Colors.green),
              showSelectedLabels: false,
              elevation: 0,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                for (int i = 0; i < _tabs.length; i++)
                  BottomNavigationBarItem(
                    label: '',
                    icon: _selectedIndex == i
                        ? containerOfBar(
                            page: _tabs[i].title,
                            icon: _tabs[i].icon,
                          )
                        : Icon(_tabs[i].icon),
                    backgroundColor: Colors.white,
                  ),
              ],
              type: BottomNavigationBarType.shifting,
            ),
          ),
        ));
  }
}

Container containerOfBar({required String page, required IconData icon}) {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(83, 232, 139, 0.20),
            Color.fromRGBO(21, 190, 119, 0.20),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    height: 50,
    width: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Text(
          page,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

/**Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: 70,
    decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 30,
    offset: const Offset(0, 10),
    ),
    ],
    borderRadius: BorderRadius.circular(50),
    ),
    child: GNav(
    onTabChange: (newIndex) {
    setState(() {
    _selectedIndex = newIndex;
    });
    },
    gap: 10,
    padding: const EdgeInsets.symmetric(vertical: 10),
    tabActiveBorder: Border.all(
    color: Colors.green.shade50,
    ),
    tabBorderRadius: 20.0,
    tabBackgroundColor: Colors.green.shade50,
    textStyle: const TextStyle(color: Colors.black),
    tabs: [
    const GButton(
    icon: Icons.home,
    text: 'Home',
    leading: ImageIcon(
    AssetImage('images/imagesicons/Home_icon.png'),
    color: const Color(0xFF53E88B),
    ),
    ),
    const GButton(
    icon: Icons.person,
    text: 'Profile',
    leading: const ImageIcon(
    AssetImage('images/imagesicons/profile_Icon.png'),
    color: const Color(0xFF53E88B),
    ),
    ),
    GButton(
    icon: Icons.shopping_cart,
    text: 'Orders',
    leading: ImageIcon(
    const AssetImage('images/imagesicons/order_icon.png'),
    color: Colors.greenAccent.shade400,
    ),
    ),
    GButton(
    icon: Icons.chat,
    text: 'Chat',
    leading: ImageIcon(
    const AssetImage('images/imagesicons/Chat_icon.png'),
    color: Colors.greenAccent.shade400),
    ),
    ],
    ),
    ),*/
/**Container(
    height: 80,
    padding: EdgeInsets.symmetric(horizontal: 15),
    margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Color(0xFFFFFFFF),
    // color: Colors.black,

    ),
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: GNav(
    onTabChange: (newIndex) {
    setState(() {
    _selectedIndex = newIndex;
    });
    },
    gap: 10,
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
    tabActiveBorder: Border.all(color: Colors.teal),
    textStyle: TextStyle(color: Colors.black),


    tabs: [
    GButton(
    icon: Icons.home,
    text: 'Home',
    leading:
    ImageIcon(AssetImage('images/imagesicons/Home_icon.png'),color: Color(0xFF53E88B),),

    ),
    GButton(
    icon: Icons.person,
    text: 'Profile',
    leading:
    ImageIcon(AssetImage('images/imagesicons/profile_Icon.png'),color: Color(0xFF53E88B),),

    ),
    GButton(
    icon: Icons.shopping_cart,
    text: 'Orders',
    leading:
    ImageIcon(AssetImage('images/imagesicons/order_icon.png'),color: Colors.greenAccent.shade400,),

    ),
    GButton(
    icon: Icons.chat,
    text: 'Chat',
    leading:
    ImageIcon(AssetImage('images/imagesicons/Chat_icon.png'),color: Colors.greenAccent.shade400),

    ),
    ],
    ),
    ),
    ),*/
