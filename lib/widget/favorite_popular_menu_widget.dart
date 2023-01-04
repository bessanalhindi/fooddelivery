import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/models/popularMenu.dart';
import 'package:fooddelivery/model/menu.dart';

class FavoritePopularMenuWidget extends StatelessWidget {
  PopularMenu popularMenu;

  FavoritePopularMenuWidget(
    this.popularMenu, {
    Key? key,
  }) : super(key: key);

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
      child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(popularMenu.image!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              popularMenu.title!,
              style: const TextStyle(
                color: Color(0xFF09051C),
                fontSize: 14,
                fontFamily: 'BentonSans',
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                popularMenu.subTitle!,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'BentonSans1',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${popularMenu.price!}\$",
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'BentonSans1',
                    color: Color(0xFF8BE8B6)),
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(80, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: const Color(0xFF53E88B),
            ),
            child: const Text('Buy Again'),
          )),
    );
  }
}
