import 'package:flutter/material.dart';
import 'package:machin_test_mumbai/main.dart';

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
        title: Text('Grid Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text('Enter the alphabets for the grid:'),
                  SizedBox(height: 8.0),
                  m == 0 || n == 0
                      ? SizedBox()
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
                            return TextField(
                              maxLength: 1,
                              onChanged: (value) {
                                setState(() {
                                  grid[i][j] = value;
                                });
                              },
                            );
                          },
                        ),
                  SizedBox(height: 16),
                  SizedBox(height: 16.0),
                  Text('Enter the text to search:'),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        search = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: searchGrid,
                    child: Text('Search'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text('Grid:'),
            SizedBox(height: 8.0),
            m == 0 || n == 0
                ? SizedBox()
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                                color: Colors.yellow,
                                border: Border.all(),
                              )
                            : BoxDecoration(
                                border: Border.all(),
                              ),
                        child: Center(
                          child: Text(
                            grid[i][j],
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
