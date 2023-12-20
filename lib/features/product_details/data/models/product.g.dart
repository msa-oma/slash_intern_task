// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['brand_id'] as int,
      Brands.fromJson(json['Brands'] as Map<String, dynamic>),
      (json['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'brand_id': instance.brandId,
      'Brands': instance.brands,
      'ProductVariations': instance.variations,
    };

Brands _$BrandsFromJson(Map<String, dynamic> json) => Brands(
      json['brand_name'] as String?,
      json['brand_logo_image_path'] as String?,
      json['id'] as int,
    );

Map<String, dynamic> _$BrandsToJson(Brands instance) => <String, dynamic>{
      'id': instance.id,
      'brand_name': instance.brandName,
      'brand_logo_image_path': instance.brandLogoUrl,
    };

ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) =>
    ProductVariation(
      json['id'] as int,
      json['price'] as num,
      (json['ProductVarientImages'] as List<dynamic>)
          .map((e) => ProductVarientImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_id'] as int,
      json['quantity'] as int,
    );

Map<String, dynamic> _$ProductVariationToJson(ProductVariation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'price': instance.price,
      'quantity': instance.quantity,
      'ProductVarientImages': instance.productVarientImages,
    };

ProductVarientImages _$ProductVarientImagesFromJson(
        Map<String, dynamic> json) =>
    ProductVarientImages(
      json['id'] as int?,
      json['image_path'] as String,
    );

Map<String, dynamic> _$ProductVarientImagesToJson(
        ProductVarientImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_path': instance.image,
    };
