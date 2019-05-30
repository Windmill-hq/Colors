import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/data/color_with_like.dart';
import 'package:kotlin_night_2019_app/models/colors_model.dart';
import 'package:kotlin_night_2019_app/widgets/color_item.dart';
import 'package:provider/provider.dart';

class ListWithColors extends StatelessWidget {
  final Function(ColorWithLike color) onItemClickListener;

  const ListWithColors({Key key, @required this.onItemClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ColorWithLike> colors = Provider.of<ColorsModel>(context).colors;

    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 8);
      },
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onItemClickListener(colors[index]);
          },
          child: ColorItem(colorWithLike: colors[index]),
        );
      },
    );
  }
}
