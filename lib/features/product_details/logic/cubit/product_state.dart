import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState<T> with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = Loading;
  const factory ProductState.success(T data) = Success<T>;
  const factory ProductState.error({required String error}) = Error;
}
