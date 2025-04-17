import 'package:flutter/material.dart';

abstract class AppColors {
  // Static carrega junto com aplicação
  // Const e algo que nao vai mudar
  // Color são as cores que vem do materialDesign
  // BackgroundColor é o nome que escolhi
  // "=" É uma instancia
  // Color novamente
  // (0xFF) É o alfa que significa que vai ser opaca
  // (0xFF202123) é a cor que escolhi

  static const Color backgroundColor = Color(0xFF202123);
  static const Color mainColor = Color(0xFFffa559);
}
