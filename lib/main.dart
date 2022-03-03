import 'package:calculator/multiple_function_calculator.dart';
import 'package:calculator/option.dart';
import 'package:calculator/single_function_calculator.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/single_function',
      routes: {
        '/': (context) => const Option(),
        '/multiple_function': (context) => const MultipleFunctionCalculator(),
        '/single_function': (context) => const SingleFunctionCalculator(),
      },
    );
  }
}
