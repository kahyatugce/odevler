import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpexample/models/productResponse.dart';
import 'package:httpexample/widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductResponse> productList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    // http isteği ile ürünleri elde etmek
    Uri url = Uri.https("dummyjson.com", "products");
    final response = await http.get(url);
    final dataAsJson = json.decode(response.body);
    // alınan cevabı bir dart nesnesi olarak kullanabilmek

    final products = dataAsJson["products"];
    //boş list
    List<ProductResponse> productsFromWebAPI = [];
    for (var element in products) {
      productList.add(ProductResponse(
          id: element["id"],
          thumbnail: element["thumbnail"],
          images: element["images"],
          price: element["price"],
          title: element["title"]));
    }

    setState(() {
      productsFromWebAPI = productList;
    });
    // Dersteki setstate
    //setState(() {
    //   productList = dataAsJson["products"];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (ctx, index) => ProductItem(
            images: productList[index].images,
            price: productList[index].price,
            imgUrl: productList[index].thumbnail,
            title: productList[index].title),
      ),
    );
  }
}


