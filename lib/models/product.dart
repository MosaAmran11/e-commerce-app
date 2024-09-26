class Product {
  final String title, image, price, description, id;
  Product(
      {required this.title,
      required this.image,
      required this.price,
      this.description = 'No details provided',
      this.id = ''});
}
