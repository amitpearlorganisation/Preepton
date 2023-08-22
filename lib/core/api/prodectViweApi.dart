import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app.keys.dart';
import '../../app/routes/api.routes.dart';
import '../models/ProductViweListModel.dart';
import '../models/sellerListModel.dart';
import '../models/userDetails.model.dart';

class ProdectAPI {
  final client = http.Client();

  ///*** Get Data Through User Token

  static Future<ProductViweList> Prodectlist({required dynamic id}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map data = {
      'product_id': id,
    } ;
    const subUrl = '/peeptoon/public/api/product-details';
    var headers = {
      'Authorization': 'Bearer 137|h7dkrkNXZNHAOWn5feG3G2d5hGQdkGpN0bHgX6Bh'
    };
    final response = await http.post(
      Uri.parse(ApiRoutes.baseurl + subUrl),
      headers: headers ,
      body: data,
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return ProductViweList.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error");
    }
  }


}
