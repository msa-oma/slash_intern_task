import 'package:flutter/foundation.dart';
import 'package:slash_intern_task/core/networking/api_result.dart';
import 'package:slash_intern_task/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/product.dart';

class ProductRepo {
  final ApiService _apiService;

  ProductRepo(this._apiService);

  Future<ApiResult<List<Product>>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProducts(); //Map<String,dynamic>

      print(response);
      final data = Data.fromJson(response);
      print("$data msamsamsamsamsmamsa");

      final List<Product> products = data.products;

      if (kDebugMode) {
        print('$products <<<<<<<<<<<');
      }
      return ApiResult.success(products);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
