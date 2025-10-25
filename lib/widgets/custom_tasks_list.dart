import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/providers/tasks_provider.dart';
import 'package:to_do_app/widgets/custom_task.dart';

class CustomTasksList extends StatelessWidget {
  const CustomTasksList({super.key});

  @override
  Widget build(BuildContext context) {
     return Consumer<TasksDataProvider>(
      builder: (context, tasksProvider, child) {
        //   إذا ما في مهام
        if (tasksProvider.tasks.isEmpty) {
          return Center(
            child: Text(
              "No Tasks!!",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          itemCount: tasksProvider.tasks.length,
          itemBuilder: (context, index) {
            return CustomTask(
              task: tasksProvider.tasks[index],
              //  checkbox لما المستخدم يضغط على
              onUserChange: (value) {
                // نبدل حالة المهمة (مكتملة او غير مكتملة)
              tasksProvider.updateCompletedTask(tasksProvider.tasks[index]);
              },
              deleteTask: () {
              tasksProvider.deleteTask(tasksProvider.tasks[index]);
              },
              
            );
          },
        );
      },
    );
  }
}
