import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../app/routes/api.routes.dart';

class ProductAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
  };

  Future fetchProducts() async {
    const subUrl = '/product';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.get(
      uri,
      headers: headers,
    );
    final body = response.body;
    return body;
  }

  Future fetchProductDetail({required dynamic id}) async {
    var subUrl = '/peeptoon/public/api/product-details';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);

    final http.Response response = await client.post(
      uri,
      headers: headers,
      body:jsonEncode(<String, String>{
        'product_id': id,
      }),
    );
    final body = response.body;
    print("hsjdhjfhsdjfhsdjfhdsj=======>${body}");
    return body;
  }

  Future fetchProductCategory({required dynamic categoryName}) async {
    var subUrl = '/product/category/$categoryName';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);

    final http.Response response = await client.get(
      uri,
      headers: headers,
    );
    final body = response.body;
    return body;
  }

  Future searchProduct({required dynamic productName}) async {
    var subUrl = '/product/search/$productName';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);

    final http.Response response = await client.get(
      uri,
      headers: headers,
    );
    final body = response.body;
    return body;
  }
}
