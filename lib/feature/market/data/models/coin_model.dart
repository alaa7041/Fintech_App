import 'dart:ui';

class Coin {
  final String name;
  final int rank;
  final String price;
  final double change;
  final Color color;
  final String logo;

  Coin({
    required this.name,
    required this.rank,
    required this.price,
    required this.change,
    required this.color,
    required this.logo,
  });
}