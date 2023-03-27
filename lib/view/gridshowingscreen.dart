import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machin_test_mumbai/main.dart';
import 'package:machin_test_mumbai/view/wigets/customtext.dart';
import 'package:machin_test_mumbai/view/wigets/customtextfield.dart';

import '../core/const/const.dart';

class GridSearch extends StatefulWidget {
  @override
  _GridSearchState createState() => _GridSearchState();
}

class _GridSearchState extends State<GridSearch> {
  TextEditingController searchController = TextEditingController();
  String search = '';

  void createGrid() {
    grid = List.generate(
      m,
      (i) => List.generate(
        n,
        (j) => '',
      ),
    );
    highlight = List.generate(
      m,
      (i) => List.generate(
        n,
        (j) => false,
      ),
    );
  }

  void searchGrid() {
    setState(() {
      search = searchController.text;
      highlight = List.generate(
        m,
        (i) => List.generate(
          n,
          (j) => false,
        ),
      );
      if (search.isNotEmpty) {
        for (int i = 0; i < m; i++) {
          for (int j = 0; j < n; j++) {
            if (grid[i][j].toLowerCase() == search[0].toLowerCase()) {
              // Check for left to right direction
              if (j + search.length <= n) {
                bool found = true;
                for (int k = 1; k < search.length; k++) {
                  if (grid[i][j + k].toLowerCase() != search[k].toLowerCase()) {
                    found = false;
                    break;
                  }
                }
                if (found) {
                  for (int k = 0; k < search.length; k++) {
                    highlight[i][j + k] = true;
                  }
                }
              }
              // Check for top to bottom direction
              if (i + search.length <= m) {
                bool found = true;
                for (int k = 1; k < search.length; k++) {
                  if (grid[i + k][j].toLowerCase() != search[k].toLowerCase()) {
                    found = false;
                    break;
                  }
                }
                if (found) {
                  for (int k = 0; k < search.length; k++) {
                    highlight[i + k][j] = true;
                  }
                }
              }
              // Check for diagonal direction
              if (i + search.length <= m && j + search.length <= n) {
                bool found = true;
                for (int k = 1; k < search.length; k++) {
                  if (grid[i + k][j + k].toLowerCase() !=
                      search[k].toLowerCase()) {
                    found = false;
                    break;
                  }
                }
                if (found) {
                  for (int k = 0; k < search.length; k++) {
                    highlight[i + k][j + k] = true;
                  }
                }
              }
            }
          }
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createGrid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 46, 91),
        title: const Text('Grid Search'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  khieght,
                  khieght,
                  Customtext(
                      text: 'Enter the alphabets for the grid:', size: 16),
                  khieght,
                  m == 0 || n == 0
                      ? const SizedBox()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: n,
                          ),
                          itemCount: m * n,
                          itemBuilder: (context, index) {
                            int i = index ~/ n;
                            int j = index % n;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextFileds(
                                len: 1,
                                onchaged: (value) {
                                  setState(() {
                                    grid[i][j] = value;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                  khieght,
                  khieght,
                  khieght,
                  khieght,
                  Customtext(text: 'Enter the text to search:', size: 16),
                  khieght,
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder()),
                    onChanged: (value) {
                      setState(() {
                        search = value;
                      });
                    },
                  ),
                  khieght,
                  khieght,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 48, 81)),
                    onPressed: searchGrid,
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
            khieght,
            khieght,
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Customtext(text: 'Grid :', size: 16),
            ),
            khieght,
            m == 0 || n == 0
                ? const SizedBox()
                : Padding(
                    padding: EdgeInsets.all(15.h),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: n,
                      ),
                      itemCount: m * n,
                      itemBuilder: (context, index) {
                        int i = index ~/ n;
                        int j = index % n;
                        return Container(
                          decoration: highlight[i][j]
                              ? BoxDecoration(
                                  color: const Color.fromARGB(255, 13, 68, 134),
                                  border: Border.all(),
                                )
                              : BoxDecoration(
                                  border: Border.all(),
                                ),
                          child: Center(
                            child: Text(
                              grid[i][j],
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
