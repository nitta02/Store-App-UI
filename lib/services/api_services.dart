import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:small_store_app/constants/api_const.dart';
import 'package:small_store_app/model/category_model.dart';
import 'package:small_store_app/model/products_model.dart';

class ProductsApiServices {
  static Future<List<ProductsModel>> productiapiServices() async {
    var uri = Uri.https(Base_URL, '/api/v1/products');
    var response = await http.get(uri);

    var data = json.decode(response.body);
    print('Response Data ${json.decode(response.body)}');

    List dataList = [];

    for (var v in data) {
      dataList.add(v);
    }
    return ProductsModel.productSnapshots(dataList);
  }

  static Future<List<CategoryModel>> categoryapiServices() async {
    var uri = Uri.https(Base_URL, '/api/v1/category');
    var response = await http.get(uri);

    var data = json.decode(response.body);
    print('Response Data ${json.decode(response.body)}');

    List dataList = [];

    for (var v in data) {
      dataList.add(v);
    }
    return CategoryModel.categorySnapshots(dataList);
  }
}
