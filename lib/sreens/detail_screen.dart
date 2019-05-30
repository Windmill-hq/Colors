import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/widgets/widgets.dart';

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
            LikeButton(color: widget.color),
          ],
        ),
        body: Container(color: widget.color.color));
  }
}
