import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../app/routes/api.routes.dart';

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
  };

  ///*** Function For  User Sign Up
  Future createAccount(
      {required String useremail,
      required String username,
      required String userpassword,
      required String userConfirmPassword,
      required String phoneNumber}) async {
    const subUrl = '/peeptoon/public/api/signup';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "name": username,
          "email": useremail,
          "contact_no": phoneNumber,
          "password": userpassword,
          "confirm_password": userConfirmPassword,
        }));
    final dynamic body = response.body;
    print("Account Create API =======> $body");
    return body;
  }
  //add
  Future addAProdect(
      {required String token,
        required String product_name,
        required String stock,
        required String description,
        required String image_ext,
        required String price,}) async {
    const subUrl = '/peeptoon/public/api/seller/add-product ';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);







    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          token: token,
          product_name: product_name,
          stock: stock,
          description: description,
          image_ext: image_ext,
          price: price,
        }));
    final dynamic body = response.body;
    print("Account Create apiii ===========> $body");
    var _base64 = base64Encode(response.bodyBytes);
    return body;
  }

  Future userLogin({
    required String useremail,
    required String userpassword,
    // required String usercontact
  }) async {
    const subUrl = '/peeptoon/public/api/signin';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "email": useremail,
          // "contact_no": usercontact,
          "password": userpassword,
        }));
    final dynamic body = response.body;
    print("Account Logined =======> $body");
    return body;
  }

  ///****** Function For Forgot Password.
  Future forgotPassword({
    required String email,
  }) async {
    const subUrl = '/peeptoon/public/api/forgot_password';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers, body: jsonEncode({"email": email}));
    final dynamic body = response.body;
    print("Password Sended To =========> $body");
    return body;
  }



  ///***** Function For Verify The OTP.
  Future getOTPVerified({
    required String otp,
  }) async {
    const subUrl = '/peeptoon/public/api/verify-otp';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers, body: jsonEncode(<String, String>{"otp": otp}));
    final dynamic body = response.body;
    print("Verification Completed =======> $body");
    return body;
  }

  ///**** Function For Change Password

  Future getChangePassword(
      {required String password, required String token}) async {
    const subUrl = '/peeptoon/public/api/change-password';
    final Uri uri = Uri.parse(ApiRoutes.baseurl+subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({"token": token, "password": password}));
    final dynamic body = response.body;
    print("Password Updated =========> $body");
    return body;
  }
}
