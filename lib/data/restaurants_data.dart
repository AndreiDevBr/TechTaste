import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_techtaste/model/restaurant.dart';

class RestaurantsData {
  List<Restaurant> getRestaurants() async {
    List<Restaurant> listRestaurant = [];

    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = JsonDecoder.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];
  }
}
