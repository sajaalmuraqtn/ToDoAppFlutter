import 'package:flutter/material.dart';
import 'package:to_do_app/providers/tasks_provider.dart';
import 'package:to_do_app/screens/tasks_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      /* 
      المستخدم provider انو هذا ال widgets بنعرف ال  
      واي تعديل بالقيمة اللي فيه هتتغير بالبقية
      */
      create: (context) => TasksDataProvider(),
     child:  MaterialApp(debugShowCheckedModeBanner: false, home: TasksScreens()),
    );
  }
}
