// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: ProductDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      brandId: json['brand_id'] as int,
      variations: (json['variations'] as List<dynamic>)
          .map((e) => Variation.fromJson(e as Map<String, dynamic>))
          .toList(),
      avaiableProperties: (json['avaiableProperties'] as List<dynamic>)
          .map((e) => AvaiableProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      brandName: json['brandName'] as String,
      brandImage: json['brandImage'] as String,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'brand_id': instance.brandId,
      'variations': instance.variations,
      'avaiableProperties': instance.avaiableProperties,
      'brandName': instance.brandName,
      'brandImage': instance.brandImage,
    };

AvaiableProperty _$AvaiablePropertyFromJson(Map<String, dynamic> json) =>
    AvaiableProperty(
      property: json['property'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvaiablePropertyToJson(AvaiableProperty instance) =>
    <String, dynamic>{
      'property': instance.property,
      'values': instance.values,
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
      value: json['value'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'value': instance.value,
      'id': instance.id,
    };

Variation _$VariationFromJson(Map<String, dynamic> json) => Variation(
      id: json['id'] as int,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      inStock: json['inStock'] as bool,
      productVarientImages: (json['ProductVarientImages'] as List<dynamic>)
          .map((e) => ProductVarientImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      productPropertiesValues: (json['productPropertiesValues']
              as List<dynamic>)
          .map(
              (e) => ProductPropertiesValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VariationToJson(Variation instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'inStock': instance.inStock,
      'ProductVarientImages': instance.productVarientImages,
      'productPropertiesValues': instance.productPropertiesValues,
    };

ProductPropertiesValue _$ProductPropertiesValueFromJson(
        Map<String, dynamic> json) =>
    ProductPropertiesValue(
      value: json['value'] as String,
      property: json['property'] as String,
    );

Map<String, dynamic> _$ProductPropertiesValueToJson(
        ProductPropertiesValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'property': instance.property,
    };

ProductVarientImage _$ProductVarientImageFromJson(Map<String, dynamic> json) =>
    ProductVarientImage(
      id: json['id'] as int,
      imagePath: json['image_path'] as String,
      productVarientId: json['product_varient_id'],
    );

Map<String, dynamic> _$ProductVarientImageToJson(
        ProductVarientImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_path': instance.imagePath,
      'product_varient_id': instance.productVarientId,
    };
