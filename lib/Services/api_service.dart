import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = "https://dummyjson.com/products";

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List productsJson = data['products'];

      return productsJson
          .map((json) => Product.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
