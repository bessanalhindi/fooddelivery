import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/view_more_screens/your_order_screen.dart';
import 'package:fooddelivery/widget/detail_restaurant_menu_cart_widget.dart';
import 'package:fooddelivery/widget/order_details_cart_widgert.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false)
        .getAllCert(
        Provider.of<AuthProvider>(context, listen: false)
            .loggedUserData!);
    return Consumer<AdminProvider>(
      builder: (context, provider, widget) {
        return Provider.of<AdminProvider>(context).carts != null
            ? Provider.of<AdminProvider>(context).carts!.isEmpty
                ? Center(
                    child: Text('No found'),
                  )
                : ListView(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'images/image/backgroundimage.png',
                            fit: BoxFit.cover,
                            color: Colors.grey.shade800,
                          ),
                          const Positioned(
                            top: 120,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                'Order Details',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'BentonSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: provider.carts!.length,
                            itemBuilder: (context, index) {
                              return OrderCatrsDetailsWidget(
                                provider.carts![index],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        width: 400,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF66DBA2),
                              Color(0xFFD7EFE2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              'images/image/launch_image.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: 'BentonSans'),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${Provider.of<AdminProvider>(context, listen: false).sumTotalPrice().toString()}\$',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontFamily: 'BentonSans'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    AppRouter.goToScreen(const YourOrdersScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(250, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      primary: const Color(0xFFFEFEFF)),
                                  child: const Text(
                                    'Place My Order',
                                    style: TextStyle(
                                      color: Color(0xFF66DBA2),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
