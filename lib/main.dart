import 'package:flutter/material.dart';
// Importa o pacote principal do Flutter para criar interfaces de usuário.

import 'package:flutter_techtaste/data/restaurants_data.dart';
// Importa a classe RestaurantsData, que gerencia os dados dos restaurantes.

import 'package:flutter_techtaste/ui/splash/_core/app_theme.dart';
import 'package:flutter_techtaste/ui/splash/_core/bag_provider.dart';
// Importa o tema personalizado da aplicação.

import 'package:flutter_techtaste/ui/splash/splash_screen.dart';
// Importa a tela inicial (SplashScreen) da aplicação.

import 'package:provider/provider.dart';
// Importa o pacote Provider para gerenciamento de estado.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Garante que o Flutter esteja completamente inicializado antes de executar o código assíncrono.

  RestaurantsData restaurantsData = RestaurantsData();
  // Cria uma instância da classe RestaurantsData.

  await restaurantsData.getRestaurants();
  // Carrega os dados dos restaurantes de forma assíncrona antes de iniciar o aplicativo.

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantsData;
            // Registra instância de RestaurantsData como um provider para gerenciamento de estado.
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
      // Define o widget raiz da aplicação como MyApp.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Define a classe MyApp como um widget sem estado (StatelessWidget).

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      // Define o tema da aplicação usando o tema personalizado AppTheme.

      home: SplashScreen(),
      // Define a tela inicial da aplicação como SplashScreen.
    );
  }
}
