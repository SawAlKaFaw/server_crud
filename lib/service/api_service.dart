import 'dart:async';
import 'package:dio/dio.dart';

import '../constant/constant.dart';
import '../model/product.dart';

class ApiService {
  final Dio _dio = Dio();

  ///Fetch all products from server-> [getAllProducts] function
  Future<List<Product>> getAllProducts() async {
    String url = "${Constant.baseUrl}api/products/";
    try {
      var response = await _dio.getUri(Uri.parse(url));

      if (response.statusCode == 200) {
        return (response.data as List).map((product) {
          return Product.fromJson(product);
        }).toList();
      } else {
        throw Exception("Failed to load Products");
      }
    } catch (e) {
      throw Exception("Failed to load getAllProducts $e");
    }
  }

  ///Create Product Item -> [createProduct] function
  Future<void> createProduct(Product product) async {
    String url = "${Constant.baseUrl}api/products/";
    var response = await _dio.postUri(Uri.parse(url), data: product.toJson());
    if (response.statusCode != 200) {
      throw Exception("Failed to update product");
    }
  }

  ///Update Product Item ->[updateProduct] function
  Future<void> updateProduct(String id, Product product) async {
    String url = "${Constant.baseUrl}api/products/$id";
    final response = await _dio.putUri(Uri.parse(url), data: product.toJson());
    if (response.statusCode != 200) {
      throw Exception("Failed to update product");
    }
  }

  ///Delete Single Product item-> [deleteProduct] function
  Future<void> deleteProduct(String id) async {
    String url = "${Constant.baseUrl}api/products/$id";
    final response = await _dio.deleteUri(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete product->deleteProduct");
    }
  }
}
