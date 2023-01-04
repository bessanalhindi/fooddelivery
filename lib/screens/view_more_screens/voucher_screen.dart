import 'package:flutter/material.dart';
import 'package:fooddelivery/model/voucher_model.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/widget/voucher_widget.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFDFF),
      body: Consumer<FoodProvider>(
        builder: (context, provider, widget) {
          return ListView(
            children: [
              widget_textAndimage_in_screens('Voucher Promo'),
              SizedBox(
                height: 550,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.voucherData.length,
                    itemBuilder: (context, index) {
                      return VoucherWidget(provider.voucherData[index]);
                    }),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF53E88B),
                    minimumSize: const Size(350, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Check out',
                    style: TextStyle(
                      fontFamily: 'BentonSans',
                      // fontSize: 15,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
