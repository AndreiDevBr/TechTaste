import 'package:flutter/material.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:flutter_techtaste/ui/splash/_core/app_theme.dart';
import 'package:flutter_techtaste/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantsData restaurantsData = RestaurantsData();
  await restaurantsData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantsData;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
