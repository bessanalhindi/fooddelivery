import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/admin/providers/admin_provider.dart';
import 'package:fooddelivery/firebase_options.dart';
import 'package:fooddelivery/providers/auth_provider.dart';
import 'package:fooddelivery/providers/food_provider.dart';
import 'package:fooddelivery/routers/app_router.dart';
import 'package:fooddelivery/screens/on_boarding_screens/launch_screen.dart';
import 'package:fooddelivery/screens/view_more_screens/viewmorerestaurants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefController().initPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context) {
          return AuthProvider();
        }),
        ChangeNotifierProvider<FoodProvider>(
          create: (context) {
            return FoodProvider();
          },
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/view_more_restaurants': (context) => ViewMoreRestaurant(),
          '/launch_screen': (context) => LaunchScreen(),
        },
      ),
    );
  }
}
