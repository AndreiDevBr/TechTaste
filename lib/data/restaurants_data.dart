// Importa bibliotecas necessárias
import 'dart:convert'; // Para decodificar o JSON
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para acessar recursos como arquivos locais
import 'package:flutter_techtaste/model/restaurant.dart'; // Importa o modelo Restaurant

// Classe responsável por carregar e fornecer os dados dos restaurantes
class RestaurantsData extends ChangeNotifier {
  // Cria uma lista vazia que irá armazenar os restaurantes
  List<Restaurant> listRestaurant = [];

  // Método assíncrono que retorna uma lista de objetos do tipo Restaurant
  Future<void> getRestaurants() async {
    // Carrega o conteúdo do arquivo JSON localizado na pasta assets
    String jsonString = await rootBundle.loadString('assets/data.json');

    // Decodifica a string JSON para um Map (estrutura chave-valor)
    Map<String, dynamic> data = json.decode(jsonString);

    // Acessa a lista de restaurantes contida no JSON
    List<dynamic> restaurantsData = data['restaurants'];

    // Percorre cada item da lista de restaurantes
    for (var restaurantData in restaurantsData) {
      // Converte o Map para um objeto do tipo Restaurant usando o método fromMap
      Restaurant restaurant = Restaurant.fromMap(restaurantData);

      // Adiciona o restaurante convertido à lista
      listRestaurant.add(restaurant);
    }

    // Retorna a lista completa de restaurantes
  }
}
