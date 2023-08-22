import '../../core/models/cart.model.dart';
import 'package:http/http.dart' as http;

class UserRepo{

  Future<GetCartData> getCartProducts() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode==200){
      return getCartDataFromJson(response.body);
    }
    else {
      throw Exception("Failed to load products");
    }
  }


}