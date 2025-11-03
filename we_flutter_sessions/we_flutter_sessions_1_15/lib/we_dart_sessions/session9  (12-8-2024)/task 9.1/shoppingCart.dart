import 'product.dart';

class ShoppingCart {
  List<Product> userChoose = [];

  void addProduct(Product product) {
    userChoose.add(product);
    print('Product ${product.name} added to cart.');
  }

  void delProduct(String productName) {
    userChoose.removeWhere((product) => product.name == productName);
    print('Product $productName removed from cart.');
  }

  double totalPriceBD() {
    double totalpriceBD = 0;
    for (var product in userChoose) {
      totalpriceBD += product.price * product.quantity; // Multiply by quantity
    }
    return totalpriceBD;
  }

  double totalPriceAD() {
    double totalPriceAD = 0;
    for (var product in userChoose) {
      double discountAmount = product.price * product.discount;
      double discountedPrice = product.price - discountAmount;
      totalPriceAD += discountedPrice * product.quantity; // Multiply by quantity
    }
    return totalPriceAD;
  }

  void displayCart() {
    if (userChoose.isEmpty) {
      print('Your cart is empty.');
      return;
    }

    print('\nShopping Cart:');
    for (var product in userChoose) {
      print('- ${product.name} - \$${product.price} x ${product.quantity}'); // Display quantity
    }
    print('Total Price Before Discount: \$${totalPriceBD()}');
    print('Total Price After Discount: \$${totalPriceAD()}');
  }
}