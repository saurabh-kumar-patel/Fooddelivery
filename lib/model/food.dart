import 'package:fooddelivery/components/my_food_tile.dart';

class Food {
  final String name;         //cheese burger
  final String description; // a burger full loaded cheese
  final String imagepath;   // lib/img/cheese_burger.png
  final double price;       // 90.0
  final FoodCategory category;
  List<Addon> availableAddon; //[ extra cheese,Sauce,extra patty]
  Food( {
    required this.name,
    required this.description,
    required this.imagepath,
    required this.price,
   required this.category,
    required this.availableAddon,
  });
}

// Food Category
enum FoodCategory {
  burgers,
  salads,
  desserts,
  drinks,
}

//food addon
class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
