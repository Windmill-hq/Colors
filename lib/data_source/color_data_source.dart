import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kotlin_night_2019_app/data/response_color.dart';

class ColorDataSource {
  loadColor() async {
    final response = await http.get('http://www.colr.org/json/color/random');
    if (response.statusCode == 200) {
      return ResponseColor.fromJson(json.decode(response.body)).newColor;
    } else {
      throw Exception('Failed to load color with response = $response');
    }
  }
}
