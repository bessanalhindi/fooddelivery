import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/model/menu.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/view_more_screens/detail_menu_screen.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  PopularMenu popularMenu;
  MenuWidget(
    this.popularMenu, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, widget) {
        return InkWell(
          onTap: () {
            AppRouter.goToScreen(
                DetailMenuScreen(
              popularMenu: popularMenu,
            ));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(5),
            width: 325,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                leading: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(popularMenu.image!), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                title: Text(
                  popularMenu.title!,
                  style: const TextStyle(
                    color: Color(0xFF09051C),
                    fontSize: 15,
                    fontFamily: 'BentonSans',
                  ),
                ),
                subtitle: Text(popularMenu.subTitle!),
                trailing: Text(
                 "${ popularMenu.price!}\$",
                  style: const TextStyle(
                    color: Color(0xFFFEAD1D),
                    fontSize: 22,
                    fontFamily: 'BentonSans',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
