import 'package:flutter/material.dart';

TextField CustomTextFiled(
    {required String lebel,
    required void Function(String) onchaged,
    int? len}) {
  return TextField(
      maxLength: len,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 197, 195, 195))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        labelText: lebel,
      ),
      onChanged: onchaged);
}

TextField CustomTextFileds(
    {String? lebel, required void Function(String) onchaged, int? len}) {
  return TextField(
      maxLength: len,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Color.fromARGB(255, 36, 34, 34)),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color.fromARGB(255, 50, 46, 46)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 49, 45, 45))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 40, 37, 37))),
        labelText: lebel,
      ),
      onChanged: onchaged);
}
