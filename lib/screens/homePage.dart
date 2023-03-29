import 'package:flutter/material.dart';
import 'package:provider_api/model/getall.dart';
import 'package:provider_api/service/getproduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<GetAppProduct> ProductData=<GetAppProduct>[];
  List<Product> Products=<Product>[];
  Future getData1() async {
    var product = <GetAppProduct>[];
    var response = await http.get(Uri.parse(
        "https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      final  Map<String, dynamic> responseData  = jsonDecode(response.body.toString());
      product.add(GetAppProduct.fromJson(responseData));
    }
    
    print()
    return product;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    change();
  }

  void change(){
    getData1().then((value) {
     debugPrint(value.toString());
     GetAppProduct.userModelFromJson(value);
     //  ProductData.addAll(value as Iterable<GetAppProduct>);
    });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(ProductData.length.toString());
    return Scaffold(
      appBar: AppBar(title:const Text("All product")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: ProductData.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Name: ${ProductData[0].product?[index].title}")
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Brand: ${ProductData[0].product?[index].brand}"),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
