import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.imgUrl,
    required this.title,
    Key? key,
    required this.images,
    required this.price,
  }) : super(key: key);
  final List images;
  final int price;
  final String imgUrl;

  final String title;
  @override
  Widget build(BuildContext context) {
    //sizebox belirlendi
    SizedBox sizedBox = SizedBox(height: 15);
    //cardcolor belirlendi
    Color cardColor = Colors.blue.shade200;
    //MainAxisAligment belirlendi
    MainAxisAlignment cardMainAxisAligment = MainAxisAlignment.center;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: cardColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: cardMainAxisAligment,
            children: [Text(title)],
          ),
          sizedBox,
          Image.network(
            imgUrl,
            width: 200,
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Fiyat: $price \$"),
            ],
          )
        ],
      ),
    );
  }
}
