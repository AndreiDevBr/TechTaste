import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/splash/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/splash/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Image.asset(
              'assets/banners/banner_splash.png',
              width: double.infinity,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 32,
                  children: [
                    Image.asset(
                      'assets/marca_logo_simbolo/Logo home@2x.png',
                      width: 192,
                    ),
                    Column(
                      children: [
                        Text(
                          "Um parceiro para a sua",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          "melhor experiência culinária!",
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }),
                          );
                        },
                        child: Text("Bora!"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
