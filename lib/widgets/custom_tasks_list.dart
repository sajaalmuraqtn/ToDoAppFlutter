import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/widgets/custom_task.dart';

class CustomTasksList extends StatefulWidget {
  final List<TaskModel> tasksList;
  const CustomTasksList({super.key, required this.tasksList});

  @override
  State<CustomTasksList> createState() => _CustomTasksListState();
}

class _CustomTasksListState extends State<CustomTasksList> {
  @override
  Widget build(BuildContext context) {
    if (widget.tasksList.length == 0) {
      return Center(
        child: Text(
          "No Tasks!!",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.tasksList.length,
      itemBuilder: (context, index) {
        return CustomTask(
          task: widget.tasksList[index],
          onUserChange: (value) {
            setState(() {
              widget.tasksList[index].toggeleCompleted();
            });
          },
        );
      },
    );
  }
}
