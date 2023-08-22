import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app.keys.dart';
import '../../app/routes/api.routes.dart';
import '../models/sellerListModel.dart';
import '../models/userDetails.model.dart';

class SellerAPI {
  final client = http.Client();

  ///*** Get Data Through User Token

  static Future<SellerList> sellerlist() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map data = {'token': preferences.getString(AppKeys.userData)};
    const subUrl = '/peeptoon/public/api/sellers';
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
      return SellerList.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error");
    }
  }


}
