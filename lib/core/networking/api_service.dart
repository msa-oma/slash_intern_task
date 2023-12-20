import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:slash_intern_task/core/networking/api_const.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.product)
  Future<dynamic> getAllProducts();
}


//dart pub run build_runner build
