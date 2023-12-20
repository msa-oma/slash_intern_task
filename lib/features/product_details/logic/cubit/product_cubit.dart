import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_intern_task/features/product_details/data/repos/product_repo.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  ProductCubit(this._productRepo) : super(const ProductState.initial());

  void emiteProductState() async {
    emit(const ProductState.loading());
    final data = await _productRepo.getAllProducts();
    print("$data wwwwwww");
    data.when(success: (productList) {
      print(productList);
      emit(ProductState.success(productList));
      print('state emitted ');
    }, failure: (error) {
      emit(ProductState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
