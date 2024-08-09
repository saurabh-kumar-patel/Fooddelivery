import 'food.dart';

class CartItem {
  Food food;
  List<Addon> selectAddon;
  int quantity;
  CartItem({
    required this.food,
    required this.selectAddon,
    this.quantity = 1,
  });
  double get totalPrice {
    double addonPrice = selectAddon.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonPrice) * quantity;
  }
}
