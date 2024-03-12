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
        body: const Column(
          children: [
            TodoList(
                title: "To Do",
                textColor: 0xff077522,
                backgroundColor: 0xffFF8181),
            TodoList(
                title: "To Schedule",
                textColor: 0xff6677BB,
                backgroundColor: 0xffFCE38A),
            TodoList(
                title: "To Delegate",
                textColor: 0xffBA55D3,
                backgroundColor: 0xffEAFFD0),
            TodoList(
                title: "To Delete",
                textColor: 0xff569889,
                backgroundColor: 0xff95E1D3),
          ],
        ));
  }
}

class TodoList extends StatelessWidget {
  final String title;
  final int textColor;
  final int backgroundColor;

  const TodoList({
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
