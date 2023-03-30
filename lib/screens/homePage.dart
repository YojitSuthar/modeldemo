import 'package:flutter/material.dart';
import 'package:provider_api/model/products.dart';
import 'package:provider_api/service/getproduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   Products data=Products();


  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

    setState(() {
          data= Products.fromJson(body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
   //  debugPrint(data.product?.length.toString());
    return Scaffold(
      appBar: AppBar(title:const Text("All product")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: data.product!.length?? 1,
            itemBuilder: (BuildContext context, index) {
              final product=data.product![index];
              final title= product.title;
              final brand= product.brand;
              print(product.images![0].toString());
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
