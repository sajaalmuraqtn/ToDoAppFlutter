import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/utils/colors_helpers.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Add Task",
          style: TextStyle(
            fontSize: 30,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),

        TextField(
          style: TextStyle(fontSize: 25),
          cursorColor: primaryColor,
          textAlign: TextAlign.center,
          autofocus: true,
          controller: controller,
        ),
        SizedBox(height: 30),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {
            if (controller.text.trim().isEmpty) return;
            
            //   أنشئ التاسك الجديد
            TaskModel newTask = TaskModel(
              taskTitle: controller.text,
              isCompleted: false,
            );

            //   أرجعه عند إغلاق الشاشة
            Navigator.pop(context, newTask);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Add",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
