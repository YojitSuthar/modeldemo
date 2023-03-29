import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider_api/model/getall.dart';

class ApiService {
  Future getData1() async {
    List<GetAppProduct> ProductData;
    ProductData = <GetAppProduct>[];
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var noteJson in jsonData) {
        ProductData.add(GetAppProduct.fromJson(noteJson));
      }
    }
    print(ProductData);
    return ProductData;
  }
}
