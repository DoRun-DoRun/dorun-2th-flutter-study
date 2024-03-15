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
      subTitle: 'Urgent, Important Things.',
      backgroundColor: 0xffFF8181,
      textColor: 0xff077522,
    ),
    TodoCategory(
      title: "To Schedule",
      subTitle: 'Not Urgent, Important Things.',
      backgroundColor: 0xffFCE38A,
      textColor: 0xff6677BB,
    ),
    TodoCategory(
      title: "To Delegate",
      subTitle: 'Urgent, Not Important Things.',
      backgroundColor: 0xffEAFFD0,
      textColor: 0xffBA55D3,
    ),
    TodoCategory(
      title: "To Delete",
      subTitle: 'Not Urgent, Important Things.',
      backgroundColor: 0xff95E1D3,
      textColor: 0xff569889,
    ),
  ];

  int activeIndex = initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreatePage(onTap: createTodoItem),
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ),
      body: Column(
        children: [
          for (int i = 0; i < 4; i++)
            TodoContainer(
              onTap: () => setActiveIndex(i),
              isSelected: activeIndex == i,
              isInitial: activeIndex == initialIndex,
              todoCategory: todoCategories[i],
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
    if (index == activeIndex) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Slide Right OverFlow action overflow -> clip'),
        ),
      );
    }
    if (index != activeIndex) {
      setState(() {
        activeIndex = index;
      });
    }
  }
}

class TodoContainer extends StatelessWidget {
  const TodoContainer({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.todoCategory,
    required this.isInitial,
  });

  final Function() onTap;
  final bool isSelected;
  final bool isInitial;
  final TodoCategory todoCategory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isSelected ? 3 : 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          color: Color(todoCategory.backgroundColor),
          child: Column(
            children: [
              Text(
                todoCategory.title,
                style: TextStyle(
                    color: Color(todoCategory.textColor),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              isSelected
                  ? TodoListBuilder(
                      list: todoCategory.itemList,
                      textColor: todoCategory.textColor)
                  : const SizedBox(),
              isInitial
                  ? Text(
                      todoCategory.subTitle,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(todoCategory.textColor),
                      ),
                    )
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
    required this.textColor,
  });

  final List<TodoItem> list;
  final int textColor;

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? Text(
            'ALL DONE !\nClick + Button To Add Todo Items!',
            style: TextStyle(
              fontSize: 20,
              color: Color(widget.textColor),
            ),
          )
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
                        fontSize: 20,
                        color: Color(widget.textColor),
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
  final String subTitle;
  final int backgroundColor;
  final int textColor;
  final List<TodoItem> itemList = [];

  TodoCategory({
    required this.title,
    required this.subTitle,
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

const int initialIndex = -1;
