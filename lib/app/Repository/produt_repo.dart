import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:peerp_toon/presentation/screens/productScreen/transactionModel/TransationModel.dart';

import '../models/product_models.dart';
class ProductsRepo{

 Future<List<ProductModels>> getProducts() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode==200){
      return productModelsFromJson(response.body);
    }
    else {
      throw Exception("Failed to load products");
    }
  }


 }

class TransactionRepo{
  final Dio _dio = Dio();

  Future<TransactionModel> getTransactions(String mobileNo, String pageNo) async {
    final response = await _dio.post('https://test.pearl-developer.com/vrun/public/api/transaction-history2',
        data: {
          'mobileNo': mobileNo,
          'pageNo': pageNo,
        });
    print("transaction model response $response");
    if (response.data["status"]=="true"){
      return transactionModelFromJson(response.data);
    }
    else {
      throw Exception("Failed to load products");
    }
  }

}
