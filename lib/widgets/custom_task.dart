import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/screens/updateTaskScreen.dart';
import 'package:to_do_app/utils/colors_helpers.dart';

class CustomTask extends StatelessWidget {
  CustomTask({super.key, required this.task, required this.onUserChange,required this.deleteTask});

  final TaskModel task; // المهمة المعروضة حاليا
  final Function(bool?)? onUserChange; // دالة تُستدعى عند تغيير حالة المهمة
  final Function()? deleteTask; // دالة تُستدعى عند تغيير حالة المهمة
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //   عنوان المهمة
      title: Row(
        children: [
          IconButton(onPressed:() { 
           showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                // لضبط المسافة مع الكيبورد
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: UpdateTaskScreen(task: task,),
                ),
              ),
            ),
          );
          } , icon: Icon(Icons.edit,color: Colors.red,size: 30,)),
          Text(
            task.taskTitle,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              //  إذا المهمة مكتملة  
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
     
      //   لتحديد إنجاز المهمةCheckbox
      trailing: Checkbox(
        activeColor: secondaryColor,
        value: task.isCompleted,
        onChanged: onUserChange, //(CustomTasksList) نرسل التغيير للأب 
      ),
      onLongPress:deleteTask
    );
  }
}
 