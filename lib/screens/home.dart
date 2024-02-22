import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/headeritem.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "Study Lessons",
        description: "Study Comp117",
        isComplated: false),
    Task(
        type: TaskType.calendar,
        title: "Run 5K",
        description: "Run 5 kilometers",
        isComplated: false),
    Task(
        type: TaskType.contest,
        title: "Go to party",
        description: "Attend to Party",
        isComplated: false),
  ];

  List<Task> completed = [
    Task(
        type: TaskType.note,
        title: "Game Meetup",
        description: "Study Comp117",
        isComplated: true),
    Task(
        type: TaskType.calendar,
        title: "Take Out Trash",
        description: "Take out trash",
        isComplated: true),
  ];

  void addNewTask(Task newtask) {
    setState(() {
      todo.add(newtask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //Header
              const HeaderItem(),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          return TodoItem(task: todo[index]);
                        }),
                  ),
                ),
              ),
              //Complated Text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              //Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: completed.length,
                        itemBuilder: (context, index) {
                          return TodoItem(task: completed[index]);
                        }),
                  ),
                ),
              ),
              //New Task Button
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                        addNewTask: (newtask) => addNewTask(newtask),
                      ),
                    ));
                  },
                  child: const Text("Add new task")),
            ],
          ),
        ),
      ),
    );
  }
}
