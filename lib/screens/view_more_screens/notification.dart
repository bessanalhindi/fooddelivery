import 'package:flutter/material.dart';
import 'package:fooddelivery/model/notifications.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
      builder: (context, provider, widget) {
        return Scaffold(
          body: ListView(
            children: [
              widget_textAndimage_in_screens(
                'Notification',
              ),
              SizedBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: provider.notification.length,
                  itemBuilder: (context, index) {
                    return NotificationWidget(
                      provider.notification[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NotificationWidget extends StatelessWidget {
  Notifications notifications;

  NotificationWidget(
    this.notifications, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(5),
      width: 347,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
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
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(notifications.image!), fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          title: Text(
            notifications.title!,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'BentonSans1',
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(notifications.time!),
        ),
      ),
    );
  }
}

/**                      Container(
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
    child: Center(
    child: IconButton(
    icon: const Icon(
    Icons.arrow_back_ios,
    color: Color(0xFFDA6317),
    size: 30,
    ),
    onPressed: () {
    },
    ),
    ))*/
