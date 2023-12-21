import 'package:flutter/material.dart';
import 'package:slash_intern_task/core/theming/colors.dart';

// this is just mock for variations
// useless class
class Variation {
  final int indext; //product indext
  final List<Color> colors;
  final List<String> sizes;
  final List<String> materials;

  Variation(this.indext, this.colors, this.sizes, this.materials);

  factory Variation.getFakeVariation(index) {
    return getVariation(index);
  }
}

Variation getVariation(int index) {
  switch (index) {
    case 22:
      return index0;
    case 21:
      return index1;
    case 20:
      return index2;
    case 18:
      return index3;
    case 16:
      return index4;

    default:
      return index0;
  }
}

Variation index0 = Variation(0, [], [], []); //wall painting
Variation index1 = Variation(
    1,
    [ColorsManager.dark, ColorsManager.mainBlue, ColorsManager.maron],
    ['1 m', '1.5 m'],
    ['wool']); //scarf1
Variation index2 = Variation(
    2,
    [ColorsManager.dark, ColorsManager.gray, ColorsManager.moreLightGray],
    [' one size'],
    ['coton', 'Ymaterial']); //hijab light
Variation index3 = Variation(3, [
  ColorsManager.mainBlue,
  ColorsManager.dark,
  ColorsManager.maron,
  ColorsManager.moreLightGray,
  ColorsManager.gray
], [
  'S',
  'L',
  'M',
  'XL'
], [
  'coton',
  'polyester',
  'Xmaterial'
]); //hoodi
Variation index4 = Variation(4, [], [], ['wool', 'coton']); //Scarf2
