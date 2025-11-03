// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'product.dart';
// import 'product_provider.dart';
//
//
// class AddProductScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _codeController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _quantityController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _urlController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Product')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _codeController,
//                 decoration: InputDecoration(labelText: 'Code'),
//                 validator: (value) => value!.isEmpty ? 'Enter code' : null,
//               ),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) => value!.isEmpty ? 'Enter name' : null,
//               ),
//               TextFormField(
//                 controller: _quantityController,
//                 decoration: InputDecoration(labelText: 'Quantity'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) =>
//                 value!.isEmpty ? 'Enter quantity' : null,
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) => value!.isEmpty ? 'Enter price' : null,
//               ),
//               TextFormField(
//                 controller: _urlController,
//                 decoration: InputDecoration(labelText: 'Image URL'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final product = Product(
//                       code: _codeController.text,
//                       name: _nameController.text,
//                       quantity: int.parse(_quantityController.text),
//                       price: double.parse(_priceController.text),
//                       url: _urlController.text,
//                     );
//                     Provider.of<ProductProvider>(context, listen: false)
//                         .addProduct(product);
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Add Product'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../db_helper.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _discountController = TextEditingController();

  Future<void> _addProduct() async {
    if (_formKey.currentState!.validate()) {
      await DBHelper().insert('product', {
        'product_name': _nameController.text,
        'price': double.parse(_priceController.text),
        'qu': int.parse(_quantityController.text),
        'discount': double.parse(_discountController.text),
      });
      Navigator.pop(context); // Go back to admin dashboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) =>
                value!.isEmpty ? 'Enter product name' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Enter product price' : null,
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Enter product quantity' : null,
              ),
              TextFormField(
                controller: _discountController,
                decoration: InputDecoration(labelText: 'Discount'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Enter discount (if any)' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
