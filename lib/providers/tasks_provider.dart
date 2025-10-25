import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';

class TasksDataProvider extends ChangeNotifier {
  // كائن يحتوي على البيانات ويقدر يبلغ الآخرين عند التغيير  -> ChangeNotifier
  //widgets هون بنعرف القيمة المشتركة بين ال

  List<TaskModel> tasks = [];

  void addTask(String taskTitle) {
    tasks.add(TaskModel(taskTitle: taskTitle));

    notifyListeners();
    // اللي استخدنا فيها التاسك انو القيمة تغيرت widgets لحتى يتم اعلام ال
  }

  void updateCompletedTask(TaskModel task) {
    task.toggeleCompleted();
    notifyListeners();
    // اللي استخدنا فيها التاسك انو القيمة تغيرت widgets لحتى يتم اعلام ال
  }

  void deleteTask(TaskModel task) {
    tasks.remove(task);
    notifyListeners();
    // اللي استخدنا فيها التاسك انو القيمة تغيرت widgets لحتى يتم اعلام ال
  }

  void updateTaskTitle(String taskTitle, TaskModel task) {
    task.updateTaskTitle(taskTitle);
    notifyListeners();
    // اللي استخدنا فيها التاسك انو القيمة تغيرت widgets لحتى يتم اعلام ال
  }
}
