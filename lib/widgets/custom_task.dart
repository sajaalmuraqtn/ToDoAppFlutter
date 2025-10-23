import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/utils/colors_helpers.dart';

class CustomTask extends StatelessWidget {
  CustomTask({super.key, required this.task, required this.onUserChange});

  final TaskModel task; // المهمة المعروضة حاليا
  final Function(bool?)? onUserChange; // دالة تُستدعى عند تغيير حالة المهمة

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //   عنوان المهمة
      title: Text(
        task.taskTitle,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          //  إذا المهمة مكتملة  
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),

      //   لتحديد إنجاز المهمةCheckbox
      trailing: Checkbox(
        activeColor: secondaryColor,
        value: task.isCompleted,
        onChanged: onUserChange, //(CustomTasksList) نرسل التغيير للأب 
      ),
    );
  }
}
 