import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: "data")
  ProductDetails data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ProductDetails {
  int id;
  String name;
  String description;
  @JsonKey(name: 'brand_id')
  int brandId;
  List<Variation> variations;
  List<AvaiableProperty> avaiableProperties;
  String brandName;
  String brandImage;

  ProductDetails({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    required this.variations,
    required this.avaiableProperties,
    required this.brandName,
    required this.brandImage,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}

@JsonSerializable()
class AvaiableProperty {
  String property;
  List<Value> values;

  AvaiableProperty({
    required this.property,
    required this.values,
  });

  factory AvaiableProperty.fromJson(Map<String, dynamic> json) =>
      _$AvaiablePropertyFromJson(json);

  Map<String, dynamic> toJson() => _$AvaiablePropertyToJson(this);
}

@JsonSerializable()
class Value {
  String value;
  int id;

  Value({
    required this.value,
    required this.id,
  });

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

  Map<String, dynamic> toJson() => _$ValueToJson(this);
}

@JsonSerializable()
class Variation {
  int id;
  int price;
  int quantity;
  bool inStock;
  @JsonKey(name: 'ProductVarientImages')
  List<ProductVarientImage> productVarientImages;
  List<ProductPropertiesValue> productPropertiesValues;

  Variation({
    required this.id,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVarientImages,
    required this.productPropertiesValues,
  });

  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
}

@JsonSerializable()
class ProductPropertiesValue {
  String value;
  String property;

  ProductPropertiesValue({
    required this.value,
    required this.property,
  });

  factory ProductPropertiesValue.fromJson(Map<String, dynamic> json) =>
      _$ProductPropertiesValueFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPropertiesValueToJson(this);
}

@JsonSerializable()
class ProductVarientImage {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "image_path")
  String imagePath;
  @JsonKey(name: "product_varient_id")
  dynamic productVarientId;

  ProductVarientImage({
    required this.id,
    required this.imagePath,
    required this.productVarientId,
  });

  factory ProductVarientImage.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVarientImageToJson(this);
}
