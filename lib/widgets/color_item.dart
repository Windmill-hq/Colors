import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';

import '../utils.dart';

class ColorItem extends StatefulWidget {
  final ColorWithLike colorWithLike;

  const ColorItem({Key key, this.colorWithLike}) : super(key: key);

  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: widget.colorWithLike.color,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: getLikeIconForColor(widget.colorWithLike),
          onPressed: () {
            setState(() {
              widget.colorWithLike.isLiked = !widget.colorWithLike.isLiked;
            });
          },
        ),
      ),
    );
  }
}
