import 'package:flutter/material.dart';
import 'package:flutter_techtaste/data/categories_data.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/ui/splash/home/widgets/category_widget.dart';
import 'package:flutter_techtaste/ui/splash/home/widgets/restaurant_widget.dart';
import 'package:flutter_techtaste/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                  child: Text(
                    "Início",
                    style: TextStyle(fontSize: 30),
                  ), // Define o texto do botão como "Início"
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/marca_logo_simbolo/Logo home@2x.png',
                  width: 200,
                ),
              ),
              Text(
                "Boas Vindas!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(),
              Text(
                "Escolha por categoria",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(CategoriesData.listCategories.length,
                      (index) {
                    return CategoryWidget(
                        category: CategoriesData.listCategories[index]);
                  }),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text(
                "Bem avaliados",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Column(
                spacing: 20,
                children: List.generate(restaurantsData.listRestaurant.length,
                    (index) {
                  Restaurant restaurant = restaurantsData.listRestaurant[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
