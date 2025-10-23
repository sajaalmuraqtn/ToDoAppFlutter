import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/screens/addTaskScreen.dart';
import 'package:to_do_app/utils/colors_helpers.dart';
import 'package:to_do_app/widgets/custom_tasks_list.dart';

class TasksScreens extends StatefulWidget {
  const TasksScreens({super.key});

  @override
  State<TasksScreens> createState() => _TasksScreensState();
}

class _TasksScreensState extends State<TasksScreens> {
  List<TaskModel> allTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.assignment_turned_in_rounded, color: Colors.white, size: 35),
        title: Text("ToDo App", style: TextStyle(fontSize: 25, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await showModalBottomSheet<TaskModel>(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: AddTaskScreen(),
                ),
              ),
            ),
          );

           if (newTask != null) {
            setState(() {
              allTasks.add(newTask);
            });
          }
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${allTasks.length} Tasks",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(15),
              height: 570,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomTasksList(tasksList: allTasks),
            ),
          ],
        ),
      ),
    );
  }
}
