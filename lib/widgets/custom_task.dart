import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/utils/colors_helpers.dart';

class CustomTask extends StatelessWidget {
    CustomTask({super.key, required this.task, required this.onUserChange});
  final TaskModel task;
  final Function(bool?)? onUserChange;

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.taskTitle,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: secondaryColor,
        value: task.isCompleted,
        onChanged: onUserChange,
      ),
    );
  }
}

 

/*

* local state -> بتتغير على صعيدها widget ال  


*/