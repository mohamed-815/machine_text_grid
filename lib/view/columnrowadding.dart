import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machin_test_mumbai/main.dart';
import 'package:machin_test_mumbai/view/gridshowingscreen.dart';
import 'package:machin_test_mumbai/view/wigets/customtextfield.dart';

class ColumnRowAdding extends StatefulWidget {
  const ColumnRowAdding({super.key});

  @override
  State<ColumnRowAdding> createState() => _ColumnRowAddingState();
}

class _ColumnRowAddingState extends State<ColumnRowAdding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 49, 82),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 49, 82),
        title: Text('Add Row Column'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFiled(
              lebel: 'Number of rows (m)',
              onchaged: (value) {
                setState(() {
                  m = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFiled(
              lebel: 'Number of columns (n)',
              onchaged: (value) {
                setState(() {
                  n = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 34, 128)),
              onPressed: () {
                Get.to(GridSearch());
                log(highlight.toString());
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
