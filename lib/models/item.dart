import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String price;
  final String imageUrl;
  final Affordability affordability;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.affordability,
  });
}
