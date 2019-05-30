import 'package:flutter/material.dart';
import 'package:kotlin_night_2019_app/models/colors_model.dart';
import 'package:kotlin_night_2019_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

// Main points
// 1. Extract list in widget
// 2. Move logic to ColorsModel
// 3. Add ChangeNotifierProvider to main file
// 4. Add provider package

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presentation app"),
      ),
      body: ListWithColors(
        onItemClickListener: (clickedColor) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                    color: clickedColor,
                  ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: Provider.of<ColorsModel>(
          context,
          listen: false,
        ).addRandomColor,
      ),
    );
  }
}
