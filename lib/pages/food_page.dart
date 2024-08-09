import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/model/food.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    //initialize selected addons to be false

    for (Addon addon in food.availableAddon) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // method to add to cart
  void addToCart(Food food,Map<Addon,bool> selectedAddons){
    // close the current food page to go back menu
    Navigator.pop(context);

    // formate the selected addons
    List<Addon> currentlySelectedAddons=[];
    for(Addon addon in widget.food.availableAddon){
      if(widget.selectedAddons[addon]==true){
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Restaurant>().addToCart(food,currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food Image
                Image.asset(
                  widget.food.imagepath,
                  height: 400,
                  width: double.infinity,
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      // Food price
                      Text(
                        '\$${widget.food.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 10),

                      //addons
                      Text(
                        "Ass-ons",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddon.length,
                            itemBuilder: (context, index) {
                              // get individual addon
                              final addon = widget.food.availableAddon[index];
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  '\$${addon.price}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                //button to add to cart
                MyButton(
                  onTap: ()=> addToCart(widget.food,widget.selectedAddons),
                  text: "Add to cart",
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        // Back button
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
