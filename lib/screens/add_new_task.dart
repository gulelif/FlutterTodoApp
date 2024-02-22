import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/category.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: deviceWidth,
                  height: deviceHeight / 10,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("lib/assets/images/add_new_task.png"),
                          fit: BoxFit.cover)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close,
                            size: 40, color: Colors.white),
                      ),
                      const Expanded(
                          child: Text(
                        "Add new task",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
                //Task Title
                const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Task Title")),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white),
                  ),
                ),
                //Categories
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Category"),
                      Category(),
                    ],
                  ),
                ),
                //Date and Time
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text("Date"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: dateController,
                                decoration: const InputDecoration(
                                    filled: true, fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          const Text("Time"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                //Notes
                const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Description")),
                SizedBox(
                  height: 300,
                  child: TextField(
                    controller: descriptionController,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true),
                  ),
                ),
                //Save Button
                ElevatedButton(
                    onPressed: () {
                      Task newtask = Task(
                          type: mytasktype,
                          title: titleController.text,
                          description: descriptionController.text,
                          isComplated: false);

                      widget.addNewTask(newtask);
                      Navigator.pop(context);
                    },
                    child: const Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
