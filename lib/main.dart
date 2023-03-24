import 'package:flutter/material.dart';
import 'package:machin_test_mumbai/view/columnrowadding.dart';
import 'package:machin_test_mumbai/view/gridshowingscreen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grid Search',
      home: ColumnRowAdding(),
    );
  }
}

int m = 0;
int n = 0;
List<List<String>> grid = [];
List<List<bool>> highlight = [];
