
import 'dart:convert';
import 'dart:convert';

class Product {
  String? title;
  String? brand;
  List<dynamic>? images;

  Product( this.title,this.brand,this.images);

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    brand = json['brand'];
    images=json['images'] as List<dynamic>?;
  //  images = json['images']();
  }

  }