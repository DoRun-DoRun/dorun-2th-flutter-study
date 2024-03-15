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
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TodoCategory> todoCategories = [
    TodoCategory(
      title: 'To Do',
      backgroundColor: 0xffFF8181,
      textColor: 0xff077522,
    ),
    TodoCategory(
      title: "To Schedule",
      backgroundColor: 0xffFCE38A,
      textColor: 0xff6677BB,
    ),
    TodoCategory(
      title: "To Delegate",
      backgroundColor: 0xffEAFFD0,
      textColor: 0xffBA55D3,
    ),
    TodoCategory(
      title: "To Delete",
      backgroundColor: 0xff95E1D3,
      textColor: 0xff569889,
    ),
  ];

  int activeIndex = initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreatePage(onTap: createTodoItem),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          for (int i = 0; i < 4; i++)
            TodoContainer(
              onTap: () => setActiveIndex(i),
              isSelected: activeIndex == i,
              title: todoCategories[i].title,
              textColor: todoCategories[i].textColor,
              backgroundColor: todoCategories[i].backgroundColor,
              todoItemList: todoCategories[i].itemList,
            ),
        ],
      ),
    );
  }

  void createTodoItem(int index, String title) {
    setState(() {
      todoCategories[index].addItem(title);
    });
  }

  setActiveIndex(int index) {
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
    required this.todoItemList,
  });
  final List<TodoItem> todoItemList;
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
              isSelected
                  ? TodoListBuilder(list: todoItemList)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoListBuilder extends StatefulWidget {
  const TodoListBuilder({
    super.key,
    required this.list,
  });

  final List<TodoItem> list;

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const Text('ALL DONE !\nClick + Button To Add Todo Items!')
        : ListView.builder(
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  setState(() {
                    widget.list.removeAt(index);
                  });
                },
                child: ListTile(
                  onTap: () {
                    setState(() {
                      widget.list[index].toggleChecked();
                    });
                  },
                  title: Text(
                    widget.list[index].title,
                    style: TextStyle(
                        decoration: widget.list[index].isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ),
              );
            },
          );
  }
}

class TodoCategory {
  final String title;
  final int backgroundColor;
  final int textColor;
  final List<TodoItem> itemList = [];

  TodoCategory({
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  });

  void addItem(String title) {
    itemList.add(TodoItem(title: title));
  }
}

class TodoItem {
  final String title;
  bool isChecked;

  TodoItem({required this.title, this.isChecked = false});

  void toggleChecked() {
    isChecked = !isChecked;
  }
}

const int initialIndex = 5;
