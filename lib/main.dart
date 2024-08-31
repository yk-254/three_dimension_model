import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:three_dimension_model/charactors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Test',
      debugShowCheckedModeBanner: false,
      home: Chars(),
    );
  }
}





