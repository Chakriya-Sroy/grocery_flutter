import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        final cart = value.cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Image.asset(
                                cart[2],
                                height: 20,
                              ),
                              title: Text(
                                cart[0],
                                style: TextStyle(
                                    color: cart[3],
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('\$' + cart[1]),
                              trailing: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItem(index)),
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text(value.calculateTotal()),
                ),
              )
            ],
          ),
        ));
  }
}
