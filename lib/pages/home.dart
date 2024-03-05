import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/grocery_tile.dart';
import '../models/cart.dart';
import 'cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          ),
          child: Icon(Icons.shop_outlined),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good Morning')),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "let's order fresh item for you",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemCount: value.shopItems.length,
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: ()=> Provider.of<CartModel>(context,listen:false).additem(index),
                    );
                  },
                );
              },
            ),
          ),
        ]));
  }
}
