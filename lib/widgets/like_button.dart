import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/utils.dart';

class LikeButton extends StatefulWidget {
  final ColorWithLike color;

  const LikeButton({Key key, @required this.color}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: getLikeIconForColor(widget.color),
      onPressed: () {
        setState(() {
          widget.color.isLiked = !widget.color.isLiked;
        });
      },
    );
  }
}
