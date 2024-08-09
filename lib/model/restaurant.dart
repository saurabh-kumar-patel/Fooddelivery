import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/model/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      category: FoodCategory.burgers,
      name: "Aloha Burger",
      description: "A juicy burger with tamato and onion",
      imagepath: "lib/img/burgers/aloha_burger.png",
      price: 90.0,
      availableAddon: [
        Addon(name: "Extra Chesse", price: 10),
        Addon(name: "Avocado", price: 20),
        Addon(
          name: "Aloo",
          price: 29,
        ),
      ],
    ),
    Food(
      category: FoodCategory.burgers,
      name: "BBQ Burger",
      description: "A juicy burger with tamato and onion",
      imagepath: "lib/img/burgers/bbq.png",
      price: 120.0,
      availableAddon: [
        Addon(
          name: "Extra Chesse",
          price: 10,
        ),
        Addon(
          name: "Avocado",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.burgers,
      name: "Cheese Burger",
      description: "A delicious Cheese burger with onion and tamato",
      imagepath: "lib/img/burgers/cheese.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.burgers,
      name: "Vege Burger",
      description: "A delicious Cheese burger with onion and tamato",
      imagepath: "lib/img/burgers/vege.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.burgers,
      name: "Bluemoon Burger",
      description: "A delicious Cheese burger with onion and tamato",
      imagepath: "lib/img/burgers/blue.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    // Salads
    Food(
      category: FoodCategory.salads,
      name: "EGG SALADS",
      description: "A delicious Egg Tamato amd onion.",
      imagepath: "lib/img/salads/egg.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.salads,
      name: "FRUITS SALADS",
      description: "A delicious Apple Orange Gauva and Grapes.",
      imagepath: "lib/img/salads/Fruit.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.salads,
      name: "LEAF SALADS",
      description: "A delicious Leaf Salads.",
      imagepath: "lib/img/salads/leaf.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.salads,
      name: " SALADS",
      description: "A delicious Egg Tamato amd onion.",
      imagepath: "lib/img/salads/Salad-Transparent.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.salads,
      name: "Tomato SALADS",
      description: "A delicious Egg Tamato amd onion.",
      imagepath: "lib/img/salads/tamato.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    //Sides

    //desserts
    Food(
      category: FoodCategory.desserts,
      name: "Cake",
      description: "A delicious Cakr",
      imagepath: "lib/img/desserts/cake.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.desserts,
      name: "Simple Pesties",
      description: "A delicious Cakr",
      imagepath: "lib/img/desserts/simple_pesti.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.desserts,
      name: "Ice Cream",
      description: "A delicious Cakr",
      imagepath: "lib/img/desserts/ice_cream.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.desserts,
      name: "Starbaries Cake",
      description: "A delicious Cakr",
      imagepath: "lib/img/desserts/starbaries.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.desserts,
      name: "Pesties",
      description: "A delicious Pesties",
      imagepath: "lib/img/desserts/pesti.png",
      price: 90.0,
      availableAddon: [
        Addon(
          name: "Extra Cream",
          price: 10,
        ),
        Addon(
          name: "Extra Bread",
          price: 20,
        ),
      ],
    ),
    //drinks
    Food(
      category: FoodCategory.drinks,
      name: "COCKTAIL",
      description: "A delicious Drinks",
      imagepath: "lib/img/drinks/cocktail.png",
      price: 120.0,
      availableAddon: [
        Addon(
          name: "Extra Friuts",
          price: 10,
        ),
        Addon(
          name: "Extra Wine",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.drinks,
      name: "COKE",
      description: "A delicious Drinks",
      imagepath: "lib/img/drinks/coke.png",
      price: 120.0,
      availableAddon: [
        Addon(
          name: "Extra Friuts",
          price: 10,
        ),
        Addon(
          name: "Extra Wine",
          price: 20,
        ),
      ],
    ),
    Food(
      category: FoodCategory.drinks,
      name: "DRINKS",
      description: "A delicious Drinks",
      imagepath: "lib/img/drinks/drinks.png",
      price: 120.0,
      availableAddon: [
        Addon(
          name: "Extra Friuts",
          price: 10,
        ),
        Addon(
          name: "Extra Wine",
          price: 20,
        ),
      ],
    ),
    Food(
        name: "PURPLE HAZE DRINKS",
        description: "A delicious Drinks",
        imagepath: "lib/img/drinks/purple-haze.png",
        price: 120.0,
        availableAddon: [
          Addon(
            name: "Extra Friuts",
            price: 10,
          ),
          Addon(
            name: "Extra Wine",
            price: 20,
          ),
        ],
        category: FoodCategory.drinks),
    Food(
      name: "SIMPLE DRINKS",
      description: "A delicious Drinks",
      imagepath: "lib/img/drinks/glassdrinks.png",
      price: 120.0,
      availableAddon: [
        Addon(
          name: "Extra Friuts",
          price: 10,
        ),
        Addon(
          name: "Extra Wine",
          price: 20,
        ),
      ],
      category: FoodCategory.drinks,
    ),
  ];
  // user cart
  final List<CartItem> _cart = [];
  // delivery address which user can change and update
  String _deliveryAddress = " Rajpur";
  /*
  G E T T E R
   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress=>_deliveryAddress;
  /*
  O P E R A T I O N S
   */

// add to cart
  void addToCart(Food food, List<Addon> selectedAddon) {
    // see if there is a cart items already with the same food and selected addons
    CartItem? cartitem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the list of selected addons are the same
      bool isSameAddon =
          const ListEquality().equals(item.selectAddon, selectedAddon);
      return isSameFood && isSameAddon;
    });
    // if items already exists, increase it's quantity
    if (cartitem != null) {
      cartitem.quantity++;
    }
    // otherwise add new cart items to the cart
    else {
      _cart.add(
        CartItem(food: food, selectAddon: selectedAddon),
      );
    }
    notifyListeners();
  }
// remove from cart
  void removeToCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectAddon) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

// get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
   void updateDeliveryAddress(String newAddress){
    _deliveryAddress =newAddress;
    notifyListeners();
   }

  /*
  H E L P E R S
   */

// generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();
    //formate the date to include up to second only
    String formateDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formateDate);
    receipt.writeln();
    receipt.writeln("______________");

    for (final CartItem in _cart) {
      receipt.writeln(""
          "${CartItem.quantity} * ${CartItem.food.name} - ${_formatePrice(CartItem.food.price)}");

      if (CartItem.selectAddon.isNotEmpty) {
        receipt.writeln("Add-ons:${_formateAddons(CartItem.selectAddon)}");
      }
      receipt.writeln();
    }
    receipt.writeln("_________");
    receipt.writeln();
    receipt.writeln("Total Items : ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatePrice(getTotalPrice())}");
    receipt.writeln("Delivering to :$deliveryAddress");
    return receipt.toString();
  }

// format double value into money
  String _formatePrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

// format list of addon into a string summary
  String _formateAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatePrice(addon.price)})")
        .join(",");
  }
}
