import 'dart:ui';

import 'package:slash_intern_task/features/product_details/data/models/product_details.dart';

List<Object> getAvaibleColors(ProductDetails productDetails) {
  List propList = productDetails.avaiableProperties;
  for (var e in propList) {
    if (e.property == 'Color') {
      List<Object> avaibleColors = e.values;
      return avaibleColors;
    }
  }
  return [];
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 6), radix: 16) + 0xFF000000);
}

List<Object> getAvaibleSizes(ProductDetails productDetails) {
  List propList = productDetails.avaiableProperties;
  for (var e in propList) {
    if (e.property == 'Size') {
      List<Object> avaibleSize = e.values;
      return avaibleSize;
    }
  }
  return [];
}

List<Object> getAvaibleMaterials(ProductDetails productDetails) {
  List propList = productDetails.avaiableProperties;
  for (var e in propList) {
    if (e.property == 'Materials') {
      List<Object> avaibleMaterials = e.values;
      return avaibleMaterials;
    }
  }
  return [];
}
