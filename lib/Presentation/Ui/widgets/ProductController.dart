import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Model/product.dart';
import '../Utils/urls.dart';


class ProductController{

  List<Data> products = [];

  Future<void>fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      productModel model = productModel.fromJson(data);
      products = model.data ?? [];
    }
  }

  Future<void>createProducts(String name,String img, int qty, int price, int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.createProduct),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecond,
          "Img": img,
          "Qty": qty,
          "UnitPrice": price,
          "TotalPrice": totalPrice
        })
    );

    if(response.statusCode == 201){
      fetchProducts();
    }
  }

  Future<void>updateProducts(String id,String name,String img, int qty, int price, int totalPrice) async {
    final response = await http.post(Uri.parse(Urls.updateProduct(id)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ProductName": name,
          "ProductCode": DateTime.now().microsecond,
          "Img": img,
          "Qty": qty,
          "UnitPrice": price,
          "TotalPrice": totalPrice
        })
    );

    if(response.statusCode == 201){
      fetchProducts();
    }
  }

  Future<bool>deleteProducts(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(id)));

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}