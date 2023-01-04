import 'package:flutter/material.dart';
import 'package:fooddelivery/model/voucher_model.dart';

class VoucherWidget extends StatelessWidget {
  Voucher voucher;

  VoucherWidget(
    this.voucher, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
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
                  voucher.image,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            right: 35,
            top: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher.title,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFFFFF),
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Order Now',
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
    );
  }
}
