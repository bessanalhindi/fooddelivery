import 'package:flutter/material.dart';

class TestimonialsWidget extends StatelessWidget {
  const TestimonialsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('images/image/Profile.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dianne Russell',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '12 April 2021',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'This Is great, So delicious! You Must Here, With Your family . . ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFD7EFE2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xFF53E88B),
                  size: 35,
                ),
                Text(
                  '5',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF53E88B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
