import 'package:flutter/material.dart';

Text CustomFont({required String text, required double size}) => Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),
    );

Text Customtext({required String text, required double size}) => Text(
      text,
      style: TextStyle(
          color: const Color.fromARGB(255, 40, 37, 37),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
