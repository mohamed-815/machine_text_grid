import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machin_test_mumbai/main.dart';
import 'package:machin_test_mumbai/view/gridshowingscreen.dart';

class ColumnRowAdding extends StatefulWidget {
  const ColumnRowAdding({super.key});

  @override
  State<ColumnRowAdding> createState() => _ColumnRowAddingState();
}

class _ColumnRowAddingState extends State<ColumnRowAdding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Row Column'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of rows (m)',
              ),
              onChanged: (value) {
                setState(() {
                  m = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of columns (n)',
              ),
              onChanged: (value) {
                setState(() {
                  n = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(GridSearch());
                log(highlight.toString());
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
