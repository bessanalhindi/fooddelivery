import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/admin/models/restaurantAll.dart';
import 'package:fooddelivery/model/menu.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoriteRestaurantWidget extends StatelessWidget {
  RestaurantAll restaurant;

  FavoriteRestaurantWidget(
    this.restaurant, {
    Key? key,
  }) : super(key: key);

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
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(5),
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
      child: Center(
        child: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(restaurant.image!), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                restaurant.name!,
                style: const TextStyle(
                  color: Color(0xFF09051C),
                  fontSize: 14,
                  fontFamily: 'BentonSans',
                ),
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(40, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: const Color(0xFF53E88B),
              ),
              child: IconButton(
                  onPressed: () {
                    _launchCall();
                  },
                  icon: Icon(Icons.phone)),
            )),
      ),
    );
  }
}
