import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app.keys.dart';
import '../../app/routes/api.routes.dart';
import 'package:http/http.dart' as http;
class AuthenticationAPII {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
  };

  Future shopUserDetails({
    required String userEmail,
    required String userAddress,
    required String userPhoneNo, required String name, required String GstnNo, required String shopType}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

   // Map data = {'token': preferences.getString(AppKeys.userData)};
    final client = http.Client();
    const subUrl = '/peeptoon/public/api/seller/add-shop';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': "*",
        },
        body: jsonEncode({
          "token": preferences.getString(AppKeys.userData),
          "email": userEmail,
          "address": userAddress,
          "contact_no": userPhoneNo,
          "name": name,
          "GstnNo": GstnNo,
          "shopType": shopType,
        }));

    // final Map<String, dynamic> parseData = await jsonDecode(userData);
    // bool isAuthenticated = parseData['status'];
    // dynamic authData = parseData['token'];
    final dynamic body = response.body;
    print("APPII ${body}");
    return body;
  }
}