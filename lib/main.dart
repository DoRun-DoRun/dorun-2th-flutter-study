import 'package:dorun_2th_flutter_study/create_page.dart';
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
                  builder: (context) => const CreatePage(),
                ),
              );
            },
            icon: const Icon(Icons.plus_one),
          )
        ],
      ),
      body: Column(
        children: [
          TodoContainer(
              onTap: () => tapContainer(1),
              isSelected: activeIndex == 1,
              title: "To Do",
              textColor: 0xff077522,
              backgroundColor: 0xffFF8181),
          TodoContainer(
              onTap: () => tapContainer(2),
              isSelected: activeIndex == 2,
              title: "To Schedule",
              textColor: 0xff6677BB,
              backgroundColor: 0xffFCE38A),
          TodoContainer(
              onTap: () => tapContainer(3),
              isSelected: activeIndex == 3,
              title: "To Delegate",
              textColor: 0xffBA55D3,
              backgroundColor: 0xffEAFFD0),
          TodoContainer(
              onTap: () => tapContainer(4),
              isSelected: activeIndex == 4,
              title: "To Delete",
              textColor: 0xff569889,
              backgroundColor: 0xff95E1D3),
        ],
      ),
    );
  }

  int activeIndex = 0;

  tapContainer(int index) {
    setState(() {
      activeIndex = index;
    });
  }
}

class TodoContainer extends StatelessWidget {
  const TodoContainer({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.textColor,
    required this.backgroundColor,
  });

  final Function() onTap;
  final bool isSelected;
  final String title;
  final int textColor;
  final int backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isSelected ? 3 : 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          color: Color(backgroundColor),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(textColor),
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
