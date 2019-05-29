import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kotlin_night_2019_app/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/data/response_color.dart';

import '../constants.dart';
import '../utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<ColorWithLike> _colors;
//
//  @override
//  void initState() {
//    _colors = List()
//      ..addAll(
//        ColorWithLike.convertFromListColors(initColors),
//      );
//    super.initState();
//  }
  List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _colors = List()..addAll(initColors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presentation app"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(height: 8);
        },
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return Container(
              width: double.infinity,
              height: 100,
              color: _colors[index].withOpacity(0.5));
        },
//        itemCount: _colors.length,
//        itemBuilder: (context, index) {
//          return InkWell(
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => DetailScreen(
//                        color: _colors[index],
//                      ),
//                ),
//              );
//            },
//            child: ColorItem(colorWithLike: _colors[index]),
//          );
//        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addRandomColor,
      ),
    );
  }

//  _addRandomColor() async {
//    Color newColor = await loadColor();
//    setState(() {
//      _colors.add(ColorWithLike(color: newColor));
//    });
//  }
  _addRandomColor() async {
    Color newColor = await loadColor();
    setState(() {
      _colors.add(newColor);
    });
  }
}

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
      color: widget.colorWithLike.color.withOpacity(0.5),
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

loadColor() async {
  final response = await http.get('http://www.colr.org/json/color/random');
  if (response.statusCode == 200) {
    String newColorStr =
        ResponseColor.fromJson(json.decode(response.body)).newColor;
    return hexToColor(newColorStr);
  } else {
    throw Exception('Failed to load color with response = $response');
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
}
