import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/widgets/custom_task.dart';

class CustomTasksList extends StatefulWidget {
  // add task واللي جابها من ال TasksScreens بنستقبل قائمة المهام من 
  final List<TaskModel> tasksList;
  const CustomTasksList({super.key, required this.tasksList});

  @override
  State<CustomTasksList> createState() => _CustomTasksListState();
}

class _CustomTasksListState extends State<CustomTasksList> {
  @override
  Widget build(BuildContext context) {
    //   إذا ما في مهام  
    if (widget.tasksList.isEmpty) {
      return Center(
        child: Text(
          "No Tasks!!",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      );
    }

    // عرض قائمة المهام
    return ListView.builder(
      itemCount: widget.tasksList.length,
      itemBuilder: (context, index) {
        return CustomTask(
          task: widget.tasksList[index],
          //  checkbox لما المستخدم يضغط على 
          onUserChange: (value) {
            setState(() {
              // نبدل حالة المهمة (مكتملة او غير مكتملة)
              widget.tasksList[index].toggeleCompleted();
            });
          },
        );
      },
    );
  }
}