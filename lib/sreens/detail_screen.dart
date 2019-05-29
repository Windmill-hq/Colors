import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';

import '../utils.dart';

class DetailScreen extends StatefulWidget {
  final ColorWithLike color;

  const DetailScreen({Key key, @required this.color}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail color"),
          actions: <Widget>[
            IconButton(
              icon: getLikeIconForColor(widget.color),
              onPressed: () {
                setState(() {
                  widget.color.isLiked = !widget.color.isLiked;
                });
              },
            )
          ],
        ),
        body: Container(color: widget.color.color));
  }
}
