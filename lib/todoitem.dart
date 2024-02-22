import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isComplated ? Colors.blueGrey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          widget.task.type == TaskType.note
              ? Image.asset("lib/assets/images/category1.png")
              : widget.task.type == TaskType.contest
                  ? Image.asset("lib/assets/images/category3.png")
                  : Image.asset("lib/assets/images/category2.png"),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.task.title,
                  style: TextStyle(
                      decoration: widget.task.isComplated
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
                Text(
                  widget.task.description,
                  style: TextStyle(
                    decoration: widget.task.isComplated
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
          Checkbox(
              value: widget.task.isComplated,
              onChanged: (val) => {
                    setState(
                      () {
                        widget.task.isComplated = !widget.task.isComplated;
                        isChecked = val!;
                      },
                    )
                  })
        ]),
      ),
    );
  }
}
