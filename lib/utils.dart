import 'package:flutter/material.dart';

import 'data/color_with_like.dart';

Icon getLikeIconForColor(ColorWithLike color) {
  return color.isLiked
      ? Icon(
          Icons.favorite,
          color: Colors.red,
        )
      : Icon(Icons.favorite_border, color: Colors.red);
}
