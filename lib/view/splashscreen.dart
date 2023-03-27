import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machin_test_mumbai/view/columnrowadding.dart';
import 'package:machin_test_mumbai/view/wigets/customtext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 33, 54),
      body: Center(
        child: CustomFont(text: 'Just Search', size: 20),
      ),
    );
  }
}

splashFun() async {
  await Future.delayed(const Duration(seconds: 2))
      .then((value) => Get.off(const ColumnRowAdding()));
}
