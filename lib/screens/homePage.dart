import 'package:flutter/material.dart';
import 'package:provider_api/model/product.dart';
import 'package:provider_api/service/getproduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Product> products= [];

  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      final body=jsonDecode(response.body) ;
      final json= body['products'] as List<dynamic>;
      final data= json.map((e) {
        // final images= e['images']['first'];
        return Product(e['title'], e['brand'],e['images']);
      }).toList();
      setState(() {
        products = data;
      });
      // print(body['products']);

    /*  final  Map<String, dynamic> responseData  = jsonDecode(response.body.toString());
      productData.add(GetAppProduct.fromJson(responseData));
    }
    products.addAll(productData[0].product as Iterable<Product>);
    for(var index=0;index>products.length;index++) {
      print(products[index].brand);
   */ }
    print(products.length.toString());
   // return product;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    // debugPrint(ProductData.length.toString());
    return Scaffold(
      appBar: AppBar(title:const Text("All product")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, index) {
              final product=products[index];
              final title= product.title;
              final brand= product.brand;
              print(product.images);
              return Card(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Name: $title")
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Brand: $brand"),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
