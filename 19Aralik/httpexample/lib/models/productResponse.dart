class ProductResponse {
  ProductResponse(
      {required this.id,
      required this.title,
      required this.price,
      required this.thumbnail,
      required this.images});
  final int id;
  final String title;
  final int price;
  final List images;
  final String thumbnail;
}
