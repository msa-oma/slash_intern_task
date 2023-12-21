import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_intern_task/features/product_details/data/repos/product_repo.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  ProductCubit(this._productRepo) : super(const ProductState.initial());

  void emiteProductState() async {
    emit(const ProductState.loading());
    final data = await _productRepo.getAllProducts();
    data.when(success: (productList) {
      emit(ProductState.success(productList));
    }, failure: (error) {
      emit(ProductState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  void emitProductDetailsState(int id) async {
    emit(const ProductState.loading());
    final data = await _productRepo.getProductDetails(id);

    data.when(success: (productDetails) {
      emit(ProductState.success(productDetails));
      if (kDebugMode) {
        print(">>>>>>>>>>Product Details Emitted<<<<<<<<<< ");
      }
    }, failure: (error) {
      emit(ProductState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
