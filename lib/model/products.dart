import 'package:provider_api/model/product.dart';

class Products {
  List<Product>? product;

  Products({this.product});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      product = <Product>[];
      json['products'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
  }
}

