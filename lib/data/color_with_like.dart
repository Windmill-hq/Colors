import 'package:flutter/material.dart';

class ColorWithLike {
  Color color;
  bool isLiked;

  ColorWithLike({this.color, this.isLiked}) {
    isLiked ??= false;
  }

  static List<ColorWithLike> convertFromListColors(List<Color> inColors) {
    return inColors.map((inColor) => ColorWithLike(color: inColor)).toList();
  }
}
