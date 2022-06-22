import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Cature(),
    );
  }
}

class Cature extends StatelessWidget {
  const Cature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  }
}