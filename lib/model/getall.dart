import 'dart:convert';
import 'dart:ffi';

class GetAppProduct {
  List<Product>? product;

  GetAppProduct({this.product});

 static List<Product> userModelFromJson(String str) =>
      List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

  String userModelToJson(List<Product> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  GetAppProduct.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      product = json['products'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['products'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  // Double ? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        // this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

  List<Product> userModelFromJson(String str) =>
      List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

  String userModelToJson(List<Product> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    // rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    // data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
