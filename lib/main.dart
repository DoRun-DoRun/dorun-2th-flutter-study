import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 배경1: #FF8181
// 폰트1: #077522

// 배경2: #FCE38A
// 폰트2: #6677BB

// 배경3: #EAFFD0
// 폰트3: #BA55D3

// 배경4: #95E1D3
// 폰트4: #569889
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        todoList(
            title: "To Do", textColor: "#077522", backgroundColor: "#FF8181"),
        todoList(
            title: "To Schedule",
            textColor: "#6677BB",
            backgroundColor: "#FCE38A"),
        todoList(
            title: "To Delegate",
            textColor: "#BA55D3",
            backgroundColor: "#EAFFD0"),
        todoList(
            title: "To Delete",
            textColor: "#569889",
            backgroundColor: "#95E1D3"),
      ],
    ));
  }
}

class todoList extends StatelessWidget {
  final String title;
  final String textColor;
  final String backgroundColor;

  const todoList({
    super.key,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF95E1D3),
      child: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Color(0xFF569889),
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
