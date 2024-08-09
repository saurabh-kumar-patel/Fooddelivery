import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_quantity_selector.dart';
import 'package:fooddelivery/model/cart_item.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      cartItem.food.imagepath,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(cartItem.food.name),
                      // price
                      Text(
                        "\$${cartItem.food.price}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      MYQuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onIncrement: () {
                            restaurant.addToCart(
                                cartItem.food, cartItem.selectAddon);
                          },
                          onDecrement: () {
                            restaurant.removeToCart(cartItem);
                          }),
                    ],
                  ),
                  const Spacer(),
                  // increment and decrement quantity

                ],
              ),
            ),
            //Addons
            SizedBox(
              height: cartItem.selectAddon.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectAddon
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // addon name
                              Text(addon.name),
                              // price
                              Text("(\$${addon.price})"),
                            ],
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
