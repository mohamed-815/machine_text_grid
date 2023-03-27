import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:machin_test_mumbai/view/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grid Search',
            home: SplashScreen(),
          );
        });
  }
}

int m = 0;
int n = 0;
List<List<String>> grid = [];
List<List<bool>> highlight = [];
