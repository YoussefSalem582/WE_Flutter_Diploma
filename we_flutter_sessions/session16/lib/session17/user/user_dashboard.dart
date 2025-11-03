// import 'package:flutter/material.dart';
// import 'cartScreen.dart';
// import 'product_list_screen.dart';
//
// class UserDashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User Dashboard')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => ProductListScreen()));
//             },
//             child: Text('View Products'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => CartScreen()));
//             },
//             child: Text('View Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../db_helper.dart';

class UserDashboardScreen extends StatefulWidget {
  @override
  _UserDashboardScreenState createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final db = await DBHelper().database;
    final products = await db.query('product');
    setState(() {
      _products = products;
    });
  }

  Future<void> _addToCart(int productCode) async {
    await DBHelper().insert('cart', {
      'user_id': 1, // Replace with actual user ID
      'product_code': productCode,
      'qu': 1,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to Cart')),
    );
  }

  Future<void> _addToFavorites(int productCode) async {
    await DBHelper().insert('fav', {
      'user_id': 1, // Replace with actual user ID
      'product_code': productCode,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to Favorites')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Dashboard')),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product['product_name']),
            subtitle: Text('Price: \$${product['price']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => _addToCart(product['code']),
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () => _addToFavorites(product['code']),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
