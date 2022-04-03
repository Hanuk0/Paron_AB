import 'package:flutter/material.dart';
import 'model.dart';

class ProductPage extends StatefulWidget {
  final stock;
  const ProductPage(this.stock, {Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() {
    return ProductPageState(stock);
  }
}

class ProductPageState extends State<ProductPage> {
  final stock;
  ProductPageState(this.stock);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: Text(stock.product),
    ));
  }
}
