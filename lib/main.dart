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
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreatePage(),
                  ),
                );
              },
              icon: Icon(Icons.plus_one),
            )
          ],
        ),
        body: Column(
          children: [
            todoList(
                title: "To Do", textColor: 0x077522, backgroundColor: 0xFF8181),
            todoList(
                title: "To Schedule",
                textColor: 0x6677BB,
                backgroundColor: 0xFCE38A),
            todoList(
                title: "To Delegate",
                textColor: 0xBA55D3,
                backgroundColor: 0xEAFFD0),
            todoList(
                title: "To Delete",
                textColor: 0x569889,
                backgroundColor: 0x95E1D3),
          ],
        ));
  }
}

class todoList extends StatelessWidget {
  final String title;
  final int textColor;
  final int backgroundColor;

  const todoList({
    super.key,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(backgroundColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color(textColor),
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
