import 'package:http/http.dart' as http;

import '../models/usersModel.dart';

class UserRepo{

  Future<List<UsersModel>> getProducts() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode==200){
      return usersModelFromJson(response.body);
    }
    else {
      throw Exception("Failed to load products");
    }
  }


}