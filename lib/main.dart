import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calc"),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: const InputPage(),
      )));
}
