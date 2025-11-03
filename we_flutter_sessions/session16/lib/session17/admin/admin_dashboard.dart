// import 'package:flutter/material.dart';
// import '../user/product_list_screen.dart';
// import 'add_product_screen.dart';
//
// class AdminDashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Admin Dashboard')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => AddProductScreen()));
//             },
//             child: Text('Add Product'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => ProductListScreen()));
//             },
//             child: Text('View Products'),
//           ),
//           // More buttons for updating products and showing users
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../db_helper.dart';
import 'add_product_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = await DBHelper().database;
    final products = await db.query('product');
    final users = await db.query('users');

    setState(() {
      _products = products;
      _users = users;
    });
  }

  Future<void> _deleteProduct(int productCode) async {
    final db = await DBHelper().database;
    await db.delete('product', where: 'code = ?', whereArgs: [productCode]);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductScreen()),
                ).then((_) => _loadData());
              },
              child: Text('Add Product'),
            ),
            SizedBox(height: 20),
            Text('All Products:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return ListTile(
                    title: Text(product['product_name']),
                    subtitle: Text('Price: \$${product['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          _deleteProduct(product['code']),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('All Users:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user['fullname']),
                    subtitle: Text('Role: ${user['type']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
