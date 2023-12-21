import 'package:flutter/foundation.dart';
import 'package:slash_intern_task/core/networking/api_result.dart';
import 'package:slash_intern_task/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/product.dart';
import '../models/product_details.dart' as pd;

class ProductRepo {
  final ApiService _apiService;

  ProductRepo(this._apiService);

  Future<ApiResult<List<Product>>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProducts(); //Map<String,dynamic>

      final data = Data.fromJson(response);

      final List<Product> products = data.products;

      if (kDebugMode) {
        print('$products <<<<<<<<<<<');
      }
      return ApiResult.success(products);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<pd.ProductDetails>> getProductDetails(int id) async {
    try {
      final Map<String, dynamic> json = await _apiService.getProductDetails(id);
      if (kDebugMode) {
        print(" respons is $json");
      }
      final data = pd.Data.fromJson(json);
      if (kDebugMode) {
        print(" xxxxxxxxxxxxxx  $data  ");
      }
      final pd.ProductDetails productDetails = data.data;

      if (kDebugMode) {
        print(" product details is   $productDetails");
      }
      return ApiResult.success(productDetails);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
