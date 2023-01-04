import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/nav_bar_screens/main_screen.dart';
import 'package:fooddelivery/widget/widget_text_and_image_in_screens.dart';
import 'package:fooddelivery/widget/your_orders_widget.dart';
import 'package:provider/provider.dart';

class YourOrdersScreen extends StatelessWidget {
  const YourOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AdminProvider>(
        builder: (context, provider, widget) {
          return Scaffold(
            body: Column(
              children: [
                widget_textAndimage_in_screens('Yor Orders'),
                Expanded(
                  child: ListView.builder(
                      itemCount: provider.carts!.length,
                      itemBuilder: (context, index) {
                        return YourOrdersWidget(
                          provider.carts!.toList()[index],
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AppRouter.goAndReplaceScreen(MainScreen());
                    AppRouter.showCustomDialug('Done Order !');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: const Color(0xFF8BE8B6)),
                  child: const Text(
                    'Check out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                ),
                SizedBox(height: 20,)
              ],
            ),
          );
        },
      ),
    );
  }
}
