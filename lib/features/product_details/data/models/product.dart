import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'data')
  final List<Product> products;
  Data(this.products);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'brand_id')
  final int brandId;
  @JsonKey(name: 'Brands')
  final Brands brands;
  // @JsonKey(name: 'product_rating')
  // final double rating;
  @JsonKey(name: 'ProductVariations')
  final List<ProductVariation> variations;
  final List<ProductProperty> _availableProperties = [];

  Product(
    this.id,
    this.name,
    this.description,
    this.brandId,
    this.brands,
    this.variations,
  );
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

extension _PropertyExten on Product {
  List<ProductProperty> get availableProperties => _availableProperties;
}

@JsonSerializable()
class Brands {
  final int id;
  @JsonKey(name: 'brand_name')
  final String? brandName;
  @JsonKey(name: 'brand_logo_image_path')
  final String? brandLogoUrl;
  Brands(this.brandName, this.brandLogoUrl, this.id);
  factory Brands.fromJson(Map<String, dynamic> json) => _$BrandsFromJson(json);
}

@JsonSerializable()
class ProductVariation {
  final int id;
  @JsonKey(name: 'product_id')
  final int productId;
  final num price; //conseder it int
  final int quantity;
  //final List<String> productVarientImages;
  @JsonKey(name: 'ProductVarientImages')
  final List<ProductVarientImages> productVarientImages;
  //List<ProductPropertyAndValue>? productPropertiesValues;

  ProductVariation(this.id, this.price, this.productVarientImages,
      this.productId, this.quantity);

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationFromJson(json);
}

@JsonSerializable()
class ProductVarientImages {
  final int? id;
  @JsonKey(name: 'image_path')
  final String image;

  ProductVarientImages(this.id, this.image);
  factory ProductVarientImages.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVarientImagesToJson(this);
}

class ProductProperty {
  final String? color;
  final String? size;
  final String? material;

  ProductProperty(this.color, this.size, this.material);
}

//@JsonSerializable()
class ProductPropertyAndValue {
  final String property; //color, or size, or material
  final String
      value; //if property is color, value may be: #008000(hex for Green)
  //if property is size, value may be: XL

  ProductPropertyAndValue(this.property, this.value);

  // factory ProductPropertyAndValue.fromJson(Map<String, dynamic> json) =>
  //     _$ProductPropertyAndValueFromJson(json);

  // Map<String, dynamic> toJson() => _$ProductPropertyAndValueToJson(this);
}
