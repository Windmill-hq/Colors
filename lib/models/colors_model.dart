import 'package:flutter/foundation.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/data_source/color_data_source.dart';
import 'package:kotlin_night_2019_app/utils.dart';

class ColorsModel extends ChangeNotifier {
  ColorDataSource _dataSource;
  List<ColorWithLike> _colors;
  List<ColorWithLike> get colors => _colors;

  ColorsModel(ColorDataSource dataSource, {List<ColorWithLike> colors}) {
    _colors = colors ?? List();
    _dataSource = dataSource;
  }

  addRandomColor() async {
    String colorStr = await _dataSource.loadColor();
    _colors.add(ColorWithLike(color: hexToColor(colorStr).withOpacity(0.5)));
    notifyListeners();
  }
}
