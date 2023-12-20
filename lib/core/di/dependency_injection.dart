import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash_intern_task/core/networking/dio_factory.dart';
import 'package:slash_intern_task/features/product_details/data/repos/product_repo.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_cubit.dart';

import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
//Api
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//products
  getIt.registerFactory<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));
}
