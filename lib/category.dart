import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

TaskType taskType = TaskType.note;

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    List<String> categoryimages = [
      "lib/assets/images/category1.png",
      "lib/assets/images/category2.png",
      "lib/assets/images/category3.png"
    ];
    List<TaskType> categories = [
      TaskType.note,
      TaskType.calendar,
      TaskType.contest
    ];
    return SingleChildScrollView(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemCount: categoryimages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 300),
                      content: Text("Category Selected"),
                    ),
                  );
                  setState(() {
                    mytasktype = categories[index];
                  });
                },
                child: Image.asset(categoryimages[index]),
              );
            }),
      ),
    );
  }
}
