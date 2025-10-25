import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/providers/tasks_provider.dart';
import 'package:to_do_app/utils/colors_helpers.dart';

class UpdateTaskScreen extends StatelessWidget {
  UpdateTaskScreen({super.key, required this.task}) {
    // ✅ هنا نعيّن القيمة الابتدائية للـ controller
    controller.text = task.taskTitle;
  }

  final TaskModel task;
  late TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Update Task",
          style: TextStyle(
            fontSize: 30,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),

        // ✅ حقل نصي فيه العنوان الحالي
        TextField(
          style: TextStyle(fontSize: 25),
          cursorColor: primaryColor,
          textAlign: TextAlign.center,
          autofocus: true,
          controller: controller,
        ),

        SizedBox(height: 30),

        // ✅ زر التحديث
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {
            if (controller.text.trim().isEmpty) return;

            Provider.of<TasksDataProvider>(
              context,
              listen: false,
            ).updateTaskTitle(controller.text, task);

            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Update",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
