import 'package:flutter/material.dart';
import 'package:untitled/practice.dart';
import 'package:untitled/presentation/screens/Home_Page.dart';

import 'presentation/screens/Products.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    );
  }
}
