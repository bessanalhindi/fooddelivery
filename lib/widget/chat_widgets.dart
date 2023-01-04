import 'package:flutter/material.dart';
class ChatWidgets extends StatelessWidget {
  const ChatWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(5),
      width: 370,
      height: 85,
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
              image: const DecorationImage(
                  image: const AssetImage('images/image/Profile.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          title: const Text(
            'Mohamad',
            style: TextStyle(
              color: Color(0xFF09051C),
              fontSize: 15,
              fontFamily: 'BentonSans',
            ),
          ),
          subtitle: const Text('Your Order Just Arrived!'),
          trailing: const Text(
            '12:00',
            style: TextStyle(
              color: Color(0xFF3B3B3B),
              fontSize: 14,
              fontFamily: 'BentonSans1',
            ),
          ),

        ),
      ),
    );
  }
}