import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:kotlin_night_2019_app/data/response_color.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<Color> _colors;

//  @override
//  void initState() {
//    _colors = List()..addAll(initColors);
//    super.initState();
//  }

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
        itemCount: initColors.length,
//        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return Container(
              width: double.infinity,
              height: 100,
              // replace initColors to _colors
              color: initColors[index].withOpacity(0.5));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
//        onPressed: _addRandomColor,
      ),
    );
  }

//  _addRandomColor() async {
//    Color newColor = await loadColor();
//    setState(() {
//      _colors.add(newColor);
//    });
//  }
}

//loadColor() async {
//  final response = await http.get('http://www.colr.org/json/color/random');
//  if (response.statusCode == 200) {
//    String newColorStr =
//        ResponseColor.fromJson(json.decode(response.body)).newColor;
//    return hexToColor(newColorStr);
//  } else {
//    throw Exception('Failed to load color with response = $response');
//  }
//}

//Color hexToColor(String code) {
//  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
//}
