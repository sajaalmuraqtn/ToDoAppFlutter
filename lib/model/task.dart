class TaskModel{
    String taskTitle;
    bool isCompleted=false; //by default is false
   
   void toggeleCompleted(){
    isCompleted=!isCompleted;
    //completeتعكس حالة ال  
    //if true -> false & if false -> true
   }
   void updateTaskTitle(String newTaskTitle){
    taskTitle= newTaskTitle;
    //completeتعكس حالة ال  
    //if true -> false & if false -> true
   }
  TaskModel({required this.taskTitle});
}