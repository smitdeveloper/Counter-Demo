import 'package:flutter/material.dart';
import 'package:task2/app/presentation/counter_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Task',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const CounterScreen(),
    );
  }
}
