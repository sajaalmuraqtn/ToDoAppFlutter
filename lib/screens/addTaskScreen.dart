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

        //  حقل  كتابة عنوان المهمة
        TextField(
          style: TextStyle(fontSize: 25),
          cursorColor: primaryColor,
          textAlign: TextAlign.center,
          autofocus: true, 
          controller: controller,
        ),

        SizedBox(height: 30),

        //  زر لإضافة المهمة
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          onPressed: () {
            // إذا ما كتب المستخدم أي شيء، ما يعمل شيء
            if (controller.text.trim().isEmpty) return;

            //  إنشاء كائن جديد من المهمة وهي المهمة اللي رح تنضاف 
            TaskModel newTask = TaskModel(
              taskTitle: controller.text,
              isCompleted: false,
            );

            //  (TasksScreens) نرجع المهمة الجديدة للشاشة السابقة 
            //  رح نمرر قيمة المهمة الجديدة لصفحة التاسكات لحتى يضيفها للقائمة
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