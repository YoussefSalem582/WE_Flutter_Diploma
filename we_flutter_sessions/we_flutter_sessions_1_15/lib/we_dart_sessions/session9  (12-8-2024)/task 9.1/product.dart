
class Product {
  late String name;
  late String description;
  late double price;
  late double discount;late int quantity;

  Product(this.name, this.description, this.price, this.discount, this.quantity);

  List<Map<String, dynamic>> createListOfMaps(List<Product> products) {
    return products.map((product) => {
      'name': product.name,
      'price': product.price,
      'discount': product.discount,
    }).toList();
  }
}
