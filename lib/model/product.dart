
import 'dart:convert';
import 'dart:convert';

class Product {
  String title="";
  String brand="";
  //List<String>? images;

  Product({required this.title,required this.brand});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    brand = json['brand'];
  //  images = json['images']();
  }

  }