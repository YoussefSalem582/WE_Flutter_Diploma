import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cart.cart.length,
        itemBuilder: (context, index) {
          final product = cart.cart[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: \$${product.price}'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Total: \$${cart.totalPrice}', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
