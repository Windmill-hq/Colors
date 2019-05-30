import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/data_source/color_data_source.dart';
import 'package:kotlin_night_2019_app/models/colors_model.dart';
import 'package:kotlin_night_2019_app/sreens/home_screen.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorsModel>(
      builder: (_) => ColorsModel(
            ColorDataSource(),
            colors: ColorWithLike.convertFromListColors(initColors),
          ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kotlin Night App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
